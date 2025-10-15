//
//  WorkoutView.swift
//  demo07 Watch App
//
//  Created by 宋晓明 on 2025/9/26.
//

import SwiftUI

struct WorkoutView: View {
    // Variables
    @AppStorage("LowPowerModeToggle") private var lowPowerModeEnabled = false
    
    var body: some View {
        List {
            Section {
                Toggle("Low Power Mode", isOn: $lowPowerModeEnabled)
            } footer: {
                Text("Turn on Low Power Mode during a workout. Learn more about [Low Power Mode...](#)")
            }
            
            Section {
                NavigationLink("Units of Measure", destination: UnitsMeasureView())
            }
        }
        .navigationTitle("Workout Data")
    }
}

#Preview {
    NavigationStack{
        WorkoutView()
    }
}
