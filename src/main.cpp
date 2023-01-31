#include <filesystem>
#include <fstream>
#include <string>
#include <map>
#include <iostream>


const std::filesystem::path HOME_DIR {std::string("/home/") + std::getenv("USER")};
const std::string CONFIG_DIR {".fn/"};
std::map<std::string, std::string> funcs {};


std::string read_file(const std::string &file_path) {
	std::string data;
	std::ifstream file;
	std::stringstream buffer;
	if (std::filesystem::exists(file_path)) {
		buffer << file.rdbuf();
		data = buffer.str();
	}
	return data;
}


std::string get_filename(const std::string &file_path) {
    std::string::size_type const filename(file_path.find_last_of('/'));
	std::string filename_without_extension = file_path.substr(filename + 1);
	return filename_without_extension;
}


void load_funcs(std::filesystem::path dir) {
	if (std::filesystem::exists(dir / CONFIG_DIR)) {
		for (auto const &file: std::filesystem::recursive_directory_iterator{dir / CONFIG_DIR}) {
			funcs[get_filename(file.path().string())] = file.path().string();
		}
	}

}


void call_func(std::string &func_id) {
	std::system(funcs[func_id].c_str());
}


int main(int argc, char** argv) {
	if (argc > 1) {
		std::string arg {argv[1]};
		load_funcs(HOME_DIR);
		load_funcs(std::filesystem::current_path());
		if (arg == "-l" || arg == "--list") {
			for (auto const& [func_id, func] : funcs) {
				std::cout << func_id << ": " << func << std::endl; 
			} 
		} else if (funcs.find(arg) != funcs.end()) {
			std::string command;
			for (int i=2; i < argc; ++i) {
				command += std::string(" ") + argv[i];
			}
			std::system(command.c_str());
		} else {
			std::cout << arg << ": function not found" << std::endl;
		} 
	} 
}
