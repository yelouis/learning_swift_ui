//
//  EmojiMemoryGame.swift
//  memorize
//
//  Created by Louis Ye on 7/15/20.
//  Copyright © 2020 Louis Ye. All rights reserved.
//

import SwiftUI

class EmojiMemoryGame {
    // MARK: - var game is really just the model
    private(set) var game: MemoryGame<String> = EmojiMemoryGame.createMemoryGame()
    
    static func createMemoryGame() -> MemoryGame<String> {
        let emojis = ["👻", "🎃", "🕷"]
        return MemoryGame<String>(numberOfPairsOfCards: Int.random(in: 1...emojis.count)) { pairIndex in
            return emojis[pairIndex]
        }
    }
    
    // MARK: - Access to the 'game'
    var cards: Array<MemoryGame<String>.Card> {
        return game.cards
    }
    
    //MARK: - Intent(s)
    func choose(card: MemoryGame<String>.Card) {
        game.choose(card: card)
    }
}
