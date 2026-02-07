import SwiftUI
import AppKit
import Combine

class AppViewModel: ObservableObject {
    @Published var runningApps: [NSRunningApplication] = []
    @Published var totalMemoryUsed: Double = 0
    @Published var searchText: String = ""
    
    var totalRAM: Double { MemoryManager.totalPhysicalMemory }

    var filteredApps: [NSRunningApplication] {
        let apps = runningApps.filter { $0.activationPolicy == .regular }
        let sorted = apps.sorted { ($0.localizedName ?? "") < ($1.localizedName ?? "") }
        
        if searchText.isEmpty {
            return sorted
        } else {
            return sorted.filter { $0.localizedName?.localizedCaseInsensitiveContains(searchText) ?? false }
        }
    }

    func refreshData() {
        self.runningApps = NSWorkspace.shared.runningApplications
        self.totalMemoryUsed = MemoryManager.getSystemMemoryUsage()
    }

    func terminateApp(_ app: NSRunningApplication) {
        app.terminate()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.refreshData()
        }
    }
}
