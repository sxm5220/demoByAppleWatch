//
//  ProfilesView.swift
//  demo07 Watch App
//
//  Created by 宋晓明 on 2025/9/26.
//

import SwiftUI

struct ProfilesView: View {
    let path = "/System/Library/PreferenceBundles/ManagedConfigurationUI-Watch.bundle"
    let table = "ManagedConfigurationUI"
    
    var body: some View {
        List {
            Section {
                Spacer()
                    .listRowBackground(Color.clear)
            } footer: {
                Text("NO_PROFILES_INSTALLED".localized(path: path, table: table))
            }
        }
        .navigationTitle("PROFILES_MDM_TITLE")
    }
}

#Preview {
    NavigationStack{
        ProfilesView()
    }
}
