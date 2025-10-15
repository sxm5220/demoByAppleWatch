//
//  AirplaneModeView.swift
//  demo07 Watch App
//
//  Created by 宋晓明 on 2025/9/26.
//

import SwiftUI

struct AirplaneModeView: View {
    // Variables
    @State private var airplaneModeEnabled = false
    
    var body: some View {
        List {
            Toggle("Airplane Mode", isOn: $airplaneModeEnabled)
        }
        .navigationTitle("Airplane Mode")
    }
}

#Preview {
    NavigationStack{
        AirplaneModeView()
    }
}
