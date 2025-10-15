//
//  DevicesView.swift
//  demo07 Watch App
//
//  Created by 宋晓明 on 2025/9/26.
//

import SwiftUI

struct DevicesView: View {
    @State private var showingDeleteDataPrompt = false
    
    var body: some View {
        List {
            NavigationLink("watchOS Simulator") {
                List {
                    Section {
                        
                    } footer: {
                        Text("Data from watchOS Simulator cannot be viewed on this watch. You can view Health data from this device on iPhone.")
                    }
                    
                    Section {
                        Button("Delete All watchOS Simulator Data") { showingDeleteDataPrompt.toggle() }
                            .multilineTextAlignment(.center)
                            .frame(maxWidth: .infinity)
                            .foregroundStyle(.red)
                            .alert(isPresented: $showingDeleteDataPrompt) {
                                Alert(
                                    title: Text(""),
                                    message: Text("This will delete all Health data associated with watchOS Simulator from Health."),
                                    primaryButton: .cancel(Text("SOS_DISABLE_LOCATION_SERVICES_CONFIRMATION_CANCEL_BUTTON")),
                                    secondaryButton: .destructive(Text("Delete"))
                                )
                            }
                    }
                }
                .navigationTitle("watchOS Simulator")
            }
        }
        .navigationTitle("Devices")
    }
}

#Preview {
    NavigationStack{
        DevicesView()
    }
}
