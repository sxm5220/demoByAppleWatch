//
//  ContentView.swift
//  demo07 Watch App
//
//  Created by 宋晓明 on 2025/9/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            List {
                Section {
                    ForEach(mainSectionList) { item in
                        SettingsLink(item.title.localize(),
                                     icon: item.icon,
                                     primaryColor: item.primaryColor,
                                     secondaryColor: item.secondaryColor,
                                     content: item.content)
                    }
                }
                
                Section {
                    ForEach(appSectionList) { item in
                        SettingsLink(item.title.localize(),
                                     icon: item.icon,
                                     primaryColor: item.primaryColor,
                                     secondaryColor: item.secondaryColor,
                                     content: item.content)
                    }
                }
            }
            .navigationTitle("STATUS_BAR_TITLE_SETTINGS")
        }
    }
}

#Preview {
    ContentView()
}
