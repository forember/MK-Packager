#!/bin/bash
set -ex
cd /packager/output
dpkg-scanpackages -m . | tee Packages | gzip -9c >Packages.gz
printf 'Architectures: amd64\nComponents: .\n' >ReleaseTemp
printf 'Date: %s\nSHA256:\n' "$(date -R -u)" >>ReleaseTemp
function print_sum {
    file="$(echo "$1" | sed 's/^\.\///')"
    printf '  %s %s %s\n' "$(sha256sum "$file" | awk '{print $1}')" \
        "$(wc -c "$file" | awk '{print $1}')" "$file"
}
print_sum Packages >>ReleaseTemp
print_sum Packages.gz >>ReleaseTemp
while read file; do
    print_sum "$file" >>ReleaseTemp
done < <(find -name '*.deb')
gpg --generate-key --batch <<'GPG'
%no-protection
%transient-key
Key-Type: default
Key-Length: 1024
Name-Real: Temp Key
Name-Comment: temporary key for appimage build
Name-Email: mkxp@example.com
%commit
GPG
gpg -a --export 'mkxp@example.com' | tee PublicKey | apt-key add
gpg -a -s --clearsign ReleaseTemp
mv ReleaseTemp.asc InRelease
rm ReleaseTemp
