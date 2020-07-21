#!/usr/bin/env bash
_GO_DIR="/usr/lib/go${INSTALL_GO_VERSION:="1.13.14"}"
_GO_TMP=$(mktemp -p /tmp -d go.XXXX)
curl -fsSL "https://golang.org/dl/go1.13.14.linux-amd64.tar.gz" | tar -xz --strip=1 -C "${_GO_TMP}"
rm -fr "${_GO_DIR}"
mv -f "${_GO_TMP}" "${_GO_DIR}"
chmod o+rx "${_GO_DIR}"
rm -f /usr/bin/{go,gofmt}
ln -vs "${_GO_DIR}/bin/go" "${_GO_DIR}/bin/gofmt" /usr/bin/
