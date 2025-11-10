# Upgrade ImageTagger blobs
ADD_TO_WORK_DIR "a73xqxx" "system" "system/lib64/libImageTagger.camera.samsung.so" 0 0 644 "u:object_r:system_lib_file:s0"

# Add Polarr blobs
ADD_TO_WORK_DIR "a73xqxx" "system" "system/etc/public.libraries-polarr.txt" 0 0 644 "u:object_r:system_file:s0"
ADD_TO_WORK_DIR "a73xqxx" "system" "system/lib64/libBestComposition.polarr.so" 0 0 644 "u:object_r:system_lib_file:s0"
ADD_TO_WORK_DIR "a73xqxx" "system" "system/lib64/libFeature.polarr.so" 0 0 644 "u:object_r:system_lib_file:s0"
ADD_TO_WORK_DIR "a73xqxx" "system" "system/lib64/libPolarrSnap.polarr.so" 0 0 644 "u:object_r:system_lib_file:s0"
ADD_TO_WORK_DIR "a73xqxx" "system" "system/lib64/libTracking.polarr.so" 0 0 644 "u:object_r:system_lib_file:s0"
ADD_TO_WORK_DIR "a73xqxx" "system" "system/lib64/libYuv.polarr.so" 0 0 644 "u:object_r:system_lib_file:s0"

# Fix camera lock for devices with a rear SLSI sensor
HEX_PATCH "$WORK_DIR/vendor/lib/hw/camera.qcom.so" \
    "726f2e626f6f742e666c6173682e6c6f636b656400" \
    "726f2e63616d6572612e6e6f746966795f6e666300"
HEX_PATCH "$WORK_DIR/vendor/lib/hw/com.qti.chi.override.so" \
    "726f2e626f6f742e666c6173682e6c6f636b656400" \
    "726f2e63616d6572612e6e6f746966795f6e666300"
HEX_PATCH "$WORK_DIR/vendor/lib64/hw/camera.qcom.so" \
    "726f2e626f6f742e666c6173682e6c6f636b656400" \
    "726f2e63616d6572612e6e6f746966795f6e666300"
HEX_PATCH "$WORK_DIR/vendor/lib64/hw/com.qti.chi.override.so" \
    "726f2e626f6f742e666c6173682e6c6f636b656400" \
    "726f2e63616d6572612e6e6f746966795f6e666300"

# Upgrade midas blobs
DELETE_FROM_WORK_DIR "vendor" "etc/midas"
ADD_TO_WORK_DIR "a73xqxx" "vendor" "etc/midas" 0 2000 755 "u:object_r:vendor_configs_file:s0"

# Upgrade singletake blobs
DELETE_FROM_WORK_DIR "vendor" "etc/singletake"
ADD_TO_WORK_DIR "a73xqxx" "vendor" "etc/singletake" 0 2000 755 "u:object_r:vendor_configs_file:s0"
