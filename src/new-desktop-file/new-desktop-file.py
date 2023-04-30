import argparse
from pathlib import Path
import os

DESKTOP_FILES_DIR = Path(f"{os.path.expanduser('~')}/.local/share/applications/")


parser = argparse.ArgumentParser()
parser.add_argument("appname")
args = parser.parse_args()



name = input("Name: ")

applications_dir = f"{os.path.expanduser('~')}/Applications/{name}/"
executable = input(f"Executable -> {applications_dir}")
icon = input(f"Icon -> {applications_dir}")
version = input("Version: ")



with open(f"{DESKTOP_FILES_DIR / args.appname}.desktop", "w+") as desktop_file:
          desktop_file.write(f"""
[Desktop Entry]
Encoding=UTF-8
Version={version}
Type=Application
Terminal=false
Exec={applications_dir}{executable}
Name={name}
Icon={applications_dir}{icon}
""")
