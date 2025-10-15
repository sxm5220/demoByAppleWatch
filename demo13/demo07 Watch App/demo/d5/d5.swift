//
//  d5.swift
//  demo07 Watch App
//
//  Created by 宋晓明 on 2025/9/30.
//

import SwiftUI

struct d5: View {
    let deviceType = ["X1","Z1"]
    @State private var selectedType: String?
    
    var body: some View {
        NavigationStack{
            VStack(spacing: 3) {
                Image("x1")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
                Text("动思都有哪些设备？")
                    .font(.system(size: 15))
                
                if selectedType != .none {
                    Text(selectedType ?? "")
                        .font(.system(size: 30))
                        .foregroundColor(.green)
                        .id(selectedType)
                        .transition(.asymmetric(insertion: .opacity.animation(.easeInOut(duration: 0.5).delay(0.2)), removal: .opacity.animation(.easeInOut(duration: 0.4))))
                }
                
                Button {
                    selectedType = deviceType.shuffled().first{ $0 != selectedType }
                } label: {
                    Text(selectedType == .none ? "告诉我" : "换一个")
                        .font(.system(size: 25))
                        .animation(.none,value: selectedType)
                        .transformEffect(.identity)
                }
                
                Button{
                    selectedType = .none
                }label: {
                    Text("重置")
                        .font(.system(size: 25))
                }.buttonStyle(.bordered)
                
            }
            .buttonStyle(.borderedProminent)
            .buttonBorderShape(.capsule)
            .controlSize(.mini)
            .animation(.easeInOut(duration: 0.6), value: selectedType)
        }
    }
}

#Preview {
    d5()
}
