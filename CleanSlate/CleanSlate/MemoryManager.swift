import Foundation
import AppKit

struct MemoryManager {
    static var totalPhysicalMemory: Double {
        return Double(ProcessInfo.processInfo.physicalMemory) / (1024 * 1024 * 1024)
    }

    static func getSystemMemoryUsage() -> Double {
        var stats = vm_statistics64()
        var count = mach_msg_type_number_t(MemoryLayout<vm_statistics64>.size / MemoryLayout<integer_t>.size)
        let hostPort = mach_host_self()
        
        let kerr = withUnsafeMutablePointer(to: &stats) { (statsPtr: UnsafeMutablePointer<vm_statistics64>) in
            statsPtr.withMemoryRebound(to: integer_t.self, capacity: Int(count)) { (intPtr: UnsafeMutablePointer<integer_t>) in
                host_statistics64(hostPort, HOST_VM_INFO64, intPtr, &count)
            }
        }
        
        if kerr == KERN_SUCCESS {
            let pageSize = UInt64(vm_kernel_page_size)
            let usedBytes = UInt64(stats.active_count + stats.inactive_count + stats.wire_count) * pageSize
            return Double(usedBytes) / (1024 * 1024 * 1024)
        }
        return 0
    }
}
