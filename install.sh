printf "\n  Downloading formatcss...\n\n"

platform=`uname -s`
distro=`cat /etc/*-release 2>/dev/null | grep ^ID=[A-Za-z]* | sed s/ID=/-/g | sed s/\"//g`
arch=`uname -m`

install() {
  if which_formatcss="$(command -v formatcss)"; then
    printf "\n  formatcss is already installed\n\n"
    printf "\n  Try with:\n  \e[92mformatcss --url https://www.w3schools.com/w3css/4/w3.css\n\n\e[0m"
  else
    mkdir -p ~/.calbertts_tools
    PATH="$PATH:$HOME/.calbertts_tools"
    export PATH
    
    if grep -q formatcss ~/.bashrc; then
      echo "export PATH=\"\$PATH:\$HOME/.calbertts_tools\"" >> ~/.bashrc
    else
      printf "\n  formatcss found in \$PATH\n\n"
    fi

    curl -sL -o formatcss github.com/calbertts/formatcss/releases/latest/download/formatcss-$platform$distro-$arch
    chmod a+x formatcss
    mv formatcss ~/.calbertts_tools

    if which_formatcss="$(command -v formatcss)"; then
      printf "\n  Great!, now you can run 'formatcss' from anywhere\n\n  Try with:\n  \e[92mformatcss --url https://www.w3schools.com/w3css/4/w3.css\n\n\e[0m"
    else
      printf "\n  Turns out there was an error installing formatcss, try it again\n"
    fi
  fi
}

install
