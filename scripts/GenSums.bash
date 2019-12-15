#!/bin/bash
cd "$(dirname "$0")"
dpkg-scanpackages . | gzip -9c >Packages.gz
cp ReleaseBase ReleaseTemp
printf 'Date: %s\n' "$(date -R -u)" >>ReleaseTemp
printf 'SHA256:\n' >>ReleaseTemp
function print_sum {
    file="$(echo "$1" | sed 's/^\.\///')"
    printf '  %s %s %s\n' "$(sha256sum "$file" | awk '{print $1}')" \
        "$(wc -c "$file" | awk '{print $1}')" "$file"
}
print_sum Packages.gz >>ReleaseTemp
printf '  %s %s %s\n' "$(gzip -d <Packages.gz | sha256sum | awk '{print $1}')" \
    "$(gzip -d <Packages.gz | wc -c | awk '{print $1}')" 'Packages' \
    >>ReleaseTemp
while read file; do
    print_sum "$file" >>ReleaseTemp
done < <(find -name '*.deb')
gpg -a -s --clearsign ReleaseTemp
mv ReleaseTemp.asc InRelease
rm ReleaseTemp
