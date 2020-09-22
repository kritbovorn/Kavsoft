//
//  TabBarView.swift
//  RecipeApp
//
//  Created by Kritbovorn Taweeyossak on 21/9/2563 BE.
//

import SwiftUI

struct TabBarView: View {
    
    var metric: GeometryProxy
    @Binding var selectedTab: String
    
    func proxyHeight(for metric: GeometryProxy) -> CGFloat {
        let proxyHeight = metric.size.height * 0.1
        
        return proxyHeight
    }
    
    func proxyWidth(for metric: GeometryProxy) -> CGFloat {
        
        let proxyWidth = metric.size.width
        return proxyWidth
    }
    
    
    var body: some View {
        
        
            
            HStack {
                
                TabButtonView(title: "Home", metric: metric, selectedTab: $selectedTab)
                
                Spacer()
                
                TabPlusButton(metric: metric)

                
                Spacer()
                
                TabButtonView(title: "Saved", metric: metric, selectedTab: $selectedTab)
            }
            
            .padding(.horizontal)
            .frame(width: proxyWidth(for: metric), height: proxyHeight(for: metric))
            .padding(.bottom, UIApplication.shared.windows.first?.safeAreaInsets.bottom == 0 ? 15 : UIApplication.shared.windows.first?.safeAreaInsets.bottom)
            .background(Color.white)
            .clipShape(CustomCorner(corners: [.topLeft, .topRight], sizeFloat: proxyHeight(for: metric) * 0.5))
            .shadow(color: Color.black.opacity(0.2), radius: proxyHeight(for: metric) * 0.1, x: 0, y: -proxyHeight(for: metric) * 0.1)
            
        
        
        
    }
}


