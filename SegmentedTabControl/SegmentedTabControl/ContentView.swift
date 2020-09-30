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
                            
                            ScrollView(.horizontal, showsIndicators: false) {
                                NavMenuHorizontalScrollView(metric: subSecond)
                                    .frame(width: subSecond.size.width, height: subSecond.size.height)
                            }
                        }
                        .frame(height: first.size.height * 0.5)
                        .background(Color.yellow)
                       
                        
                    }
                }
                .frame(height: main.size.height * 0.15)
                .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)
                .background(Color.red)
                
                // FIXME: - Second
                GeometryReader { second in
                    EmptyView()
                }
                .frame(height: main.size.height * 0.05)
                .background(Color.gray)
                
                // FIXME: - Third
                GeometryReader { third in
                    EmptyView()
                }
                .frame(height: main.size.height * 0.8)
                .padding(.bottom, UIApplication.shared.windows.first?.safeAreaInsets.bottom)
                .background(Color.yellow)
                
                
            }
            .ignoresSafeArea(.all, edges: .all)
        }
    }
    
}
