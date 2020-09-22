//
//  CustomCorner.swift
//  RecipeApp
//
//  Created by Kritbovorn Taweeyossak on 21/9/2563 BE.
//

import SwiftUI

struct CustomCorner: Shape {
    
    var corners: UIRectCorner
    var sizeFloat: CGFloat
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: sizeFloat, height: sizeFloat))
        
        return Path(path.cgPath)
    }
}
