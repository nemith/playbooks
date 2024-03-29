if [ -d /opt/go ]; then
	export GOROOT=/opt/go
	prepend_path /opt/go/bin
fi

[ ! -x $(whiff go) ] && return

export GOPATH=$HOME/.go
prepend_path $GOPATH/bin