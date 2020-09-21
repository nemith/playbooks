if [ -d /opt/go ]; then
	export GOROOT=/opt/go
	append_path /opt/go/bin
fi

[ ! -x $(whiff go) ] && return

export GOPATH=$HOME/.go
append_path $GOPATH/bin