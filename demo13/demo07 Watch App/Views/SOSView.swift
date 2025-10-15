//
//  SOSView.swift
//  demo07 Watch App
//
//  Created by 宋晓明 on 2025/9/26.
//

import SwiftUI

struct SOSView: View {
    var body: some View {
        List {
            Section {
                NavigationLink(destination: HoldSideButtonView(), label: {
                    RowLabel(title: "Hold Side Button", subtitle: "Enabled")
                })
            }
            
            Section(content: {
                NavigationLink(destination: MedicalView(), label: {
                    Label("Medical ID", systemImage: "staroflife.fill")
                })
            }, footer: {
                Text("If you use Emergency SOS, your device calls emergency services and sends your emergency contacts a notification that includes your location.")
            })
        }
        .navigationTitle("SOS")
    }
}

#Preview {
    NavigationStack{
        SOSView()
    }
}
