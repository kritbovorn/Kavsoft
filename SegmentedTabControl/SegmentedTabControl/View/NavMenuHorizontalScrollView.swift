//
//  NavMenuHorizontalScrollView.swift
//  SegmentedTabControl
//
//  Created by Kritbovorn Taweeyossak on 30/9/2563 BE.
//

import SwiftUI

struct NavMenuHorizontalScrollView: View {
    
    var metric: GeometryProxy
    
    func proxyHeight(for metric: GeometryProxy) -> CGFloat {
        let proxyHeight = metric.size.height
        
        return proxyHeight
    }
    
    var body: some View {
        
        
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                
                // FIXME: - First Button
                VStack {
                    
                    Button(action: {
                        
                    }, label: {
                        
                        HStack {
                            
                            Image("Home")
                                .renderingMode(.original)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: proxyHeight(for: metric) * 0.4, height: proxyHeight(for: metric) * 0.4)
                            
                            Text("Home")
                                .foregroundColor(.black)
                                .font(.system(size: proxyHeight(for: metric) * 0.4, weight: .semibold))
                                .fixedSize()
                        }
                    })
                    
                    Capsule()
                        .fill(Color.white)
                        .frame(height: proxyHeight(for: metric) * 0.05)
                }
                .padding(.horizontal)
                
                // FIXME: - First Button
                VStack {
                    
                    Button(action: {
                        
                    }, label: {
                        
                        HStack {
                            
                            Image("Home")
                                .renderingMode(.original)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: proxyHeight(for: metric) * 0.4, height: proxyHeight(for: metric) * 0.4)
                            
                            Text("Home")
                                .foregroundColor(.black)
                                .font(.system(size: proxyHeight(for: metric) * 0.4, weight: .semibold))
                                .fixedSize()
                        }
                    })
                    
                    Capsule()
                        .fill(Color.white)
                        .frame(height: proxyHeight(for: metric) * 0.05)
                }
                .padding(.horizontal)
                
                
                // FIXME: - First Button
                VStack {
                    
                    Button(action: {
                        
                    }, label: {
                        
                        HStack {
                            
                            Image("Home")
                                .renderingMode(.original)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: proxyHeight(for: metric) * 0.4, height: proxyHeight(for: metric) * 0.4)
                            
                            Text("Home  Home Home Home  Home Home")
                                .foregroundColor(.black)
                                .font(.system(size: proxyHeight(for: metric) * 0.4, weight: .semibold))
                                .fixedSize()
                        }
                    })
                    
                    Capsule()
                        .fill(Color.white)
                        .frame(height: proxyHeight(for: metric) * 0.05)
                }
                .padding(.horizontal)
                
                // FIXME: - First Button
                VStack {
                    
                    Button(action: {
                        
                    }, label: {
                        
                        HStack {
                            
                            Image("Home")
                                .renderingMode(.original)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: proxyHeight(for: metric) * 0.4, height: proxyHeight(for: metric) * 0.4)
                            
                            Text("Home  Home ")
                                .foregroundColor(.black)
                                .font(.system(size: proxyHeight(for: metric) * 0.4, weight: .semibold))
                                .fixedSize()
                        }
                    })
                    
                    Capsule()
                        .fill(Color.white)
                        .frame(height: proxyHeight(for: metric) * 0.05)
                }
                .padding(.horizontal)
                
                // FIXME: - First Button
                VStack {
                    
                    Button(action: {
                        
                    }, label: {
                        
                        HStack {
                            
                            Image("Home")
                                .renderingMode(.original)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: proxyHeight(for: metric) * 0.4, height: proxyHeight(for: metric) * 0.4)
                            
                            Text("Home  Home Home")
                                .foregroundColor(.black)
                                .font(.system(size: proxyHeight(for: metric) * 0.4, weight: .semibold))
                                .fixedSize()
                        }
                    })
                    
                    Capsule()
                        .fill(Color.white)
                        .frame(height: proxyHeight(for: metric) * 0.05)
                }
                .padding(.horizontal)
                
                
                
            }
            .padding(.horizontal)
        }
    }
}



