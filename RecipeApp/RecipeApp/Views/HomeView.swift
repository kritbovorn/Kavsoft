//
//  HomeView.swift
//  RecipeApp
//
//  Created by Kritbovorn Taweeyossak on 20/9/2563 BE.
//

import SwiftUI

struct HomeView: View {
    
    @State private var searchText: String = ""
    @State private var selectedTab: String = "Home"
    
    func proxyHeight(for metric: GeometryProxy) -> CGFloat {
        let proxyHeight = metric.size.height * 0.1
        
        return proxyHeight
    }
    
    func proxyHeightSmall(for metric: GeometryProxy) -> CGFloat {
        let proxyHeight = metric.size.height * 0.06
        
        return proxyHeight
    }
    
    var body: some View {
            
            GeometryReader { main in
                    
                    VStack(spacing: 0) {
                        
                        // FIXME: - First
                        GeometryReader { first in
                            
                            NavView(metric: main)
                                .frame(width: first.size.width, height: first.size.height)
                            
                            
                        }
                        .frame(height: main.size.height * 0.08)
                        .background(Color.black.opacity(0.05).ignoresSafeArea(.all, edges: .top))
                        
                        
                        // FIXME: - Second
                        GeometryReader { second in
                            
                            ScrollView(.vertical, showsIndicators: false, content: {
                                
                                VStack(spacing: 0) {
                                    
                                    // FIXME: - SearchView()
                                    SearchView(metric: main, searchText: $searchText)
                                        .frame(width: main.size.width, height: proxyHeight(for: main))
                                    
                                    // FIXME: - TitleHeadView()
                                    TitleHeadView(metric: main)
                                        
                                        .frame(width: main.size.width, height: proxyHeight(for: main))
                                    
                                    // FIXME: - RecipeCardView()
                                    ScrollView(.horizontal, showsIndicators: false) {
                                        
                                        HStack(spacing: proxyHeight(for: main) * 0.2) {
                                            
                                            ForEach(recipes, id: \.title) { recipe in
                                                RecipeCard(recipe: recipe, metric: main)
                                            }
                                        }
                                        .padding(.horizontal)
                                    }
                                    
                                    // FIXME: - CategoryCardView()
                                    ScrollView(.horizontal, showsIndicators: false) {
                                        HStack(spacing: proxyHeight(for: main) * 0.2) {
                                            ForEach(categories, id: \.self) { cate in
                                                
                                                Button(action: {
                                                    
                                                }, label: {
                                                    CategoryCardView(title: cate, metric: main)
                                                })

                                            }
                                        }
                                        .padding()
                                        
                                    }
                                    .padding([.top, .bottom], proxyHeight(for: main) * 0.3)
                                    
                                    // FIXME: - RecipeCardView()
                                    ScrollView(.horizontal, showsIndicators: false) {
                                        
                                        HStack(spacing: proxyHeight(for: main) * 0.2) {
                                            
                                            ForEach(recipes, id: \.title) { recipe in
                                                RecipeCard(recipe: recipe, metric: main)
                                            }
                                        }
                                        .padding(.horizontal)
                                    }
                                    .padding(.bottom, main.size.height * 0.05)
                                    
                                }
                            })
                        }
                        .frame(height: main.size.height * 0.82)
                        .background(Color.black.opacity(0.05))
                        
                        // FIXME: - Third
                        GeometryReader { third in
                            
                            TabBarView(metric: main, selectedTab: $selectedTab)

                                
                        }
                        .frame(height: main.size.height * 0.1)
                        .background(Color.black.opacity(0.05))
                        
                        
                    }
                    .background(Color.black.opacity(0.05).ignoresSafeArea(.all, edges:  .all))
    
            }
            .background(Color.red.opacity(0.05).ignoresSafeArea(.all, edges: .top))
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
