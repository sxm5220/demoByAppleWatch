//
//  d4.swift
//  demo07 Watch App
//
//  Created by 宋晓明 on 2025/9/30.
//

import SwiftUI

struct d4: View {
    
    var body: some View {
        NavigationStack{
            ZStack {
                Color.green.edgesIgnoringSafeArea(.all)
                D4ActivityRingView(progress: 0.5)
            }
        }
    }
}

#Preview {
    d4()
}
