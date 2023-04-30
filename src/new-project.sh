#!/bin/bash

mkdir $1;
cd $1;

mkdir bin src env inc doc mtl run log tst;
touch README.md;

touch env/activate;
chmod +x env/activate;
printf "#!/bin/bash\n export CPLUS_INCLUDE_PATH=\$PWD/inc:" >> env/activate;

touch run/build.sh;
chmod +x run/build.sh;
printf "#!/bin/bash\n g++ \$1 -std=c++20 \$PWD/src/*.cpp -I include/ -L lib/ -lraylib -o \$PWD/bin/main.64" >> run/build.sh;

touch src/main.cpp;
printf "\n\n\nint main() {\n\n}\n" >> src/main.cpp;

touch .gitignore;
printf "\n# vim\n*.sw*\nbin/*" >> .gitignore;

ln -s ~/dev/engine/src inc/engine;

git init;
git add .;
git commit -m "Initial Commit.";
