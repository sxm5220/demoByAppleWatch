//
//  ShimmerEffectView.swift
//  d1 Watch App
//
//  Created by 宋晓明 on 2024/4/28.
//

import SwiftUI

struct TextShimmer: View {
    var text: String
    @State var animation = false
    @Binding var multiColors: Bool
    
    var body: some View {
        ZStack{
            Text(text)
                .font(.system(size: 35,weight: .bold))
                .foregroundColor(.white.opacity(0.25))
            HStack(spacing:0){
                ForEach(0..<text.count,id:\.self){ index in
                    Text(String(text[text.index(text.startIndex, offsetBy: index)]))
                        .font(.system(size: 35,weight: .bold))
                        .foregroundColor(multiColors ? randomColor() : Color.white)
                }
            }.mask(
                Rectangle()
                    .fill(LinearGradient(gradient: .init(colors: [Color.white.opacity(0.5),Color.white.opacity(0.5)]), startPoint: .top, endPoint: .bottom))
                    .rotationEffect(.init(degrees: 70))
                    .padding(20)
                    .offset(x: -250)
                    .offset(x: animation ? 500 : 0)
            ).onAppear(perform: {
                withAnimation(Animation.linear(duration: 2).repeatForever(autoreverses: false)){
                    animation.toggle()
                }
            })
        }
    }
    
    func randomColor() -> Color {
        let color = UIColor(red: 1, green: .random(in: 0...1), blue: .random(in: 0...1), alpha: 1)
        return Color(color)
    }
    
}

struct ShimmerEffectView: View {
    @State var multiColor = false
    
    var body: some View {
        VStack(spacing:5){
            TextShimmer(text: "Welcome", multiColors: $multiColor)
            TextShimmer(text: "WWDC2024", multiColors: $multiColor)
            Toggle(isOn: $multiColor, label: {
                Text("Let's Go MultiColor")
                    .font(.system(size: 12))
                    .fontWeight(.bold)
            }).padding()
        }.preferredColorScheme(.dark)
    }
}

#Preview {
    ShimmerEffectView()
}
