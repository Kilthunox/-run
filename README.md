# run

run is a simple CLI program written in c++ for Linux to macro shell scripts to aid in workflow automation.



# Compile
Compile from source using g++.
```
g++ src/*.cpp -std=c++17 -o run
```


# Install
1. Move the newly compiled run.64 executable to where you want the application to live in it's own directory.
```
mv run.64 ~/Applications/run/run
```

2. Expose the `run` directory to `PATH` in the `.bashrc` file.

`~/.bashrc`
```
...
export PATH=$PATH:~/Applications/run/
```


3. Create a global automation script.
```
cd ~/
mkdir run
cd run
printf "#!/bin/bash \necho $1" > echo.sh
```

4. Restart the terminal.

# Usage
run searches for global scripts first, then local scripts from the working directory override global scripts.
Test if the new echo script was installed by using this script from any directory:
```
run echo HelloWorld
```
-> HelloWorld 


Adding a `run/` directory to the root of your project allows project-specific automations. 

`~/projects/project/run/echo.sh`
```
#!/bin/bash
echo $PWD
```

Test the script from `~/projects/project/.`:
```
run echo HelloWorld 
```
-> ~/projects/project/

The working directory is printed because the local script has overwritten the global script.

Ensure that all run scripts have a `.sh` file extension. All other files will be ignored.
