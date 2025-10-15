//
//  HealthDetailsView.swift
//  demo07 Watch App
//
//  Created by 宋晓明 on 2025/9/26.
//

import SwiftUI

struct HealthDetailsView: View {
    var body: some View {
        List {
            ClearRow(title: "Date of Birth", subtitle: "Not Set")
            ClearRow(title: "Sex", subtitle: "Not Set")
            ClearRow(title: "Height", subtitle: "0’ 0“ ft")
            ClearRow(title: "Weight", subtitle: "0 lbs")
            ClearRow(title: "Blood Type", subtitle: "Not Set")
            ClearRow(title: "Fitzpatrick Skin Type", subtitle: "Not Set")
            ClearRow(title: "Wheelchair", subtitle: "Not Set")
            ClearRow(title: "Medications That Affect Heart Rate", subtitle: "Not Set")
        }
        .navigationTitle("Health Details")
    }
}

#Preview {
    HealthDetailsView()
}
