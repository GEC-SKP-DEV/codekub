

# Codekub Installation & Testing Guide (Easy Version)

You can test Codekub on:

* A **real Ubuntu system**, or
* A **virtual machine** (VM) – recommended for safety.

---

## 1️⃣ Virtual Machine Setup

### Recommended

✅ **GNOME Boxes**

* Simple and beginner-friendly
* Works well with GNOME
* Fewer problems than VirtualBox or VMware

### Not recommended

❌ VirtualBox / VMware (more complex)

---

## 2️⃣ Install GNOME Boxes

On your host Ubuntu system, run:

```bash
sudo apt install gnome-boxes
```

---

## 3️⃣ Create Ubuntu 24.04 VM

1. Open **GNOME Boxes**
2. Create a new VM
3. Choose **Ubuntu 24.04 ISO**
4. Give enough disk space

⚠️ **Do NOT use live mode.**

* Live sessions don’t save changes.
* You must install Ubuntu on the virtual disk.

---

## 4️⃣ Install Ubuntu in the VM

* Install Ubuntu normally
* Reboot and log in

Now your VM is ready for Codekub.

---

## 5️⃣ Run Codekub Installer (Development Branch)

**Problem:** The boot script downloads `main` branch by default.

* If you are testing `dev` branch, it may overwrite it.

**Solution:** Set the branch you want:

```bash
export OMAKUB_REF="dev"
curl -sSL https://raw.githubusercontent.com/CodeCompasss/codekub/main/boot.sh | bash
```

**Important Notes:**

* ASCII art in the script **cannot have single quotes `'`**
* Always use **here-doc** for ASCII art:

```bash
ascii_art=$(cat <<'EOF'
   ______           __           __ __ __
  ____          _       ____                                    
 / ___|___   __| | ___ / ___|___  _ __ ___  _ __   __ _ ___ ___ 
| |   / _ \ / _` |/ _ \ |   / _ \| _ _ _| _ \ / _` / __/ __|
| |__| (_) | (_| |  __/ |__| (_) | | | | | |_) | (_| \__ \__ \
 \____\___/ \__,_|\___|\____\___/|_| |_| |_| .__/ \__,_|___/___/
                                           |_|                  
              C O D E   C O M P A S S
EOF
)
```

* Make sure **all quotes `"` in echo or strings are closed**.

---

## 6️⃣ Snapshot & Testing

* Before running Codekub, go to **GNOME Boxes → Settings → Snapshot**
* Create a snapshot.
* Run Codekub and test everything (apps, themes, GNOME settings).
* If needed, **restore snapshot** to start fresh.

---

## 7️⃣ Reset Ubuntu (Optional / Dangerous)

If you want a completely clean environment:

```bash
rm -rf \
~/.config \
~/.local \
~/.cache \
~/.themes \
~/.icons \
~/.fonts \
~/.mozilla \
~/.gnome \
~/.nv \
~/.var \
~/.pki \
~/.java \
~/.kde \
~/.dbus \
~/Desktop && \
mkdir ~/Desktop && \
dconf reset -f / && \
sudo reboot
```

⚠️ This deletes user settings and data. Only use in a VM.

---

## 8️⃣ Re-Run Codekub

After reboot:

```bash
curl -sSL https://raw.githubusercontent.com/CodeCompasss/codekub/main/boot.sh | bash
```

* Repeat **snapshot → test → restore** if needed.

---

## 9️⃣ YouTube Installation Video

[Watch the installation process](https://youtu.be/AU_xhhFQX-0)

* Test all features
* Open apps, check themes, make sure GNOME settings apply

---

### ✅ Key Problems & Solutions

1. **Boot script downloads main branch by default**

   * Use `OMAKUB_REF` to test dev or other branches

2. **ASCII art**

   * Cannot use `'` inside ASCII art
   * Use here-doc (`cat <<'EOF'`)

3. **Unclosed quotes**

   * Check all `"..."` to prevent `unexpected EOF` errors

4. **Testing safely**

   * Use VM snapshots or reset environment to re-test
