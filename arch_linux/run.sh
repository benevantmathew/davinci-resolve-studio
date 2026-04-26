#!/bin/bash
version="20.3"
zipfile="DaVinci_Resolve_Studio_${version}_Linux.zip"

# Get the directory of this script
script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# copy  zip file to yay cache
if [[ ! -f "$script_dir/$zipfile" ]]; then
    cp ~/Downloads/$zipfile "$script_dir/$zipfile"
    echo "Copied $zipfile to yay cache."
else
    echo "$zipfile already exists in script directory. Skipping copy."
fi

# use "rocm-opencl-runtime"
cd "$script_dir" || exit 1
makepkg -is

# sha256sums=('SKIP'
#             'f17236fd68cead727c647bc31404e402922cdd491df5526f4b62364cbef9d3b8')
# used to skip the shasum check if the package is not same
