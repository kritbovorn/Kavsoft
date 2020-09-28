//
//  BaseView.swift
//  CurvedTabBar
//
//  Created by Kritbovorn Taweeyossak on 28/9/2563 BE.
//

import SwiftUI

struct BaseView<Content: View>: View {
    
    var content: Content
 
    var indexSelected: Binding<Int>
    
    init(index: Binding<Int>, @ViewBuilder content: () -> Content) {
        self.content = content()
        self.indexSelected = index
    }
    
    var body: some View {
        
        GeometryReader { main in
            VStack(spacing: 0) {
                
                // FIXME: - First
                GeometryReader { first in
                    
                    VStack(spacing: 0) {
                        
                        // FIXME: - Content 
                        content
                    }
                    .ignoresSafeArea(.all, edges: .top)
                }
                .frame(height: main.size.height * 0.92)
                
                // FIXME: - Second
                GeometryReader { second in
                    
                    CustomTabs(metric: second, index: indexSelected)
                        .frame(width: second.size.width, height: second.size.height)
                }
                .frame(height: main.size.height * 0.08)
                .background(Color.white)
                
            }
            .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)
            .background(Color.black.opacity(0.05))
            .ignoresSafeArea(.all, edges: .all)
        }
    }
}

struct BaseView_Previews: PreviewProvider {
    static var previews: some View {
        BaseView(index: .constant(0)) {
            Text("Boie")
        }
    }
}


// FIXME: - Button TabViews
struct CustomTabs: View {
    
    var metric: GeometryProxy
    
    @Binding var index: Int
    
    func proxyHeight(for metric: GeometryProxy) -> CGFloat {
        let proxyHeight = metric.size.height * 0.26
        
        return proxyHeight
    }
    
    func proxyHeightSelected(for metric: GeometryProxy) -> CGFloat {
        let proxyHeight = metric.size.height * 0.4
        
        return proxyHeight
    }
    
    func proxyHeightest(for metric: GeometryProxy) -> CGFloat {
        let proxyHeight = metric.size.height * 0.9
        
        return proxyHeight
    }
    
    var body: some View {
        
        HStack {
            

            ButtonTabView(metric: metric, imageName: "house.fill", index: 0, indexSelected: $index)
            
            Spacer()
            
            ButtonTabView(metric: metric, imageName: "magnifyingglass.circle.fill", index: 1, indexSelected: $index)
                .offset(x: proxyHeightSelected(for: metric))
            
            Spacer()
            
            // FIXME: - Plus Button
            Button(action: {
                
            }, label: {
                Image(systemName: "plus.circle.fill")
                    .font(.system(size: proxyHeightest(for: metric), weight: .bold))
                    .foregroundColor(.blue)
                    
            })
            .padding()
            .background(Color.white)
            .clipShape(Circle())
            .offset(y: -proxyHeight(for: metric) * 2)
            
            Spacer()


            ButtonTabView(metric: metric, imageName: "heart.circle", index: 2, indexSelected: $index)
                .offset(x: -proxyHeightSelected(for: metric))
            
            Spacer()
            
  
            ButtonTabView(metric: metric, imageName: "person.fill", index: 3, indexSelected: $index)
            

                
        }
        .padding(.horizontal, proxyHeight(for: metric))


    }
    
}

// FIXME: - Button Object
struct ButtonTabView: View {
    
    
    var metric: GeometryProxy
    
    var imageName: String
    var index: Int
    @Binding var indexSelected: Int
    
    func proxyHeight(for metric: GeometryProxy) -> CGFloat {
        let proxyHeight = metric.size.height * 0.45
        
        return proxyHeight
    }
    
    func proxyHeightSelected(for metric: GeometryProxy) -> CGFloat {
        let proxyHeight = metric.size.height * 0.55
        
        return proxyHeight
    }
    
    var body: some View {
        
        Button(action: {

            withAnimation {
                indexSelected = index
            }
        }, label: {
            Image(systemName: imageName)
                .font(.system(size: index == indexSelected ? proxyHeightSelected(for: metric) : proxyHeight(for: metric), weight: .bold))
                .foregroundColor(Color.black.opacity(index == indexSelected ? 1 : 0.3))
                .frame(width: proxyHeight(for: metric), height: proxyHeight(for: metric) )
        })
    }
    
}


// FIXME: - 1. ต้อง ประกาศ ตัวแปร State private var : ไว้ที่หน้ารับค่า เพื่อ รับรู้ว่า อยู่ที่ index ตัวไหน
//          @State private var index: Int = 0

