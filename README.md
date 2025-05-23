# Gamer Optimization Script for Windows 11 - README

This README explains what each step in the optimization script does, what issues might arise, and how to apply each step manually if the script fails. The script is designed to enhance performance and responsiveness of Windows 11 systems for gaming purposes.

---

## ✅ Optimization Tasks

### 1. Disable Startup Apps

**Purpose:** Frees up system resources during boot.
**Manual Fix:**

* Press `Ctrl + Shift + Esc` to open Task Manager.
* Go to the `Startup` tab.
* Right-click and disable apps you don't need at startup.
  **Error Cause:** Admin rights required or some apps locked by system.

### 2. Set Processor Scheduling to Programs

**Purpose:** Optimizes CPU prioritization for foreground applications.
**Manual Fix:**

* Press `Windows + R`, type `SystemPropertiesAdvanced`, press Enter.
* Click `Settings` under Performance.
* Go to `Advanced` tab > Select "Programs" under Processor Scheduling.
  **Error Cause:** Registry edit permissions.

### 3. Enable Performance Visual Effects

**Purpose:** Disables animations for snappier UI.
**Manual Fix:**

* Same path as above: `SystemPropertiesAdvanced > Settings > Visual Effects`
* Select `Adjust for best performance`

### 4. Disable Fast Startup

**Purpose:** Prevents hibernation issues and speeds up shutdown.
**Manual Fix:**

* Open `Control Panel > Hardware and Sound > Power Options`
* Click `Choose what the power buttons do`
* Click `Change settings that are currently unavailable`
* Uncheck `Turn on fast startup` and save.

### 5. Enable No GUI Boot

**Purpose:** Skips boot animation to speed up boot time.
**Manual Fix:**

* Press `Windows + R`, type `msconfig`, press Enter.
* Go to the `Boot` tab and check `No GUI boot`.

### 6. Set Boot Timeout to 10 Seconds

**Purpose:** Reduces boot wait time if multiple OS entries exist.
**Manual Fix:**

* In `msconfig` under the `Boot` tab, set Timeout to 10 seconds.

### 7. Maximize Processor Cores at Boot

**Purpose:** Uses all logical processors to optimize boot.
**Manual Fix:**

* In `msconfig > Boot > Advanced Options`
* Check `Number of processors` and select the max.

### 8. Debloat Windows 11

**Purpose:** Removes bloatware, telemetry, Copilot, ads, etc.
**Manual Fix:**

* Open PowerShell as Administrator
* Run: `irm "https://debloat.raphi.re/" | iex`
  **Error Cause:** Internet required. Antivirus or Defender may block script.

### 9. Install Brave Browser

**Purpose:** Lightweight browser optimized for performance and privacy.
**Manual Fix:**

* Visit [https://brave.com](https://brave.com) and download manually.
* Or use: `winget install Brave.Brave -e`
  **Error Cause:** Winget not installed or user hasn't agreed to terms.

### 10. Remove Teams and Cortana

**Purpose:** Frees memory and CPU usage.
**Manual Fix:**

* `Settings > Apps > Installed Apps > Search > Uninstall`
  **Error Cause:** System locks or app missing.

### 11. Move Taskbar Icons to Center

**Purpose:** Modern UI look.
**Manual Fix:**

* `Settings > Personalization > Taskbar`
* Expand `Taskbar behaviors`, set alignment to `Center`

### 12. Reduce Search Button Size

**Purpose:** Smaller footprint for UI elements.
**Manual Fix:**

* Right-click Taskbar > Search > Select `Show search icon only`

### 13. Update Drivers and Packages

**Purpose:** Keeps drivers and apps current for compatibility and performance.
**Manual Fix:**

* Use `winget upgrade --all`
* Or go to `Device Manager` > Right-click devices > Update driver
  **Error Cause:** Winget source not available or device-specific drivers not included.

### 14. Disable Hibernate

**Purpose:** Saves disk space.
**Manual Fix:**

* Open PowerShell as Administrator
* Run: `powercfg /hibernate off`

### 15. Set High Performance Power Plan

**Purpose:** Ensures full system performance.
**Manual Fix:**

* Open `Control Panel > Power Options`
* Choose `High Performance` plan

### 16. Disable Windows Tips

**Purpose:** Removes distracting popups.
**Manual Fix:**

* `Settings > System > Notifications`
* Disable `Offer suggestions on how I can set up my device`

### 17. Set Reserved CPU Set for Gaming

**Purpose:** Reserve best performing CPU cores for games.
**Manual Fix:**

* Download and run `ReservedCpuSet.exe` manually.
* Select the target app/game executable.
  **Script Behavior:** Downloads `ReservedCpuSet.exe` and opens it for configuration.

### 18. Disable Xbox Game Bar

**Purpose:** Frees up resources and reduces background input processing.
**Manual Fix:**

* `Settings > Gaming > Xbox Game Bar > Disable`
  **Script Behavior:** Modifies registry to disable Game Bar.

### 19. Optimize Network Stack (TCP tweaks)

**Purpose:** Reduce input latency and improve packet handling.
**Manual Fix:**

* Modify TCP parameters in registry (`TcpAckFrequency`, `TCPNoDelay`, etc.).
  **Script Behavior:** Automatically sets these registry tweaks.

### 20. Disable Telemetry and Tracking

**Purpose:** Reduce background CPU, disk, and network usage from Windows tracking.
**Manual Fix:**

* `Settings > Privacy > Diagnostics & Feedback > Send required only`
* Or use a privacy tool like O\&O ShutUp10++
  **Script Behavior:** Debloater + registry disables telemetry services.
---

## ✅ Network, Telemetry, and Advanced Gaming Optimizations (Now Added)

### Optimize DNS

**Purpose:** Reduce ping and increase DNS resolution speed.
**Manual Steps:**

* `Settings > Network & Internet > Ethernet or Wi-Fi`
* Click your network > `Edit DNS settings`
* Set to Manual > IPv4 > Preferred DNS: `1.1.1.1`, Alternate: `8.8.8.8`

### Disable Background Data Usage

**Purpose:** Prevent system and apps from consuming bandwidth in the background.
**Manual Steps:**

* `Settings > Network & Internet > Data Usage`
* Set a data limit or disable background data for individual apps.

### Disable Delivery Optimization

**Purpose:** Stops peer-to-peer Windows update sharing, saving bandwidth and improving latency.
**Manual Steps:**

* `Settings > Windows Update > Advanced Options > Delivery Optimization`
* Turn off `Allow downloads from other PCs`

These optimizations are now included in the script and applied automatically to maximize network responsiveness and reduce unnecessary data usage.

---

## 📝 Troubleshooting and Logs

If the script fails a task:

* A log will be saved to your Desktop: `optimization_errors.log`
* Manual fix instructions are listed above.
* For more help: [https://learn.microsoft.com/](https://learn.microsoft.com/)

---

## 🚀 Requirements

* PowerShell with Administrator rights
* Active internet connection (for script downloading & updates)
* Winget package manager (pre-installed on most Win 11 versions)

---

## 📌 Final Notes

* Script is safe to use, but a restore point is recommended before use.
* You can customize tasks by editing the `$tasks` array directly in the script.
* Re-run the script after every major Windows update to reapply tweaks.

---

Made with 💻 by Taha Laachari
