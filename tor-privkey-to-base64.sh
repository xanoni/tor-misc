#! /usr/bin/env -S bash -ex

if [ -z "${1}" ]; then
    echo "Please pass privkey to be base64 encoded."
    exit 1
fi

echo -en 'ED25519-V3:' > onion_v3_private_key.new

if [ "${OSTYPE}" = "linux-gnu" ] || [ "${OSTYPE}" = "linux-gnueabihf" ]; then
    echo "Linux"
    dd if="${1}" bs=1 skip=32 | base64 -w0 >> onion_v3_private_key.new
elif [ "${OSTYPE}" = "darwin20" ]; then
    echo "MacOS"
    dd if="${1}" bs=1 skip=32 | base64 >> onion_v3_private_key.new
else
    echo "Error!"
    rm onion_v3_private_key.new
    exit 1
fi

echo "Done!"
