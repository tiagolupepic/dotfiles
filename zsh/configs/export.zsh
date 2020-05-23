export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

export PATH="/usr/local/opt/python@3.8/bin:$PATH"
export LDFLAGS="-L/usr/local/opt/python@3.8/lib"
export PKG_CONFIG_PATH="/usr/local/opt/python@3.8/lib/pkgconfig"
export RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl@1.1)"
export PATH="$HOME/.rbenv/bin:$PATH"

export FZF_DEFAULT_COMMAND='ag -p ~/.ignore --hidden -g ""'
export FACTORIAL_PATH="$HOME/Projects/factorial"

#export FZF_DEFAULT_COMMAND='fd --type f -H -I -E node_modules -E .git -E "*/tmp/cache" -E tmp/cache'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

HEROKU_AC_ZSH_SETUP_PATH=/Users/tiagolupepic/Library/Caches/heroku/autocomplete/zsh_setup && test -f $HEROKU_AC_ZSH_SETUP_PATH && source $HEROKU_AC_ZSH_SETUP_PATH;

eval "$(rbenv init -)"
