//
//  TitleHeadView.swift
//  RecipeApp
//
//  Created by Kritbovorn Taweeyossak on 20/9/2563 BE.
//

import SwiftUI

struct TitleHeadView: View {
    
    func proxyHeight(for metric: GeometryProxy) -> CGFloat {
        let proxyHeight = metric.size.height * 0.1
        
        return proxyHeight
    }
    
    var metric: GeometryProxy
    
    var body: some View {
        
        HStack {
            Text("Top Recipes")
                .foregroundColor(.primary)
                .font(.system(size: proxyHeight(for: metric) * 0.4, weight: .heavy))
            Spacer()
        }
        .padding(.horizontal)
        
    }
}

