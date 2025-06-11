# nix-data-mesh
## Audience
This project enables anyone with basic command line skills to be able
to install and run [data mesh](https://en.wikipedia.org/wiki/Data_mesh) 
platform components directly on their local machine using Docker.

## Rationale
In theory, [data mesh](https://en.wikipedia.org/wiki/Data_mesh) is a great foundational pattern for improving 
the quality, governance, and interoperability of a data platform. 
However, practical implementations are harder, possibly for a few reasons:
* relatively new compared to data lake and data warehouse.
* software dependency management is challenging and time-consuming
* LLMs outshining self-serve data consumption

The `nix-data-mesh` project serves as a knowledge repository and functional prototype
of various declarative, reusable templates intended for development of data products.
* **python**: _custom package, library, or API_
* **duckdb**: _database server_ [_Coming soon!_]
* **airflow**: _pipeline orchestration server_ [_Coming soon!_]
* **jupyter**: _notebook server with data visualization capability_ [_Coming soon!_]

Each component is defined as a [copier](https://copier.readthedocs.io/en/stable/) 
template and requires initialization before use. 
Components are intended to be used together to form data products.
See _Usage_ section for more details.


## Features
Under the hood, `nix-data-mesh` has state-of-the-art DevOps tooling to ensure that
anyone, on any operating system can quickly spin up a component
with guardrails to keep them on track.


## Prerequisites
###  MacOS
<details>

1. Install core macOS developer utilities & switch default shell to bash.
```commandline
xcode-select --install
chsh -s /bin/bash
```

2. Install [Homebrew](https://brew.sh/) package manager:
```commandline
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

3. Install [pyenv](https://github.com/pyenv/pyenv/wiki#suggested-build-environment)
and it's build dependencies. 
```commandline
brew install openssl readline sqlite3 xz zlib tcl-tk@8
brew install pyenv pyenv-virtualenv
```
	
4. Remember to configure `~/.bashrc` properly
```commandLine
# Homebrew
eval “$(/opt/homebrew/bin/brew shellenv)”

# Pyenv
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# Pyenv-virtualenv
eval "$(pyenv virtualenv-init -)"

# Bash command auto-complete
[[ -r "$HOMEBREW_REPOSITORY/etc/profile.d/bash_completion.sh" ]] && . "$HOMEBREW_REPOSITORY/etc/profile.d/bash_completion.sh"
```
	
4. Install Docker Desktop (though all you really need is the ``docker`` service).
https://docs.docker.com/desktop/setup/install/mac-install/
```commandline
docker --version
```

5. Install [GitHub CLI](https://github.com/cli/cli?tab=readme-ov-file#installation) 
and authenticate to your account.
```commandline
brew install gh
gh auth
```

6. Install [Nix](https://nix.dev/install-nix) build system:
```commandline
curl -L https://nixos.org/nix/install | sh
```

</details>


### Ubuntu/Debian
<details>

1. Install [pyenv](https://github.com/pyenv/pyenv/wiki#suggested-build-environment)
and it's build dependencies. 
```commandline
sudo apt update
sudo apt install build-essential libssl-dev zlib1g-dev \
	libbz2-dev libreadline-dev libsqlite3-dev curl git \
	libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev
curl -fsSL https://pyenv.run | bash
git clone https://github.com/pyenv/pyenv-virtualenv.git $(pyenv root)/plugins/pyenv-virtualenv
```

2. Install Docker Desktop (though all you really need is the ``docker`` service).
https://docs.docker.com/desktop/setup/install/linux/
```commandline
docker --version
```

3. Install [GitHub CLI](https://github.com/cli/cli/blob/trunk/docs/install_linux.md) 
and authenticate to your account.
```commandline
(type -p wget >/dev/null || (sudo apt update && sudo apt-get install wget -y)) \
	&& sudo mkdir -p -m 755 /etc/apt/keyrings \
        && out=$(mktemp) && wget -nv -O$out https://cli.github.com/packages/githubcli-archive-keyring.gpg \
        && cat $out | sudo tee /etc/apt/keyrings/githubcli-archive-keyring.gpg > /dev/null \
	&& sudo chmod go+r /etc/apt/keyrings/githubcli-archive-keyring.gpg \
	&& echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null \
	&& sudo apt update \
	&& sudo apt install gh -y
sudo apt update
sudo apt install gh
gh auth
```

4. Install [Nix](https://nix.dev/install-nix) build system:
```commandline
curl -L https://nixos.org/nix/install | sh -s -- --daemon
```

</details>


### Windows/WSL2
<details>Windows/WSL2 has not been tested.</details>


## Installation
Clone `nix-data-mesh` to a local directory.
```commandline
export DATA_MESH_HOME=~/repos/
mkdir -p $DATA_MESH_HOME
git clone <TODO_NEW_GITHUB_URL> $DATA_MESH_HOME/nix-data-mesh
```

Build ``nix-data-mesh`` and install dependencies.
```commandline
make setup
```


## Usage
### python

<details>

Install a specific version of python, let's say `3.11.9`.
```commandline
make python_version v=3.11.9
```
Now build a new, isolated Python project environment called `helloworld`
using a previously installed version (e.g., `3.11.9`).
```commandline
make python v=3.11.9 n=hello-world
```
> It is important to note that each individual Python version installation
> MUST be installed OUTSIDE of the nix-data-mesh shell. This is because each
> operating system architecture handles dependencies slightly differently.

Once the questionnaire is finished, a new project is automatically
created in `$DATA_MESH_HOME` directory with all sorts of bells and whistles.

Get started by changing into `~/repos/hello-world` and initializing 
your development (i.e., `pyenv-virtualenv`) and runtime environment (i.e.. `docker`).
```commandline
make python v=3.11.9 n=hello-world
```

</details>

### airflow (Coming soon!)
### postgresql (Coming soon!)
