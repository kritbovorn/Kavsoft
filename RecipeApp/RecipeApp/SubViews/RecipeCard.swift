//
//  RecipeCard.swift
//  RecipeApp
//
//  Created by Kritbovorn Taweeyossak on 21/9/2563 BE.
//

import SwiftUI

struct RecipeCard: View {
    
    var recipe: Recipe
    var metric: GeometryProxy
    
    func proxyHeight(for metric: GeometryProxy) -> CGFloat {
        let proxyHeight = metric.size.height * 0.1
        
        return proxyHeight
    }
    
    func proxyImageHeight(for metric: GeometryProxy) -> CGFloat {
        let proxyHeight = metric.size.height * 0.15
        
        return proxyHeight
    }
    
    func proxyWidth(for metric: GeometryProxy) -> CGFloat {
        
        let proxyWidth = metric.size.width
        return proxyWidth
    }
    
    var body: some View {
        
        VStack(alignment: .leading) {
            
            HStack {
                Spacer()
                
                Image(recipe.image)
                    .renderingMode(.original)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: proxyImageHeight(for: metric), height: proxyImageHeight(for: metric))
            }
            
            Text(recipe.title)
                .foregroundColor(.primary)
                .font(.system(size: proxyHeight(for: metric) * 0.3, weight: .bold))
                .lineLimit(1)
            
            HStack {
                
                Label(title: {
                    
                    Text(recipe.rating)
                        .foregroundColor(Color(.systemGray))
                        .font(.system(size: proxyHeight(for: metric) * 0.15, weight: .bold))
                }, icon: {
                    Image(systemName: "star.fill")
                        .font(.system(size: proxyHeight(for: metric) * 0.1, weight: .bold))
                        .foregroundColor(Color(.systemYellow).opacity(0.7))

                })
                .padding(.horizontal, proxyHeight(for: metric) * 0.12)
                .padding(.vertical, proxyHeight(for: metric) * 0.08)
                .background(Color(.systemBlue).opacity(0.4))
                .cornerRadius(proxyHeight(for: metric) * 0.1)
                
                Text(recipe.type)
                    .foregroundColor(Color(.systemGray))
                    .font(.system(size: proxyHeight(for: metric) * 0.15, weight: .bold))
                    .padding(.horizontal, proxyHeight(for: metric) * 0.12)
                    .padding(.vertical, proxyHeight(for: metric) * 0.08)
                    .background(Color(.systemBlue).opacity(0.4))
                    .cornerRadius(proxyHeight(for: metric) * 0.1)
                    
                    
            }
            
            
            Text(recipe.detail)
                .foregroundColor(Color(.systemGray))
                .font(.system(size: proxyHeight(for: metric) * 0.2, weight: .bold))
                .lineLimit(3)
                .frame( height: proxyHeight(for: metric) * 1.2)     // FIXME: - กำหนด ความสูงของ Detail Text
            
            HStack(spacing: 0) {
                
                ForEach(1...4, id: \.self) { i in
                    
                    Image("p\(i)")
                        .renderingMode(.original)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: proxyHeight(for: metric) * 0.4, height: proxyHeight(for: metric) * 0.4)
                        .clipShape(Circle())
                    // OffSet()
                        .offset(x: -CGFloat(i) * proxyHeight(for: metric) * 0.12)
                }
                
                Text("25+ Likes.")
                    .foregroundColor(Color(.systemGray).opacity(0.8))
                    .font(.system(size: proxyHeight(for: metric) * 0.15, weight: .bold))
                    .padding(.leading, -proxyHeight(for: metric) * 0.3)
                
                

            }
            .padding(.horizontal)
            .padding(.bottom, proxyHeight(for: metric) * 0.2)
            
            HStack {
                
                Spacer()
                
                Button(action: {
                    
                }, label: {
                    
                    Label(title: {
                        
                        Text("Save")
                            .foregroundColor(.black)
                            .font(.system(size: proxyHeight(for: metric) * 0.2, weight: .bold))
                        
                    }, icon: {
                        Image(systemName: "suit.heart.fill")
                            .font(.system(size: proxyHeight(for: metric) * 0.25, weight: .bold))
                            .foregroundColor(Color(.systemRed))

                    })
                    .padding(.horizontal, proxyHeight(for: metric) * 0.15)
                    .padding(.vertical, proxyHeight(for: metric) * 0.15)
                    .background(Color(.systemGray6))
                    .clipShape(Capsule())
                })
                
            }
            

        }
        .padding(.horizontal)
        .frame(width: proxyWidth(for: metric) * 0.7)    // FIXME: - กำหนดควมกว้าง ของ Card
        .background(
            recipe.color.opacity(0.2)                           // FIXME: - สามารถ เลื่อนตำแหน่ง Background โดยใช้ Padding()
                .cornerRadius(proxyHeight(for: metric) * 0.15)
                .padding(.top, proxyHeight(for: metric) * 0.7)
                .padding(.bottom, proxyHeight(for: metric) * 0.2)
                
        )
        
    }
}


