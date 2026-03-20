# Testing archive extraction

---

## Android

The example app reads the archive from external storage using `getExternalStorageDirectory()`,
which resolves to:

```
/storage/emulated/0/Android/data/your.packageName.here/files/
```

### Steps

#### 1. Install the app

```sh
flutter run
```

#### 2. Push the archive via adb

```sh
adb push path/to/{fileName}.complete \
  /storage/emulated/0/Android/data/your.packageName.here/files/{fileName}.complete
```

#### 3. Verify the file is there

```sh
adb shell ls /storage/emulated/0/Android/data/your.packageName.here/files/
```

Expected output:

```
{fileName}.complete
```

#### 4. Tap "Test Extraction"

The status area will show the archive size and extracted size on success, or an error message
on failure.

### Notes

- On a **physical device** you may need to grant the `READ_EXTERNAL_STORAGE` permission if
  the app targets API < 29. On API 29+ the app directory under `Android/data/` is always
  accessible without extra permissions.
- On an **emulator** the path above is always writable via adb without extra setup.
- The extracted output lands in `$TMPDIR/mili_out/` on the device. You can inspect it with:
  ```sh
  adb shell run-as com.milibris.flutter ls /data/local/tmp/mili_out/
  ```
  (path may vary — check the `Status` text in the app for confirmation).

---

## iOS

The example app reads the archive from the app's support directory using
`getApplicationSupportDirectory()`, which resolves to:

```
/var/mobile/Containers/Data/Application/<UUID>/Library/Application Support/
```

### Steps

#### 1. Install the app

```sh
flutter run
```

#### 2. Copy the archive into the simulator

**Simulator:**

```bash
# 1. Find the booted simulator UUID
xcrun simctl list devices | grep Booted

# 2. Get the app's data container path
APP_DIR=$(xcrun simctl get_app_container <simulator-uuid> fr.liberation.liberationapp data)
echo $APP_DIR

# 3. Copy the file into Application Support
mkdir -p "$APP_DIR/Library/Application Support"
cp /path/to/{fileName}.complete "$APP_DIR/Library/Application Support/"

# 4. Verify
ls -lh "$APP_DIR/Library/Application Support/"
```

The app reads from `getApplicationSupportDirectory()` which maps to `<container>/Library/Application Support/`.
