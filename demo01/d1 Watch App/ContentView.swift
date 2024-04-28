//
//  ContentView.swift
//  d1 Watch App
//
//  Created by 宋晓明 on 2024/4/26.
//

import SwiftUI

struct ContentView: View {
    
    @State var moveOnPath = false
    
    var body: some View {
        
        VStack {
            Text("Simple Animation")
                .font(.system(size: 18,weight: .semibold))
                .foregroundStyle(.white)
            ZStack{
                ZStack{
                    Circle()
                        .stroke()
                        .frame(width: 100,height: 100,alignment: .center)
                    Image(systemName: "globe")
                        .imageScale(.small)
                        .foregroundStyle(.tint)
                        .frame(width: 10,height: 10,alignment: .center)
                        .foregroundColor(.red)
                        .offset(x: -50)
                        .rotationEffect(.degrees(moveOnPath ? 0 : 360))
                        .animation(Animation.linear(duration: 4).repeatForever(autoreverses: false))
                        .onAppear(){
                            moveOnPath.toggle()
                        }
                }
                .rotation3DEffect(
                    .degrees(70),
                    axis: (x: 20, y: 0, z: 0.0)
                )
                Image(systemName: "sun.min")
                    .imageScale(.large)
                    .foregroundStyle(.yellow)
            }
        }
    }
}

#Preview {
    ContentView()
}
