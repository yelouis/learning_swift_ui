//
//  MemoryGame.swift
//  memorize
//
//  Created by Nathaniel Veimau (old comp) on 8/16/20.
//  Copyright © 2020 Pythia. All rights reserved.
//

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable {
    var cards: Array<Card>
    
    var indexOfOneAndOnlyFaceUpCard : Int? {
        get {
            faceUpCardIndices = cards.indices.filter { return cards[$0].isFaceUp }.only!
        }
        set {
            for i in cards.indices {
                cards[i].isFaceUp = (i == newValue)

            }
        }
    }
    
    
    mutating func choose(card: Card) {
        //sequential and using a comma
        if let chosenIndex = cards.firstIndex(matching: card), !cards[chosenIndex].isFaceUp, !cards[chosenIndex].isMatched {
            if let potentialMatchIndex = indexOfOneAndOnlyFaceUpCard {
                if cards[chosenIndex].content == cards[potentialMatchIndex].content {
                    cards[chosenIndex].isMatched = true
                    cards[potentialMatchIndex].isMatched = true
                }
            } else {
                for index in cards.indices {
                    cards[index].isFaceUp = false
                }
                indexOfOneAndOnlyFaceUpCard = chosenIndex
            }
            
            self.cards[chosenIndex].isFaceUp = true
        }
    }
    
    init(numCardPairs: Int, cardContentFactory: (Int) -> CardContent) {
        cards = Array<Card>()
        for i in 0..<numCardPairs {
            let content = cardContentFactory(i)

            cards.append(Card(content: content, id: i*2))
            cards.append(Card(content: content, id: i*2+1))
        }
    }
    
    struct Card: Identifiable {
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var content: CardContent
        
        var id: Int
        
    }
}
