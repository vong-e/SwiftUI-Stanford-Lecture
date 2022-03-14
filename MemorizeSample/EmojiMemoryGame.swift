//
//  EmojiMemoryGame.swift
//  MemorizeSample
//
//  Created by vongvorovongvong on 2022/03/14.
//

import SwiftUI


class EmojiMemoryGame {
    static let vehicles = ["🚗", "🚕", "🚙", "🚌", "🚎", "🏎", "🚑", "🚒", "🚐", "🛻", "🚚", "🚛", "🚜", "🚲", "🛵", "🏍", "🛺", "🚔", "🚍", "🚘", "🚖", "🚝", "🚞"]
    
    static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: 4) { parIndex in
            vehicles[parIndex]
        }
    }
    
    private var model: MemoryGame<String> = createMemoryGame()
    
    
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
}
