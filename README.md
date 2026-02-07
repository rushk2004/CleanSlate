# 🧹 CleanSlate
### A High-Performance macOS Task Utility
**Developed by Rushanth Kalaiarasan**

[![Swift](https://img.shields.io/badge/Swift-6.0-orange.svg)](https://swift.org)
[![macOS](https://img.shields.io/badge/Platform-macOS%2014%2B-blue.svg)](https://apple.com)
[![License](https://img.shields.io/badge/License-MIT-green.svg)](https://opensource.org/licenses/MIT)

CleanSlate is a streamlined system utility designed to give you instant control over your workspace. Built with a native **MVVM architecture**, it provides a lightning-fast way to monitor system RAM and terminate resource-heavy applications with a single click.

<img width="1012" height="644" alt="Screenshot 2026-02-07 at 20 34 48" src="https://github.com/user-attachments/assets/366e88e7-f0a2-4fbb-9687-601d461e96b1" />

---

## 🚀 Key Features

* **⚡ Real-Time RAM Monitor:** High-fidelity system memory tracking using Mach kernel statistics.
* **🔍 Smart Filtering:** Automatically isolates "Regular" user applications, filtering out background system noise.
* **🎯 Instant Search:** Fuzzy-search logic to find and kill processes in milliseconds.
* **🦾 Force-Free Termination:** Uses native `NSWorkspace` protocols to close apps gracefully.
* **💎 Modern UI:** A beautiful, dark-mode-ready interface built entirely in SwiftUI.

---

## 🏗️ Technical Architecture

CleanSlate is engineered for modularity and performance, strictly following the **Model-View-ViewModel (MVVM)** pattern to separate system logic from the user interface.



| Component | Responsibility |
| :--- | :--- |
| **Model** (`MemoryManager`) | Low-level C-interop with the Mach kernel for hardware stats. |
| **ViewModel** (`AppViewModel`) | Reactive data pipeline using **Combine** to sync system state with the UI. |
| **View** (`ContentView`) | Declarative SwiftUI layout designed for macOS efficiency. |

---

## 🛠️ Installation & Setup

1.  **Clone the Repository:**
    ```bash
    git clone [https://github.com/Rushanth-K/CleanSlate.git](https://github.com/Rushanth-K/CleanSlate.git)
    ```
2.  **Open in Xcode:** Launch `CleanSlate.xcodeproj`.
3.  **Disable Sandbox:** To allow CleanSlate to manage other processes, go to **Signing & Capabilities** and remove the **App Sandbox**.
4.  **Run:** Hit `Cmd + R` and take control of your RAM.

---

## 🤝 Contributing

This is an open-source project by **Rushanth Kalaiarasan**. Feel free to fork, open issues, or submit pull requests to help make CleanSlate even better.

---
*Created with ❤️ for the macOS Developer Community.*
