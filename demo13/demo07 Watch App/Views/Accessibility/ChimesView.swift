//
//  ChimesView.swift
//  demo07 Watch App
//
//  Created by 宋晓明 on 2025/9/26.
//

import SwiftUI

struct ChimesView: View {
    // Variables
    @State private var chimesEnabled = false
    
    var body: some View {
        List {
            Section(content: {
                Toggle("Chimes", isOn: $chimesEnabled)
                NavigationLink(destination: ChimesScheduleView(), label: {
                    RowLabel(title: "Schedule", subtitle: "Hourly")
                })
                NavigationLink(destination: ChimesSoundsView(), label: {
                    RowLabel(title: "Sounds", subtitle: "Bells")
                })
            }, footer: {
                Text("When this is on, selected sounds and haptics will play on the hour.")
            })
        }
        .navigationTitle("Chimes")
    }
}

#Preview {
    NavigationStack{
        ChimesView()
    }
}
