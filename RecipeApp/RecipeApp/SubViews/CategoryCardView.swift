//
//  CategoryCardView.swift
//  RecipeApp
//
//  Created by Kritbovorn Taweeyossak on 21/9/2563 BE.
//

import SwiftUI

struct CategoryCardView: View {
    
    var title: String
    var metric: GeometryProxy
    
    func proxyHeight(for metric: GeometryProxy) -> CGFloat {
        let proxyHeight = metric.size.height * 0.1
        
        return proxyHeight
    }
    
    var body: some View {
        
        VStack(spacing: proxyHeight(for: metric) * 0.5) {
            
            Image(title)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: proxyHeight(for: metric) / 2, height: proxyHeight(for: metric) / 2)
                .padding()
                .background(Color(.systemGray6))
                .clipShape(Circle())
            
            Text(title)
                .foregroundColor(Color("orange"))
                .font(.system(size: proxyHeight(for: metric) * 0.3, weight: .bold))
        }
        .padding(.vertical)
        .padding(.horizontal)
        .frame(height: proxyHeight(for: metric) * 2.5)    // FIXME: - กำหนดความสูง ของ View
        .background(Color("yellow").opacity(0.2))
        .clipShape(Capsule())
    }
}


