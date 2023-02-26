export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

export PATH="/usr/local/opt/qt/bin:$PATH"
export PATH="/usr/local/opt/python@3.9/bin:$HOME/.cargo/bin:$PATH"
export PATH="/usr/local/opt/qt@5/bin:$PATH"
export PATH="$HOME/.rbenv/bin:$GOPATH/bin:$PATH"
export PATH="/usr/local/opt/node@16/bin:$PATH"

export LDFLAGS="-L/usr/local/opt/python@3.8/lib"
export LDFLAGS="-L/usr/local/opt/qt@5/lib"

export CPPFLAGS="-I/usr/local/opt/qt@5/include"

export PKG_CONFIG_PATH="/usr/local/opt/python@3.9/lib/pkgconfig"
export PKG_CONFIG_PATH="/usr/local/opt/qt@5/lib/pkgconfig"

export LDFLAGS="-L/usr/local/opt/node@16/lib"
export CPPFLAGS="-I/usr/local/opt/node@16/include"

export GOPATH=$HOME/.golang

export FZF_DEFAULT_COMMAND='ag -p ~/.ignore --hidden -g ""'
export FACTORIAL_PATH="$HOME/Projects/factorial"
export PRETTIER_RUBY_TIMEOUT_MS=30000
export PRETTIERD_LOCAL_PRETTIER_ONLY=false

# export FZF_DEFAULT_COMMAND='fd --type f -H -I -E node_modules -E .git -E "*/tmp/cache" -E tmp/cache'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

eval "$(rbenv init -)"
