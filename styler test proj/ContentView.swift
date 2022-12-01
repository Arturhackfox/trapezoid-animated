//
//  ContentView.swift
//  styler test proj
//
//  Created by Arthur Sh on 30.11.2022.
//

import SwiftUI

struct ContentView: View {
    @State private var amount = 0.0
    @State private var amount2 = 0.0
    
    
    var body: some View {
        NavigationStack{
            VStack{
                
                ZStack{
                    Circle()
                        .fill(.red)
                        .frame(height: 200 * amount)
                        .offset(x: -50,y: -80 )
                        .blendMode(.screen)
                    
                    Circle()
                        .fill(.blue)
                        .frame(height: 200 * amount)
                        .offset(x: 50,y: -80 )
                        .blendMode(.screen)
                    
                    Circle()
                        .fill(.yellow)
                        .frame(width: 200 * amount)
                        .blendMode(.screen)
                }
                .frame(width: 300, height: 300)
                Slider(value: $amount)
                    .padding()
                
                
                
                Image("6")
                    .resizable()
                    .scaledToFit()
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                    .frame(width: 300, height: 300)
                    .colorMultiply(.pink)
                    .saturation(amount2)
                    .blur(radius: (1 - amount2) * 20)
                
                
                Slider(value: $amount2)
                    .padding()
                
                
                
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.black)
            .ignoresSafeArea()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
