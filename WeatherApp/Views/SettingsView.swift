import SwiftUI

struct SettingsView: View {
    @State private var notificationsEnabled = true
    @State private var selectedTemperatureUnit = "Celsius"
    @State private var useLocationServices = false

    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("General")) {
                    Toggle(isOn: $notificationsEnabled) {
                        Label("Enable Notifications", systemImage: "bell.fill")
                    }
                    
                    Picker("Temperature Unit", selection: $selectedTemperatureUnit) {
                        Text("Celsius").tag("Celsius")
                        Text("Fahrenheit").tag("Fahrenheit")
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }

                Section(header: Text("Permissions")) {
                    Toggle(isOn: $useLocationServices) {
                        Label("Use Location Services", systemImage: "location.fill")
                    }
                }
                
                Section {
                    Button(action: {
                        // Perform reset settings action
                    }) {
                        Text("Reset to Default Settings")
                            .foregroundColor(.red)
                    }
                }
            }
            .navigationTitle("Settings")
        }
    }
}

#Preview {
    SettingsView()
}
