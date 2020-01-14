# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

plugins=(
	git
	zsh-autosuggestions
	timer
	docker
)

source $ZSH/oh-my-zsh.sh

# User configuration

# Functions
function init_project
{
	if [[ -z $1 ]]; then
		echo "Usage:"
		echo "	proj PROJECT_NAME"
		return 1
	fi

	if [[ -d $1 ]]; then
		echo "PROJECT_NAME: $1 Alredy used!"
		return 1
	fi
	mkdir $1 && cd $1
	echo "#$1" > README.md && echo "" >> README.md
	git init
}
function init_venv
{
	if [[ $1 != "help" ]]; then
		setopt shwordsplit
		deactivate || true
		rm -rf venv || true
		python3 -m virtualenv venv
		source venv/bin/activate
		
		# Git init
		if [[ ! -f .gitignore ]]; then
			curl -o .gitignore https://raw.githubusercontent.com/github/gitignore/master/Python.gitignore
		fi
		if [[ ! -d .git ]]; then
			git init
		fi

		# Install deps
		venv_deps="autopep8 pylint flake8 wemake-python-styleguide mypy safety bandit dodgy pytest pre-commit"
		for i in $venv_deps; do
			echo "\e[1m Installing $i... \e[0m"
			python3 -m pip install "$i"
		done
		if [[ -f requirements.dev.txt ]]; then
			pip install -r requirements.dev.txt
		fi
		pip freeze > requirements.dev.txt
		if [[ -f requirements.txt ]]; then
			pip install -r requirements.txt
		fi

		# pytest
		mkdir -p tests
		if [[ ! -f tests/main_test.py ]]; then
			touch tests/main_test.py
		fi

		# pre-commit
		if [[ ! -f .pre-commit-config.yaml ]]; then
			pre-commit sample-config > .pre-commit-config.yaml
		fi
		pre-commit install

		# .isort.cfg
		if [[ ! -f .isort.cfg ]]; then
			touch .isort.cfg
		fi
		if [[ ! -f .env ]]; then
			echo 'PYTHONPATH=venv/bin/python3' > .env
		fi

		# VSCode
		mkdir -p .vscode
		if [[ ! -f .vscode/settings.json ]]; then
			touch .vscode/settings.json
			echo '{' > .vscode/settings.json
			echo '    "python.pythonPath": "venv/bin/python3",' >> .vscode/settings.json
			echo '    "python.linting.mypyEnabled": true,' >> .vscode/settings.json
			echo '    "python.linting.flake8Enabled": true,' >> .vscode/settings.json
			echo '    "python.testing.unittestEnabled": true,' >> .vscode/settings.json
			echo '    "python.testing.unittestArgs": ["-v","-s","./tests","-p","*_test.py"],' >> .vscode/settings.json
			echo '    "python.testing.pytestEnabled": false,' >> .vscode/settings.json
			echo '    "python.testing.nosetestsEnabled": false' >> .vscode/settings.json
			echo '}' >> .vscode/settings.json
		fi
		
	fi

	echo "\e[1m Overview:\e[0m"
	
	echo "	\e[1m autopep8 \e[0m"
	echo "	\e[2m A tool that automatically formats Python code to conform to the PEP 8 style guide. \e[0m"
	echo "		autopep8 --in-place --aggressive --aggressive <filename>"
	
	echo "	\e[1m pylint \e[0m"
	echo "	\e[2m Code static checker. \e[0m"
	echo "		pylint [options] <modules_or_packages>"

	echo "	\e[1m flake8 \e[0m"
	echo "	\e[2m The modular source code checker: pep8, pyflakes and co. \e[0m"
	echo "		flake8 <modules_or_packages>"

	echo "	\e[1m mypy \e[0m"
	echo "	\e[2m Optional static typing for Python. \e[0m"
	echo "		mypy <modules_or_packages>"

	echo "	\e[1m safety \e[0m"
	echo "	\e[2m Safety checks your installed dependencies for known security vulnerabilities. \e[0m"
	echo "		safety check"

	echo "	\e[1m bandit \e[0m"
	echo "	\e[2m Security oriented static analyser for python code. \e[0m"
	echo "		bandit -r ~/your_repos/project"

	echo "	\e[1m dodgy \e[0m"
	echo "	\e[2m Searches for dodgy looking lines in Python code \e[0m"
	echo "		dodgy <filename>"

	echo "	\e[1m pytest \e[0m"
	echo "	\e[2m Simple powerful testing with Python \e[0m"
	echo "		pytest"

	echo "	\e[1m pre-commit \e[0m"
	echo "	\e[2m A framework for managing and maintaining multi-language pre-commit hooks. For more information see: https://pre-commit.com/ \e[0m"
	echo "		pre-commit"

	#echo "	\e[1m NAME \e[0m"
	#echo "	\e[2m DESCR \e[0m"
	#echo "		USAGE"
	
}

# Aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

alias venv="init_venv"
alias proj="init_project"

# Set up Node Version Manager
export NVM_DIR="$HOME/.nvm"                      # You can change this if you want.
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # Load NVM
#export PATH=$PATH:$HOME/.nvm/versions/node/v13.6.0/bin

# Android
export ANDROID_SDK_ROOT=$HOME/Android/Sdk
export ANDROID_HOME=$HOME/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools

# Composer
export PATH=$PATH:$HOME/.config/composer/vendor/bin

# Symfony
export PATH="$HOME/.symfony/bin:$PATH"

# yarn
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

# Go
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

# Tabtab
[[ -f ~/.config/tabtab/__tabtab.zsh ]] && . ~/.config/tabtab/__tabtab.zsh || true
