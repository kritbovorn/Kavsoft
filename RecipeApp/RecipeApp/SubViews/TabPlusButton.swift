//
//  TabPlusButton.swift
//  RecipeApp
//
//  Created by Kritbovorn Taweeyossak on 22/9/2563 BE.
//

import SwiftUI

struct TabPlusButton: View {
    
    var metric: GeometryProxy
    
    func proxyHeight(for metric: GeometryProxy) -> CGFloat {
        let proxyHeight = metric.size.height * 0.1
        
        return proxyHeight
    }
    
    var body: some View {
        
        Button(action: {
            
        }, label: {
            Image("plus")
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .font(.system(size: proxyHeight(for: metric) * 0.4, weight: .bold))
                .frame(width: proxyHeight(for: metric) * 0.2, height: proxyHeight(for: metric) * 0.2)
                .padding(.vertical, proxyHeight(for: metric) * 0.2)
                .padding(.horizontal, proxyHeight(for: metric) * 0.5)
                .background(Color("orange"))
                .cornerRadius(proxyHeight(for: metric) * 0.3)
        })
    }
}

