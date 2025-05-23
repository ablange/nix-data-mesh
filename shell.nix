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
    docker
    sqlite
    xz
    less
    wget
    copier
    bash-completion
    pre-commit
    mkdocs
    python312Packages.mkdocs-material
  ];

   NAME = "nix-data-mesh";

   shellHook = ''
     echo "Sit tight, we're initializing $NAME ...";

     echo "~~~~~ Git command and branch autocompletion ~~~~~"";
     curl -o ~/.git-completion.bash \
       https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash
     curl -o ~/.git-prompt.sh \
       https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh

     echo "~~~~~ Bash shell restart w/ profile, prompt, aliases, and more! ~~~~~"";
     source shell/bash/.bashrc
     source shell/bash/.bash_aliases
     source shell/bash/.bash_profile
   '';
}