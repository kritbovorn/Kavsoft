//
//  NavMenuHorizontalScrollView.swift
//  SegmentedTabControl
//
//  Created by Kritbovorn Taweeyossak on 30/9/2563 BE.
//

import SwiftUI

struct NavMenuHorizontalScrollView: View {
    
    var metric: GeometryProxy
    
    func proxyHeight(for metric: GeometryProxy) -> CGFloat {
        let proxyHeight = metric.size.height
        
        return proxyHeight
    }
    
    var body: some View {
        
        
        HStack {
            
            // FIXME: - First Button
            VStack {
                
                Button(action: {
                    
                }, label: {
                    
                    HStack {
                        
                        Image("Home")
                            .renderingMode(.original)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: proxyHeight(for: metric) * 0.4, height: proxyHeight(for: metric) * 0.4)
                        
                        Text("Home  Home Home")
                            .foregroundColor(.black)
                            .font(.system(size: proxyHeight(for: metric) * 0.4, weight: .semibold))
                    }
                })
                
                Capsule()
                    .fill(Color.white)
                    .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: proxyHeight(for: metric) * 0.05)
            }
        }
    }
}



