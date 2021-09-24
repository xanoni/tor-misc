#! /usr/bin/env -S bash -ex
# vim: set ts=4 sts=4 et sw=4 ft=bash :

OUTFILE="onion_v3_private_key.new"

if [ -z "${1}" ]; then
    echo "Please pass privkey to be base64 encoded." && exit 1
fi

echo -n 'ED25519-V3:' > "${OUTFILE}"

if [[ "${OSTYPE}" != darwin20* ]]; then
    dd if="${1}" bs=1 skip=32 | base64 -w0 >> "${OUTFILE}"
else
    dd if="${1}" bs=1 skip=32 | base64 >> "${OUTFILE}"
fi

echo "Done!"
