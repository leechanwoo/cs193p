//
//  EmojiMemoryGame.swift
//  cs193p-1
//
//  Created by chanwoo on 2020/07/05.
//  Copyright © 2020 chanwoo. All rights reserved.
//

import SwiftUI

class EmojiMemoryGame : ObservableObject {
    @Published private var model: MemoryGame<String> = EmojiMemoryGame.createMemoryGame()
    
    private static func createMemoryGame() -> MemoryGame<String> {
        let emojis: Array<String> = ["👻", "🎃", "👽"]
        return MemoryGame<String>(numberOfPairsOfCards: 3) { pairIndex in
            return emojis[pairIndex]
        }
    }
    
    
    // MARK: - Access to the Model
    
    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }
    
    // MARK: - Intent(s)
    
    
    func choose(card: MemoryGame<String>.Card){
        model.choose(card: card)
        
    }
}
