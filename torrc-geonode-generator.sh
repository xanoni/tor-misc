#! /usr/bin/env -S bash -e

infile="${1}"

if [[ "${infile}" == '' ]]; then
    echo -en "\nPlease provide input file!\n\n" && exit 1
fi

countries="$(awk '{ ORS=","; print $1 }' "${infile}" | sed 's/,$//')"
outfile="$(dirname "${infile}")/$(basename "${infile%%.*}-rcline.${infile##*.}")"

echo -en "# exclude known surveillance countries that we may not trust" \
         "\nStrictNodes   1" \
         "\nExcludeNodes  {US},{CA},{AU},{NZ},{GB},{??}\n" \
         "\n# only use one of (EntryNodes|MiddleNodes|ExitNodes) at a time!" \
         "\nEntryNodes    ${countries}" \
         "\nMiddleNodes   ${countries}" \
         "\nExitNodes     ${countries}\n" \
         > "${outfile}"

echo -en "\nOutput written to: ${outfile}\n\n"
