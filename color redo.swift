//
//  color redo.swift
//  styler test proj
//
//  Created by Arthur Sh on 01.12.2022.
//

import SwiftUI

struct Colorie: View {
    var amount = 0.0
    var steps = 100
    var body: some View{
        ZStack{
            ForEach(0..<steps) { value in
                Capsule(style: .circular)
                    .inset(by: Double(value))
                    .strokeBorder(RadialGradient(gradient: Gradient(colors: [
                    inset(for: value, brightness: 1),
                    inset(for: value, brightness: 0.3)
                    
                    ]), center: .center, startRadius: 100, endRadius: 500))
            }
        }
        .drawingGroup()
    }
    
    func inset (for value: Int, brightness: Double) -> Color {
        var targetHue = Double(value) / Double(steps) + amount
        
        if targetHue > 1 {
            targetHue -= 1
        }
        
        return Color(hue: targetHue, saturation: 1, brightness: brightness)
    }
}

struct color_redo: View {
    @State private var amount = 0.0
    @State private var steps = 100
    
    
    var body: some View {
        VStack{
            Colorie(amount: amount, steps: steps)
                .frame(width: 300, height: 200)
            
            Slider(value: $amount)
          
            
        }
    }
}

struct color_redo_Previews: PreviewProvider {
    static var previews: some View {
        color_redo()
    }
}
