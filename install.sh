printf "\n  Downloading formatcss...\n"

platform=`uname -s`
distro=`cat /etc/*-release 2>/dev/null | grep ^ID=[A-Za-z]* | sed s/ID=/-/g | sed s/\"//g`
arch=`uname -m`

mkdir ~/.calbertts_tools
export PATH="$PATH:~/.calbertts_tools"

curl -sL -o ~/.calbertts_tools/formatcss github.com/calbertts/formatcss/releases/latest/download/formatcss-$platform$distro-$arch
chmod a+x ~/.calbertts_tools/formatcss

printf "\n  Great!, now you can run 'formatcss' from anywhere\n\n  Try with:\n  \e[92mformatcss --url https://www.w3schools.com/w3css/4/w3.css\n\n\e[0m"
