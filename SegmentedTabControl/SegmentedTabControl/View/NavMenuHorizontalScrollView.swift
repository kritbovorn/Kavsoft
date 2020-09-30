//
//  NavMenuHorizontalScrollView.swift
//  SegmentedTabControl
//
//  Created by Kritbovorn Taweeyossak on 30/9/2563 BE.
//

import SwiftUI

struct NavMenuHorizontalScrollView: View {
    
    var metric: GeometryProxy
    @Binding var index: Int
    @Binding var offset: CGFloat
    
    func proxyHeight(for metric: GeometryProxy) -> CGFloat {
        let proxyHeight = metric.size.height
        
        return proxyHeight
    }
    
    var body: some View {
        
        
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                
                // FIXME: - First Button
              
                ForEach(navMenus) { nav in
                    
                    Button(action: {
                        
                        index = nav.id
                        
//                        withAnimation {
//                            index = nav.id
//                        }
                    }, label: {
                        
                        VStack {
                            
                            HStack {
                                
                                Image(systemName: nav.imageName)
                                    .foregroundColor(index == nav.id ? Color.white : Color.white.opacity(0.7))
                                    .font(.system(size: index == nav.id ? proxyHeight(for: metric) * 0.38 : proxyHeight(for: metric) * 0.3, weight: .bold))
                                    
                                
                                
                                
                                Text(nav.title)
                                    .foregroundColor(index == nav.id ? Color.white : Color.white.opacity(0.7))
                                    .font(.system(size: index == nav.id ? proxyHeight(for: metric) * 0.38 : proxyHeight(for: metric) * 0.36, weight: .bold))
                                    .fixedSize()
                            }
                            
                            Capsule()
                                .fill(index == nav.id ? Color.white : Color.clear)
                                .frame(height: proxyHeight(for: metric) * 0.05)
                            
                            
                        }
                    })
                    .padding(.horizontal)
                }
                
                
            }
            .padding(.horizontal)
        }
    }
}


// FIXME: - Data()  Example:
struct NavMenu: Identifiable {
    
    var id: Int
    var title: String
    var imageName: String
}

var navMenus = [
    NavMenu(id: 1, title: "Home", imageName: "house.fill"),
    NavMenu(id: 2, title: "Search", imageName: "magnifyingglass.circle.fill"),
    NavMenu(id: 3, title: "Profile", imageName: "person.crop.circle"),
    NavMenu(id: 4, title: "Favorites", imageName: "hands.sparkles.fill"),
    NavMenu(id: 5, title: "Solution", imageName: "gear"),
    NavMenu(id: 6, title: "Map", imageName: "map.fill"),
    NavMenu(id: 7, title: "Home", imageName: "house.fill"),
    NavMenu(id: 8, title: "Search", imageName: "magnifyingglass.circle.fill"),
    NavMenu(id: 9, title: "Profile", imageName: "person.crop.circle"),
    NavMenu(id: 10, title: "Favorites", imageName: "hands.sparkles.fill"),
    NavMenu(id: 11, title: "Solution", imageName: "gear"),
    NavMenu(id: 12, title: "Map", imageName: "map.fill")
    
]
