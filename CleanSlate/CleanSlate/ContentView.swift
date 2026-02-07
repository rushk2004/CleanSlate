import SwiftUI
import Combine

struct ContentView: View {
    @StateObject private var viewModel = AppViewModel()
    let timer = Timer.publish(every: 5, on: .main, in: .common).autoconnect()

    var body: some View {
        VStack(spacing: 0) {
            // Memory Usage Header
            VStack(alignment: .leading, spacing: 8) {
                HStack {
                    Text("CleanSlate").font(.headline)
                    Spacer()
                    Text("\(String(format: "%.1f", viewModel.totalMemoryUsed)) GB / \(Int(viewModel.totalRAM)) GB Used")
                        .font(.caption.monospaced())
                }
                ProgressView(value: viewModel.totalMemoryUsed, total: viewModel.totalRAM)
                    .tint(viewModel.totalMemoryUsed / viewModel.totalRAM > 0.8 ? .red : .green)
            }
            .padding()
            .background(Color.primary.opacity(0.05))

            TextField("Search for an app...", text: $viewModel.searchText)
                .textFieldStyle(.roundedBorder)
                .padding()

            List(viewModel.filteredApps, id: \.processIdentifier) { app in
                HStack {
                    if let icon = app.icon {
                        Image(nsImage: icon).resizable().frame(width: 24, height: 24)
                    }
                    VStack(alignment: .leading) {
                        Text(app.localizedName ?? "Unknown").fontWeight(.medium)
                        Text("PID: \(app.processIdentifier)").font(.caption2).foregroundColor(.secondary)
                    }
                    Spacer()
                    Button("Quit") { viewModel.terminateApp(app) }
                        .buttonStyle(.bordered)
                }
            }
        }
        .frame(minWidth: 400, minHeight: 500)
        .onAppear(perform: viewModel.refreshData)
        .onReceive(timer) { _ in viewModel.refreshData() }
    }
}
