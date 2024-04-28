//
//  sliderView.swift
//  d1 Watch App
//
//  Created by 宋晓明 on 2024/4/28.
//

import SwiftUI

let hueColors = stride(from: 0, to: 1, by: 0.01).map{
    Color(hue: $0, saturation: 1, brightness: 1)
}

private let gradient = LinearGradient(gradient: Gradient(colors: hueColors), startPoint: .leading, endPoint: .trailing)

struct SliderView: View {
    
    @State var progress: CGFloat = 0
    @State var angle: Double = 0
    private let circleW = 150.0
    private let circleH = 150.0
    
    var body: some View {
        VStack{
            Color.black.opacity(1).edgesIgnoringSafeArea(.all)
            //Slider + Drag Gestures
            Text("Slider + Drag Gestures")
                .font(.system(size: 16,weight: .semibold))
                .foregroundStyle(.white)
            sliderV
                .offset(x:-0.5,y:-11)
                .rotationEffect(.degrees(180))
        }
    }
    
    //滑动条
    var sliderV: some View {
        VStack{
            ZStack{
                Circle()
                    .stroke(Color.gray.opacity(0.2),style: StrokeStyle(lineWidth:10,lineCap: .round,lineJoin: .round))
                    .frame(width: circleW,height: circleW)
                
                Circle()
                    .trim(from: 0.0,to: progress)
                    .stroke(gradient,style: StrokeStyle(lineWidth: 10,lineCap: .round))
                    .frame(width: circleW,height: circleW)
                    .rotationEffect(.init(degrees: -90))
                //DragCircle
                Image(systemName:"star")
                    .resizable()
                    .frame(width: 20,height: 20)
                    .offset(x: circleW * 0.5)
                    .rotationEffect(.init(degrees: angle))
                    .gesture(DragGesture().onChanged(onDrag(value: )))
                    .rotationEffect(.init(degrees: -90))
                
                VStack{
                    Text("AnthonyDesignCode")
                        .foregroundColor(.white)
                        .font(.system(size: 12))
                        .fontWeight(.medium)
                        .rotationEffect(.degrees(180))
                    HStack{
                        Text("%")
                            .foregroundColor(.white)
                            .font(.system(size: 10))
                            .fontWeight(.regular)
                        
                        Text(String(format: "%.0f", progress * 100))
                            .foregroundColor(.white)
                            .font(.system(size: 30))
                            .fontWeight(.regular)
                            .rotationEffect(.degrees(180))
                        
                    }
                    
                    
                }
            }
            
        }
    }
    
    func onDrag(value: DragGesture.Value) {
        let vector = CGVector(dx: value.location.x, dy: value.location.y)
        let radians = atan2(vector.dy - 27.5, vector.dx - 27.5)
        var angle = radians * 180 / .pi
        if angle < 0 { angle = 360 + angle }
        withAnimation(Animation.linear(duration: 0.15)){
            let progress = angle / 360
            self.progress = progress
            self.angle = Double(angle)
        }
    }
}

#Preview {
    SliderView()
}
