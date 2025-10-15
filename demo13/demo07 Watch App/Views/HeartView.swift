//
//  HeartView.swift
//  demo07 Watch App
//
//  Created by 宋晓明 on 2025/9/26.
//

import SwiftUI

struct HeartView: View {
    var body: some View {
        List {
            Section {
                
            } footer: {
                Text("The Heart Rate app has been deleted from your Apple Watch.")
            }
        }
        .navigationTitle("Heart")
    }
}

#Preview {
    NavigationStack{
        HeartView()
    }
}
