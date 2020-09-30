//
//  ContentView.swift
//  SegmentedTabControl
//
//  Created by Kritbovorn Taweeyossak on 29/9/2563 BE.
//
//  https://www.youtube.com/watch?v=KdEqmYpQo6s

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        HomeView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct HomeView: View {
    
    @State private var index: Int = 1
    @State private var offset: CGFloat = .zero
    
    var body: some View {
        
        GeometryReader { main in
            VStack(spacing: 0) {
                
                // FIXME: - First
                GeometryReader { first in
                    
                    VStack(spacing: 0) {
                        
                        // FIXME: - Sub First
                        GeometryReader { subFirst in
                            
                            NavTitleView(metric: main)
                                .frame(width: subFirst.size.width, height: subFirst.size.height)
                        }
                        .frame(height: first.size.height * 0.5)
                        .background(Color.red)
                        
                        // FIXME: - Sub Second
                        GeometryReader { subSecond in
                            
                                NavMenuHorizontalScrollView(metric: subSecond, index: $index, offset: $offset)
                                    .frame(width: subSecond.size.width, height: subSecond.size.height)

                        }
                        .frame(height: first.size.height * 0.5)
//                        .background(Color.yellow)
                       
                        
                    }
                }
                .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)
                .frame(height: main.size.height * 0.17)
                
                .background(Color.red)

                
                // FIXME: - Third
                GeometryReader { third in
                    
                    FirstView()
                        
                        .frame(width: third.size.width)
                        
                    
                }
                .padding(.bottom, UIApplication.shared.windows.first?.safeAreaInsets.bottom == 0 ? 15 : UIApplication.shared.windows.first?.safeAreaInsets.bottom)
                .frame(height: main.size.height * 0.83)
                
                
                
            }
            
            
        }
        .ignoresSafeArea(.all, edges: .all)
    }
    
}
