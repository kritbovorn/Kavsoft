//
//  TabButtonView.swift
//  RecipeApp
//
//  Created by Kritbovorn Taweeyossak on 21/9/2563 BE.
//

import SwiftUI

struct TabButtonView: View {
    
    var title: String
    var metric: GeometryProxy
    @Binding var selectedTab: String
    
    
    func proxyHeight(for metric: GeometryProxy) -> CGFloat {
        let proxyHeight = metric.size.height * 0.1
        
        return proxyHeight
    }
    
    var body: some View {
            
            Button(action: {
                
                selectedTab = title
            }, label: {
                
                Label(title: {
                    
                    Text(title)
                        .font(.system(size: proxyHeight(for: metric) * 0.2, weight: .bold))
                    
                }, icon: {
                    
                    Image(title)
                        .renderingMode(.original)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: proxyHeight(for: metric) * 0.3, height: proxyHeight(for: metric) * 0.3)
                })
            })
            .foregroundColor(selectedTab == title ? Color(.systemRed) : Color(.systemGray))
            .padding(.vertical, proxyHeight(for: metric) * 0.1)
            .padding(.horizontal, proxyHeight(for: metric) * 0.2)
            
            .background(Color("yellow").opacity(selectedTab == title ? 0.4 : 0))
            .clipShape(Capsule())
            
           
    }
}

