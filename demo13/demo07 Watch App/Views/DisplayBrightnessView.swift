//
//  DisplayBrightnessView.swift
//  demo07 Watch App
//
//  Created by 宋晓明 on 2025/9/26.
//

import SwiftUI

struct DisplayBrightnessView: View {
    // Variables
    @State private var brightness: Double = 66.0
    @State private var boldTextEnabled = false
    @State private var wakeWristRaiseEnabled = true
    
    var body: some View {
        List {
            Section(content: {
                Slider(value: $brightness,in: 0...100,step: 33){
                    Text("Brightness")
                } minimumValueLabel: {
                    Image(systemName: "sun.min.fill")
                } maximumValueLabel: {
                    Image(systemName: "sun.max.fill")
                }
                .tint(.green)
                .background(Color(.black).opacity(0.9))
                .cornerRadius(15)
                .padding(.horizontal,-10)
                
                NavigationLink("Text Size", destination: TextSizeView())
                Toggle("Bold Text", isOn: $boldTextEnabled)
            },header: {
                Text("Appearance")
            })
            
            Section(content: {
                NavigationLink(destination: AlwaysOnView(), label: {
                    RowLabel(title: "Always On", subtitle: "On")
                })
            }, footer: {
                Text("Your Apple Watch can always show the time. You can also choose if your complications show sensitive data.")
            })
            
            Section(content: {
                Toggle("Wake on Wrist Raise", isOn: $wakeWristRaiseEnabled)
                NavigationLink("Wake Duration", destination: WakeDurationView())
            }, header: {
                Text("Wake")
            })
        }
        .navigationTitle("Display & Brightness")
    }
}

#Preview {
    NavigationStack{
        DisplayBrightnessView()
    }
}
