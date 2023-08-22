
set -eux


# Check if an argument is provided
if [ $# -eq 0 ]; then
    # Use default value if no argument is provided
    input_arg=$(date +"%Y%m%d")
else
    # Use the provided argument
    input_arg="$1"
fi


today=$input_arg


if command -v pandoc &>/dev/null; then
    echo "pandoc is installed"
else
    echo "pandoc is not installed"
    echo "Installing now."
    sudo apt-get install pandoc -y
fi

input_file="docs/$today.md"
pandoc $input_file -o pdfs/$today.pdf
