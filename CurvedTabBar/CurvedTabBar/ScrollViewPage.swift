//
//  ScrollViewPage.swift
//  CurvedTabBar
//
//  Created by Kritbovorn Taweeyossak on 28/9/2563 BE.
//

import SwiftUI

struct ScrollViewPage: View {
    
    var metric: GeometryProxy
    var body: some View {
        
        ScrollView(.vertical, showsIndicators: false, content: {
            VStack {
                ForEach(0..<120, id: \.self) { item in
                    
                    HStack {
                        Spacer()
                        
                        Text("Text so very long very long \(item)")
                        
                        Spacer()
                    }
                    
                }
                
            }
            .padding(.bottom, metric.size.height * 0.08)
        })
        .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)
    }
}

struct ScrollViewPage_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader { main in
            VStack(spacing: 0) {
                
                ScrollViewPage(metric: main)
                
            }
        }
    }
}
