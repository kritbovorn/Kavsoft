//
//  ContentView.swift
//  CurvedTabBar
//
//  Created by Kritbovorn Taweeyossak on 27/9/2563 BE.
//
//  https://www.youtube.com/watch?v=6W2vuwWTAU4&list=PLimqJDzPI-H9h7HS40v-5QdwxoC4jrXQu

import SwiftUI

struct ContentView: View {
    
    @State private var index: Int = 0
    
    var body: some View {
        
        GeometryReader { main in
            VStack(spacing: 0) {
                
                BaseView(index: $index, content: {
                    if index == 0 {
                        
                        ScrollViewPage(metric: main)
                        
                    }
                    else if index == 1 {
                        Color.green
                    }
                    else if index == 2 {
                        Color.blue
                    }
                    else {
                        Color.black.opacity(0.05)
                    }
                })
                
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}




