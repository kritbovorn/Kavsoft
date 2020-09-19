//
//  RecHour.swift
//  AnalogClockApp
//
//  Created by Kritbovorn Taweeyossak on 19/9/2563 BE.
//

import SwiftUI

struct RecHour: View {
    
    var size: CGSize
    @Binding var currentTime: Time
    
    var body: some View {
        
        Rectangle()
            .fill(Color.primary)
            .frame(width: size.height * 0.02, height: ((size.height * 0.6) - (size.height * 0.35)) / 2)
            .offset(y: -((size.height * 0.6) - (size.height * 0.2)) / 5)
            .rotationEffect(.init(degrees: (Double(currentTime.hour) + (Double(currentTime.min) / 60)) * 30))
    }
}


