//
//  ContentView.swift
//  cs193p-1
//
//  Created by chanwoo on 2020/06/28.
//  Copyright © 2020 chanwoo. All rights reserved.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
    
    var body: some View {
        Grid(viewModel.cards) { card in
            CardView(card: card).onTapGesture {
                self.viewModel.choose(card: card)
            }
            .padding(5)
        }
        .padding()
        .foregroundColor(Color.orange)
    }
}



struct CardView : View {
    var card: MemoryGame<String>.Card
    var body : some View {
        GeometryReader(content: { geometry in
            self.body(for: geometry.size)
        })
    }
    
    // MARK: - Drawing Constants
    
    func body(for size: CGSize) -> some View {
        ZStack {
            if self.card.isFaceUp {
                RoundedRectangle(cornerRadius: cornerRadius).fill(Color.white)
                RoundedRectangle(cornerRadius: cornerRadius).stroke(lineWidth: edgeLineWidth)
                Text(self.card.content)
            } else {
                if (!card.isMatched){
                    RoundedRectangle(cornerRadius: cornerRadius).fill()
                }
                
            } // if .. else ..
        }
        .font(Font.system(size: fontSize(for: size)))
    }
    
    let cornerRadius: CGFloat = 10.0
    let edgeLineWidth: CGFloat = 3
    func fontSize(for size: CGSize) -> CGFloat {
        min(size.width, size.height)*0.75
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiMemoryGameView(viewModel: EmojiMemoryGame())
    }
}
