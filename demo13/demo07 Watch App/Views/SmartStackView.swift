//
//  SmartStackView.swift
//  demo07 Watch App
//
//  Created by 宋晓明 on 2025/9/26.
//

import SwiftUI

struct SmartStackView: View {
    var body: some View {
        List {
            NavigationLink("SMART_STACK_LIVE_ACTIVITIES_TITLE",destination: LiveActivitiesView())
            
            NavigationLink("SMART_STACK_LIVE_ACTIVITIES_TITLE",destination: WidgetSuggestionsView())
                
            }
        .navigationTitle("SMART_STACK_TITLE")
    }
}

#Preview {
    SmartStackView()
}
