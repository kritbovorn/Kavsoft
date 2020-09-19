//
//  RecSecond.swift
//  AnalogClockApp
//
//  Created by Kritbovorn Taweeyossak on 19/9/2563 BE.
//

import SwiftUI

struct RecSecond: View {
    
    var size: CGSize
    @Binding var currentTime: Time
    var body: some View {
        
        Rectangle()
            .fill(Color.primary)
            .frame(width: size.height * 0.005, height: ((size.height * 0.6) - (size.height * 0.15)) / 2)
            .offset(y: -((size.height * 0.6) - (size.height * 0.05)) / 5)
            .rotationEffect(.init(degrees: Double(currentTime.sec) * 6))
    }
}

//struct RecSecond_Previews: PreviewProvider {
//    static var previews: some View {
//        RecSecond(size: CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height), currentTime: Time(sec: 0, min: 0, hour: 0))
//    }
//}
