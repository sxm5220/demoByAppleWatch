//
//  AutoLaunchView.swift
//  demo07 Watch App
//
//  Created by 宋晓明 on 2025/9/26.
//

import SwiftUI

struct AutoLaunchView: View {
    let path = "/System/Library/PreferenceBundles/CSLNanoLiveActivitiesSettings.bundle"
    let table = "NanoAutoLaunchSettings"
    
    var body: some View {
        List {
            NavigationLink("LIVE_ACTIVITIES_AUTO_LAUNCH_LIVE_ACTIVITIES_SETTINGS_TITLE".localized(path: path, table: table)) {
                LiveActivitiesSettingsView()
            }
        }
        .navigationTitle("AUTO_LAUNCH_APP_TITLE")
    }
}

#Preview {
    NavigationStack{
        AutoLaunchView()
    }
}
