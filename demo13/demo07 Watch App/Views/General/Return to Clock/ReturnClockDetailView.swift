//
//  ReturnClockDetailView.swift
//  demo07 Watch App
//
//  Created by 宋晓明 on 2025/9/26.
//

import SwiftUI

struct ReturnClockDetailView: View {
    var title = ""
    let returnClockOptions = ["RETURN_TO_CLOCK_DEFAULT_LABEL", "RETURN_TO_CLOCK_CUSTOM_LABEL"]
    let whenNotInSessionOptions = ["RETURN_TO_CLOCK_ALWAYS_LABEL", "RETURN_TO_CLOCK_2_MINUTE_LABEL", "RETURN_TO_CLOCK_1_HOUR_LABEL"]
    @State private var selectedReturnClockOption = "RETURN_TO_CLOCK_DEFAULT_LABEL"
    @State private var selectedNotInSessionOption = "RETURN_TO_CLOCK_ALWAYS_LABEL"
    @State private var returnToAppEnabled = false
    let sessionsApps = ["Maps", "Now Playing", "Siren"]
    
    var body: some View {
        List {
            Section {
                Picker("RETURN_TO_CLOCK_HEADER", selection: $selectedReturnClockOption) {
                    ForEach(returnClockOptions, id: \.self) { option in
                        Text(.init(option))
                    }
                }
                .pickerStyle(.inline)
                .labelsHidden()
            } header: {
                Text("RETURN_TO_CLOCK_HEADER")
            } footer: {
                if selectedReturnClockOption == "RETURN_TO_CLOCK_DEFAULT_LABEL" {
                    Text("RETURN_TO_CLOCK_FROM_APP_WITHIN_2_MINUTE_WINDOW_FOOTER")
                }
            }
            
            if selectedReturnClockOption == "RETURN_TO_CLOCK_CUSTOM_LABEL" {
                Section {
                    Picker("RETURN_TO_APP_IN_SESSION_LABEL", selection: $selectedNotInSessionOption) {
                        ForEach(whenNotInSessionOptions, id: \.self) { option in
                            Text(.init(option))
                        }
                    }
                    .pickerStyle(.inline)
                    .labelsHidden()
                } header: {
                    Text("RETURN_TO_APP_IN_SESSION_LABEL")
                }
            }
            
            if sessionsApps.contains(title) {
                Section {
                    Toggle("RETURN_TO_APP_IN_SESSION_TITLE", isOn: $returnToAppEnabled)
                } header: {
                    Text("RETURN_TO_APP_IN_SESSION_LABEL")
                } footer: {
                    Text("RETURN_TO_APP_IN_SESSION_FOOTER")
                }
            }
        }
        .navigationTitle(title)
    }
}

#Preview {
    NavigationStack{
        ReturnClockDetailView(title: "Maps")
    }
}
