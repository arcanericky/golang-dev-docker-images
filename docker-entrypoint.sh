#!/bin/sh
#
# Example Usage:
# docker container run --name glang-dev --hostname glang-dev -it --rm golang-dev:debian $USERNAME $(id -u)

if [ $# -lt 2 ]; then
    echo "Specify user name and user ID"
    exit 1
fi

USERNAME=$1
UID=$2

shift; shift

CMD=""
if [ $# -gt 0 ]; then
    CMD="-c"
fi

. /etc/os-release

if [ "$ID" = "debian" ]; then
    CREATEHOME="--no-create-home"
    if [ ! -d "/home/$USERNAME" ]; then
        CREATEHOME="--create-home"
    fi

    useradd "$CREATEHOME" --uid "$UID" "$USERNAME"
    cd "/home/$USERNAME" && exec runuser ricky --shell /bin/bash $CMD "$@"
elif [ "$ID" = "alpine" ]; then
    CREATEHOME="-H"
    if [ ! -d "/home/$USERNAME" ]; then
        CREATEHOME=""
    fi
    adduser -D $CREATEHOME -u "$UID" "$USERNAME"
    cd "/home/$USERNAME" && exec su-exec "$USERNAME" /bin/ash --login $CMD "$@"
else
    echo "Unsupported OS: $ID"
fi
