//
//  FirstView.swift
//  SegmentedTabControl
//
//  Created by Kritbovorn Taweeyossak on 30/9/2563 BE.
//

import SwiftUI

struct FirstView: View {
    var body: some View {
        
        GeometryReader { main in
            
            ScrollView(.vertical, showsIndicators: false) {
                VStack {
                    
                    ForEach(1...5, id: \.self) { i in
                        Image("p\(i)")
                            .renderingMode(.original)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: main.size.width)
                            .cornerRadius(main.size.height * 0.02)
                            
                    }
                }
                
            }
            
        }
        .padding(.top)
        .padding(.horizontal)
    }
}

struct FirstView_Previews: PreviewProvider {
    static var previews: some View {
        FirstView()
    }
}
