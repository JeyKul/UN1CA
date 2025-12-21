LOG "- Downloading A528NKSS7GYI1_kernel.tar"
DOWNLOAD_FILE \
    "https://github.com/UN1CA/proprietary_vendor_samsung_sm7325/releases/download/A528NKSS7GYI1_KOO_OKR/A528NKSS7GYI1_kernel.tar" \
    "$TMP_DIR/A528NKSS7GYI1_kernel.tar" || return 1

LOG "- Extracting dtbo.img.lz4"
EVAL "cd \"$TMP_DIR\"; tar -xf \"A528NKSS7GYI1_kernel.tar\" \"dtbo.img.lz4\"" || return 1
EVAL "rm -f \"$TMP_DIR/A528NKSS7GYI1_kernel.tar\"" || return 1

LOG "- Decompressing dtbo.img.lz4"
EVAL "lz4 -d -f --rm \"$TMP_DIR/dtbo.img.lz4\" \"$TMP_DIR/dtbo.img\"" || return 1

"$SRC_DIR/scripts/unsign_bin.sh" "$TMP_DIR/dtbo.img" || return 1

if ! $TARGET_DISABLE_AVB_SIGNING; then
    SIGN_IMAGE_WITH_AVB "$TMP_DIR/dtbo.img" || return 1
fi
