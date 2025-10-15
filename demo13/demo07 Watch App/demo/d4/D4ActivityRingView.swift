//
//  D4ActivityRingView.swift
//  demo07 Watch App
//
//  Created by 宋晓明 on 2025/9/30.
//

import SwiftUI

struct D4ActivityRingView: View {
    var progress: CGFloat
    var colors: [Color] = [Color.darkRed,Color.lightRed]
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(Color.outlineRed,lineWidth: 20)
            
            Circle()
                .trim(from: 0,to: progress)
                .stroke(
                    AngularGradient(
                        gradient: Gradient(colors: colors),
                        center: .center,
                        startAngle: .degrees(0),
                        endAngle: .degrees(360)
                    ),
                    style: StrokeStyle(lineWidth: 20,lineCap: .round)
                ).rotationEffect(.degrees(-90))
            
            Circle()
                .frame(width: 20,height: 20)
                .foregroundColor(Color.darkRed)
                .offset(y: -150)
            
            Circle()
                .frame(width: 20,height: 20)
                .foregroundColor(progress > 0.95 ? Color.lightRed : Color.lightRed.opacity(0))
                .offset(y: -150)
                .rotationEffect(Angle.degrees(360*Double(progress)))
                .shadow(color: progress > 0.96 ? Color.black.opacity(0.1) : Color.clear, radius: 3, x: 4, y: 0)
        }
        .frame(idealWidth: 300,idealHeight: 300,alignment: .center)
        .animation(.spring(response: 0.6,dampingFraction: 1.0,blendDuration: 1.0))
    }
}

#Preview {
    D4ActivityRingView(progress: 0.9)
}
