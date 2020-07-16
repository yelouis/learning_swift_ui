//
//  EmojiMemoryGame.swift
//  memorize
//
//  Created by Louis Ye on 7/15/20.
//  Copyright © 2020 Louis Ye. All rights reserved.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    // MARK: - var game is really just the model
    @Published private(set) var game: MemoryGame<String> = EmojiMemoryGame.createMemoryGame()
    
    static func createMemoryGame() -> MemoryGame<String> {
        let emojis = ["👻", "🎃", "🕷", "👹", "😸"]
        // I was thinking that we can useInt.random(in: 2...emoji.count) instead.
        return MemoryGame<String>(numberOfPairsOfCards: Int.random(in: 2...5)) { pairIndex in
            return emojis[pairIndex]
        }
    }
    
    // MARK: - Access to the 'game' or the model
    var cards: Array<MemoryGame<String>.Card> {
        return game.cards
    }
    
    //MARK: - Intent(s)
    func choose(card: MemoryGame<String>.Card) {
        game.choose(card: card)
    }
}
