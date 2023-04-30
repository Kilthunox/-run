
# Print commands as they are executed and stop and throw an exception if one fails.
set -xe 

# Download OGRE from source
git clone git@github.com:OGRECave/ogre.git

# UBUNTU required dependencies
sudo apt-get install libgles2-mesa-dev libvulkan-dev glslang-dev libxrandr-dev

# UBUNTU optional dependencies
sudo apt-get install libsdl2-dev libxt-dev libxaw7-dev doxygen


# Start build process
cd ogre/
cmake --build .


# Install
cmake --build . --config Release --target install
