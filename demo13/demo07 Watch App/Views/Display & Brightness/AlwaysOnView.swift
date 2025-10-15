//
//  AlwaysOnView.swift
//  demo07 Watch App
//
//  Created by 宋晓明 on 2025/9/26.
//

import SwiftUI

struct AlwaysOnView: View {
    // Variables
    @State private var alwaysOnEnabled = true
    
    var body: some View {
        List {
            Section {
                Toggle("Always On", isOn: $alwaysOnEnabled.animation())
            }
            
            if alwaysOnEnabled {
                Section(content: {
                    NavigationLink("Show Complication Data", destination: ShowComplicationDataView())
                    NavigationLink("Show Notifications", destination: ShowNotificationsView())
                    NavigationLink("Show Apps", destination: {})
                }, header: {
                    Text("Wrist Down")
                })
            }
        }
        .navigationTitle("Always On")
    }
}

#Preview {
    NavigationStack{
        AlwaysOnView()
    }
}
