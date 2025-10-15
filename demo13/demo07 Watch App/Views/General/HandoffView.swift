//
//  HandoffView.swift
//  demo07 Watch App
//
//  Created by 宋晓明 on 2025/9/26.
//

import SwiftUI

struct HandoffView: View {
    @State private var handoffEnabled = true
    
    var body: some View {
        List {
            Section {
                Toggle("ENABLE_CONTINUITY", isOn: $handoffEnabled)
            } footer: {
                Text("CONTINUITY_DESC_TEXT")
            }
        }
        .navigationTitle("CONTINUITY_TITLE")
    }
}

#Preview {
    NavigationStack{
        HandoffView()
    }
}
