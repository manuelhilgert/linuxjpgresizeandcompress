find /var/snap/nextcloud/common/nextcloud/data -name "*.jp*g" -exec sh -c \
'identify -format "%[fx:(h>4000 || w>4000)]\n" "$0" | grep -q 1' {} \; -print0 \
| xargs -0 mogrify -resize '4000x4000'
find /var/snap/nextcloud/common/nextcloud/data -name "*.jp*g" -exec jpegoptim -m70 -T10 {} \;
nextcloud.occ files:scan --all
