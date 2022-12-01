//
//  colorWheelvIEW.swift
//  styler test proj
//
//  Created by Arthur Sh on 01.12.2022.
//

import SwiftUI

struct ColorRect: View {
    var amount = 0.0
    var steps = 100
    var body: some View{
        ZStack{
            ForEach(0..<steps){value in
                RoundedRectangle(cornerRadius: 12)
                    .inset(by: CGFloat(value))
                    .strokeBorder(LinearGradient(gradient: Gradient(colors: [
                    color(for: value, brightness: 1),
                    color(for: value, brightness: 0.5)
                    ]), startPoint: .top, endPoint: .bottom))
            }
        }
        .drawingGroup()
    }
    
    func color (for value: Int, brightness: Double) -> Color {
        var targetHue = Double(value) / Double(steps) + amount
        
        if targetHue > 1 {
            targetHue -= 1
        }
        
        return Color(hue: targetHue, saturation: 1, brightness: brightness)
    }
}


struct colorWheelvIEW: View {
    @State private var amount = 0.0
    @State private var steps = 100
    var body: some View {
        ZStack{
            VStack{
                ColorRect(amount: amount, steps: steps)
                
                Slider(value: $amount)
            }
            .padding()
            
            Text("Archi.ios")
                .font(.title.bold())
                .underline()
                .foregroundColor(.black)
        }
    }
}

struct colorWheelvIEW_Previews: PreviewProvider {
    static var previews: some View {
        colorWheelvIEW()
    }
}
