//
//  LiveActivitiesAppDetailView.swift
//  demo07 Watch App
//
//  Created by 宋晓明 on 2025/9/26.
//

import SwiftUI

struct LiveActivitiesAppDetailView: View {
    @State private var allowLiveActivities = true
    @State var autoLaunchOption = "LIVE_ACTIVITIES_AUTOLAUNCH_SETTING_OFF"
    let app: String
    let options = ["LIVE_ACTIVITIES_AUTOLAUNCH_SETTING_OFF", "LIVE_ACTIVITIES_AUTOLAUNCH_SETTING_SMARTSTACK", "LIVE_ACTIVITIES_AUTOLAUNCH_SETTING_APP"]
    let path = "/System/Library/PreferenceBundles/CSLNanoLiveActivitiesSettings.bundle"
    let table = "NanoAutoLaunchSettings"
    
    var body: some View {
        List {
            Section {
                Toggle("LIVE_ACTIVITIES_SETTING".localized(path: path, table: table), isOn: $allowLiveActivities)
            }
            
            if allowLiveActivities {
                Section("AUTO_LAUNCH_TITLE".localized(path: path, table: table)) {
                    Picker("", selection: $autoLaunchOption) {
                        ForEach(options, id: \.self) { option in
                            Text(option.localized(path: path, table: table))
                        }
                    }
                    .pickerStyle(.inline)
                    .labelsHidden()
                }
            }
        }
        .navigationTitle(app)
    }
}

#Preview {
    NavigationStack{
        LiveActivitiesAppDetailView(app: "Example")
    }
}
