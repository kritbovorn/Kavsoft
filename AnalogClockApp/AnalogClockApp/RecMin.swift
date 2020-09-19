//
//  RecMin.swift
//  AnalogClockApp
//
//  Created by Kritbovorn Taweeyossak on 19/9/2563 BE.
//

import SwiftUI

struct RecMin: View {
    
    var size: CGSize
    @Binding var currentTime: Time
    
    var body: some View {
        
        Rectangle()
            .fill(Color.primary)
            .frame(width: size.height * 0.012, height: ((size.height * 0.6) - (size.height * 0.15)) / 2)
            .offset(y: ((size.height * 0.6) - (size.height * 0.18)) / 4)
            .rotationEffect(.init(degrees: (Double(currentTime.min) + (Double(currentTime.sec) / 60)) * 6))
    }
}


