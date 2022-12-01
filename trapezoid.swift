//
//  trapezoid.swift
//  styler test proj
//
//  Created by Arthur Sh on 01.12.2022.
//

import SwiftUI

struct TestShape: Shape {
    var insetAmount: Double
    var secondValue: Double

    
    var animatableData: AnimatablePair <Double, Double>{
        get{
          AnimatablePair(insetAmount, secondValue)
        }
        set{
            insetAmount = newValue.first
            secondValue = newValue.second

        }
    }
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint(x: 0, y: rect.maxY))
        path.addLine(to: CGPoint(x: insetAmount, y: rect.minY - secondValue))
        path.addLine(to: CGPoint(x: rect.maxX - insetAmount, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: 0, y: rect.maxY))
        path.closeSubpath()
        
        return path
    }
}

struct trapezoid: View {
    @State private var insetAmount = 50.0
    @State private var secondValue = 10.0
    @State private var color = Color.red
    
    @State private var blur = 0.0
    var body: some View {
        ZStack{
            Color.blue
            VStack{
                
                TestShape(insetAmount: insetAmount, secondValue: secondValue)
                    .frame(width: 300, height: 300)
                    .blur(radius: (1 - blur) * 20)
                    .background(color)
                    .saturation(blur)
                    .onTapGesture {
                        withAnimation{
                            insetAmount = Double.random(in: 10...100)
                            secondValue = Double.random(in: 1...100)
                            
                        }
                    }
                
                Slider(value: $blur)
                    .padding()
            }
            Text("Archi.ios")
                .font(.largeTitle.bold())
                .foregroundColor(.white)
        }
        .ignoresSafeArea()
    }
}

struct trapezoid_Previews: PreviewProvider {
    static var previews: some View {
        trapezoid()
    }
}
