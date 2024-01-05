#### rpm
```sh
dnf install -y git python3 sudo && git clone https://github.com/valentino-sm/.dotfiles && cd .dotfiles && ./install
```

#### arch
```sh
pacman -Sy git python3 sudo --noconfirm && git clone https://github.com/valentino-sm/.dotfiles && cd .dotfiles && ./install
```

#### mac
```sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" && \
brew install git python3 && git clone https://github.com/valentino-sm/.dotfiles && cd .dotfiles && ./install
```
