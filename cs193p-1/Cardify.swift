//
//  Cardify.swift
//  cs193p-1
//
//  Created by chanwoo on 2020/08/16.
//  Copyright © 2020 chanwoo. All rights reserved.
//

import SwiftUI


struct Cardify: ViewModifier {
    var isFaceUp: Bool
    
    func body(content: Content) -> some View {
        ZStack {
            if isFaceUp {
                RoundedRectangle(cornerRadius: cornerRadius).fill(Color.white)
                RoundedRectangle(cornerRadius: cornerRadius).stroke(lineWidth: edgeLineWidth)
                content
            } else {
                
                RoundedRectangle(cornerRadius: cornerRadius).fill()
                
            } // if .. else ..
        }
    }
    
    private let cornerRadius: CGFloat = 10.0
    private let edgeLineWidth: CGFloat = 3
}


extension View {
    func cardify(isFaceUp: Bool) -> some View {
        self.modifier(Cardify(isFaceUp: isFaceUp))
    }
}
