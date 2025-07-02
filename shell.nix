let
  nixpkgs = fetchTarball "https://github.com/NixOS/nixpkgs/tarball/nixos-24.05";
  pkgs = import nixpkgs { config = {}; overlays = []; };
in

pkgs.mkShellNoCC {
  packages = with pkgs; [
    gcc
    gnumake
    zlib
    libffi
    readline
    bzip2
    openssl
    openssh
    ncurses
    curl
    openssl
    git
    gh
    docker
    sqlite
    xz
    less
    wget
    copier
    bash-completion
    man
    nano
    pre-commit
    python311Packages.mkdocs
    python311Packages.mkdocs-material
    python311Packages.pytest-cov
    python311Packages.pytest
    pyenv
  ];

   NAME = "nix-data-mesh";

   shellHook = ''
     echo "Sit tight, we're initializing $NAME ...";

     echo "~~~~~ Git command and branch autocompletion ~~~~~";
     curl -o ~/.git-completion.bash \
       https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash
     curl -o ~/.git-prompt.sh \
       https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh

     echo "~~~~~ Bash profile, command aliases, autocompletion ~~~~~";
     source shell/bash/.bashrc
     source shell/bash/.bash_aliases
     source shell/bash/.bash_profile
     source ${pkgs.bash-completion}/etc/profile.d/bash_completion.sh
   '';
}
