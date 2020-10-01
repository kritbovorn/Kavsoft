//
//  NavTitleView.swift
//  SegmentedTabControl
//
//  Created by Kritbovorn Taweeyossak on 30/9/2563 BE.
//

import SwiftUI

struct  NavTitleView: View {
    
    func proxyHeight(for metric: GeometryProxy) -> CGFloat {
        let proxyHeight = metric.size.height * 0.1
        
        return proxyHeight
    }
    
    var metric: GeometryProxy
    
    
    @Binding var index: Int
    
    var body: some View {

            HStack {
                Text(navMenus[index - 1].title)
                    .foregroundColor(Color(.systemGray6))
                    .font(.system(size: proxyHeight(for: metric) * 0.35, weight: .heavy))
                Spacer()
            }
            .padding(.horizontal)
        
    }
}


