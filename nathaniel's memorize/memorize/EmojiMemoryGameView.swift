//
//  EmojiMemoryGameView.swift
//  memorize
//
//  Created by Nathaniel Veimau (old comp) on 8/16/20.
//  Copyright © 2020 Pythia. All rights reserved.
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
            .font(Font.largeTitle)
    }
}

struct CardView: View {
    var card: MemoryGame<String>.Card

    var body: some View {
        GeometryReader { geometry in
            self.body(for: geometry.size)
        }
    }
    
    func body(for size: CGSize) -> some View {
        ZStack {
            if self.card.isFaceUp {
                RoundedRectangle(cornerRadius: self.cornerRadius).fill(Color.white)
                RoundedRectangle(cornerRadius: self.cornerRadius).stroke(lineWidth: self.edgeLineWidth)
                Text(self.card.content)
            } else {
                if !card.isMatched {
                    RoundedRectangle(cornerRadius: self.cornerRadius).fill()
                }
            }

        }
        .font(Font.system(size: fontSize(for: size)))
    }
    
    //Declaring constants
    let cornerRadius : CGFloat = 10.0
    let edgeLineWidth : CGFloat = 2.0
    let fontScaleFactor :  CGFloat = 0.75
    
    
    func fontSize(for size: CGSize) -> CGFloat {
        min(size.width, size.height) * self.fontScaleFactor
    }
}









struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiMemoryGameView(viewModel: EmojiMemoryGame())
    }
}
