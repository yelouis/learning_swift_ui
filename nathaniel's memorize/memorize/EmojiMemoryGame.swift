//
//  EmojiMemoryGame.swift
//  memorize
//
//  Created by Nathaniel Veimau (old comp) on 8/16/20.
//  Copyright © 2020 Pythia. All rights reserved.
//

import SwiftUI


class EmojiMemoryGame: ObservableObject {
    @Published private var model: MemoryGame<String> = createMemoryGame()
    
    static func createMemoryGame() -> MemoryGame<String> {
        let emojis: Array<String> = ["🥶","🤬","😈"]
        
        return MemoryGame<String>(numCardPairs: emojis.count) { pairIndex in
            return emojis[pairIndex]
            
        }
    }
    
    
    //Access to model
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
    
    //Intents
    
    func choose (card: MemoryGame<String>.Card) {
        model.choose(card: card)
    }
}

