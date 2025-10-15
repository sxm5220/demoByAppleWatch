//
//  ShowLiveActivitiesView.swift
//  demo07 Watch App
//
//  Created by 宋晓明 on 2025/9/26.
//

import SwiftUI

struct ShowLiveActivitiesView: View {
    @State private var showLiveActivities = true
    var body: some View {
        List {
            Toggle("AOT_PRIVACY_ALL_APPS_LIVE_ACTIVITIES", isOn: $showLiveActivities)
        }
        .navigationTitle("AOT_APP_PRIVACY_LIVE_ACTIVITIES_TITLE")
    }
}

#Preview {
    NavigationStack{
        ShowLiveActivitiesView()
    }
}
