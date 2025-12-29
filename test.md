

## Installation & Testing Guide (Recommended Workflow)

Codekub can be tested either on a **real Ubuntu installation** or inside a **virtual machine**.
For development and testing, a **virtual machine is strongly recommended**.

---

## Recommended Virtualization Setup

### Preferred option

✅ **GNOME Boxes**

* Simpler and more beginner-friendly
* Better GNOME integration
* Fewer networking and display issues than VirtualBox or VMware

### Not recommended

❌ VirtualBox
❌ VMware

(They work, but are more complex and often cause unnecessary issues for beginners.)

---

## Step 1: Install GNOME Boxes

On your host system:

```bash
sudo apt install gnome-boxes
```

---

## Step 2: Create an Ubuntu 24.04 Virtual Machine

1. Open **GNOME Boxes**
2. Create a new virtual machine
3. Select **Ubuntu 24.04**
4. Allocate enough storage (important!)

⚠️ **Important storage note**

* **Live mode will NOT work**
* Live sessions do not have enough persistent storage
* You **must install Ubuntu 24.04 to the virtual disk**

---

## Step 3: Install Ubuntu 24.04 Inside the VM

* Complete the normal Ubuntu installation
* Reboot into the installed system
* Log in normally

At this point, you have a clean Ubuntu environment ready for Codekub.

---

## Step 4: Run the Codekub Script (Development Branch)

For development and testing:

```bash
curl -sSL https://raw.githubusercontent.com/CodeCompasss/codekub/refs/heads/main/boot.sh | bash
```

This will:

* Prepare the system
* Run the installer
* Apply themes, tools, and desktop configuration

---

## Step 5: Reset the System for Re-Testing (⚠️ Dangerous)

If you want to **test the installer again from scratch**, you can reset user configuration.

⚠️ **WARNING – DESTRUCTIVE COMMAND**
This will:

* Delete almost all user configuration
* Reset GNOME settings
* Remove themes, icons, fonts, and app data
* Log you out and reboot

### Reset Command

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

---

## Why This Is Needed

* Codekub modifies many user-level settings
* Re-running the installer without cleanup can cause:

  * Themes not applying
  * GNOME settings not updating
  * Old configs overriding new changes

This reset simulates a **fresh Ubuntu user environment**.

---

## Step 6: Re-Run Codekub After Reboot

After reboot:

1. Log in again
2. Open Terminal
3. Run:

```bash
curl -sSL https://raw.githubusercontent.com/CodeCompasss/codekub/refs/heads/main/boot.sh | bash
```

You can repeat **Step 5 → Step 6** for further testing.

---

