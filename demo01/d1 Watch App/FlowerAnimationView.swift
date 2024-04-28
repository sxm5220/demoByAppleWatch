//
//  FlowerAnimationView.swift
//  d1 Watch App
//
//  Created by 宋晓明 on 2024/4/28.
//

import SwiftUI

struct FlowerAnimationView: View {
    @State private var rPetal = false
    @State private var mrPetal = false
    
    @State private var lPetal = false
    @State private var mlPetal = false
    
    @State private var customShadow = false
    
    var body: some View {
        ZStack{
            Color.black.ignoresSafeArea(.all,edges: .all)
            VStack{
                Text("Flower Animation")
                flowerView
            }
        }
    }
    
    var flowerView: some View {
        
        ZStack{
            Image("petal")
                .resizable()
                .frame(width: 40,height: 110,alignment: .center) //middle
                .rotationEffect(.degrees(0),anchor: .bottom)
            
            
            Image("petal")
                .resizable()
                .frame(width: 40,height: 110,alignment: .center) //middle left
                .rotationEffect(.degrees(mlPetal ? -25 : -5),anchor: .bottom)
                .animation(Animation.easeOut(duration: 2).delay(2).repeatForever(autoreverses: true))
                .onAppear{
                    mlPetal.toggle()
                }
            Image("petal")
                .resizable()
                .frame(width: 40,height: 110,alignment: .center) //left
                .rotationEffect(.degrees(lPetal ? -50 : -5),anchor: .bottom)
                .animation(Animation.easeOut(duration: 2).delay(2).repeatForever(autoreverses: true))
                .onAppear{
                    lPetal.toggle()
                }
            
            
            Image("petal")
                .resizable()
                .frame(width: 40,height: 110,alignment: .center) ///middle right
                .rotationEffect(.degrees(mrPetal ? 25 : 5),anchor: .bottom)
                .animation(Animation.easeOut(duration: 2).delay(2).repeatForever(autoreverses: true))
                .onAppear{
                    mrPetal.toggle()
                }
            
            Image("petal")
                .resizable()
                .frame(width: 40,height: 110,alignment: .center) //right
                .rotationEffect(.degrees(rPetal ? 50 : 5),anchor: .bottom)
                .animation(Animation.easeOut(duration: 2).delay(2).repeatForever(autoreverses: true))
                .onAppear{
                    rPetal.toggle()
                }
        }.shadow(color: Color.purple, radius: customShadow ? 20 : 0)
            .hueRotation(Angle(degrees: customShadow ? 0 : 165))
            .animation(Animation.easeInOut(duration: 2).delay(2).repeatForever(autoreverses: true))
            .onAppear{
                customShadow.toggle()
            }
        
    }
}

#Preview {
    FlowerAnimationView()
}
