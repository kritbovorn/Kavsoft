//
//  ForeachRectangle.swift
//  AnalogClockApp
//
//  Created by Kritbovorn Taweeyossak on 19/9/2563 BE.
//

import SwiftUI

struct ForeachRectangle: View {
    
    var size: CGSize
    
    var body: some View {
        
        ForEach(0..<60, id: \.self) { i in

            //              60 / 12 = 5
            Rectangle()
                .fill(Color.primary)
                .frame(width: (i % 5) == 0 ? size.height * 0.015 : size.height * 0.01, height: (i % 5) == 0 ? size.height * 0.03 : size.height * 0.015)
                .offset(y: ((size.height * 0.6) - ((size.height * 0.6) * 0.1)) / 2)
                .rotationEffect(Angle(degrees: Double(i) * 6))

        }
    }
}

struct ForeachRectangle_Previews: PreviewProvider {
    static var previews: some View {
        ForeachRectangle(size: CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
    }
}
