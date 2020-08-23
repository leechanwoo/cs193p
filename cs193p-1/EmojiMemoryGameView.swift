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
        VStack {
            Grid(viewModel.cards) { card in
                CardView(card: card).onTapGesture {
                    withAnimation(.linear(duration: 0.75)) {
                        self.viewModel.choose(card: card)
                    }
                }
                .padding(5)
            }
            .padding()
            .foregroundColor(Color.orange)
            
            Button(action: {
                withAnimation(.easeInOut) {
                    self.viewModel.resetGame()
                }
                
            }, label: { Text("New Game") })
        }
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
    
    @State private var animatedBonusRemaining: Double = 0
    
    private func startBonusAnimation() {
        animatedBonusRemaining = card.bonusRemaining
        withAnimation (.linear(duration: card.bonusTimeRemaining) ) {
            animatedBonusRemaining = 0
        }
    }
    
    @ViewBuilder 
    private func body(for size: CGSize) -> some View {
        if card.isFaceUp || !card.isMatched {
            ZStack {
                Group {
                    if card.isConsumingBonusTime {
                        Pie(startAngle: .degrees(0-90), endAngle: .degrees(-animatedBonusRemaining*360-90), clockwise: true)
                            
                            .onAppear() {
                                self.startBonusAnimation()
                        }
                    } else {
                        Pie(startAngle: .degrees(0-90), endAngle: .degrees(-card.bonusRemaining*360-90), clockwise: true)
                        
                    }
                }
                .padding(5).opacity(0.4)
                
                Text(self.card.content)
                    .font(Font.system(size: fontSize(for: size)))
                    .rotationEffect(Angle.degrees(card.isMatched ? 360 : 0))
                    .animation(card.isMatched ? Animation.linear(duration: 1).repeatForever(autoreverses: false) : .default)
            }
            .cardify(isFaceUp: card.isFaceUp)
            .transition(AnyTransition.scale)
        }
    }
    
    
    private func fontSize(for size: CGSize) -> CGFloat {
        min(size.width, size.height)*0.75
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        game.choose(card: game.cards[0])
        return EmojiMemoryGameView(viewModel: game)
    }
}
