//
//  ProgressView.swift
//  d1 Watch App
//
//  Created by 宋晓明 on 2024/4/28.
//  进度条

import SwiftUI

struct ProgressView: View {
    @Binding var progress: Double
    
    var body: some View {
        ZStack{
            Circle()
                .stroke(style: StrokeStyle(lineWidth: 4,dash: [1,2]))
                .opacity(0.3)
                .foregroundColor(.purple)
            
            Circle()
                .trim(from: 0.0,to: CGFloat(min(progress,1.0)))
                .stroke(style: StrokeStyle(lineWidth: 4,dash: [1,2]))
                .foregroundColor(.red)
                .rotationEffect(Angle(degrees: 270))
            
        }
    }
}
