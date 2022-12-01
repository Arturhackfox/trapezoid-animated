//
//  arrowView.swift
//  styler test proj
//
//  Created by Arthur Sh on 01.12.2022.
//

import SwiftUI

struct ArrowShape: InsettableShape {
    
    var inset: Double
    
    var animatableData: Double {
        get{inset}
        set{inset = newValue}
    }
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.midY))
        path.addLine(to: CGPoint(x: rect.maxX , y: rect.midY))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.midY))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.midY))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.maxY))
    

        return path
    }
    
    
    func inset(by amount: CGFloat) -> some InsettableShape {
        withAnimation{
            var inset = self
            inset.inset = amount
        
        return inset
        }
    }
}


struct arrowView: View {
    @State private var inset = 20.0
    
    var body: some View {
        NavigationStack{
            VStack{
                Spacer()
                ArrowShape(inset: inset)
                    .stroke(.yellow, style: StrokeStyle(lineWidth: inset, lineCap: .round, lineJoin: .round))
                    .frame(width: 250, height: 400 )
                Spacer()
                VStack{
                    NavigationLink{
                        colorWheelvIEW()
                    } label: {
                       Text("Next")
                    }
                    
                   
                    
                    
                    
                    
                }
                .padding(.vertical)
                
                
            }
            .padding()
            .toolbar{
                Button("Change line width"){
                    withAnimation(.easeIn(duration: 1)) {
                        inset += 15
                    }
                }
            }
        }
    }
}

struct arrowView_Previews: PreviewProvider {
    static var previews: some View {
        arrowView()
    }
}
