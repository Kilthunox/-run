set -xe

header="$1/$2.hpp"
file="$1/$2.cpp"
HEADER=${$2^^}_HPP
printf "#ifndef $HEADER \n #define $HEADER\n\n\n#endif" > $header;
printf "#include \"$2.hpp\"" >> $file



