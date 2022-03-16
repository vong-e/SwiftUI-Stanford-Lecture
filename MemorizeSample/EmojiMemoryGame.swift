//
//  EmojiMemoryGame.swift
//  MemorizeSample
//
//  Created by vongvorovongvong on 2022/03/14.
//

import SwiftUI


class EmojiMemoryGame: ObservableObject {
    static let vehicles = ["🚗", "🚕", "🚙", "🚌", "🚎", "🏎", "🚑", "🚒", "🚐", "🛻", "🚚", "🚛", "🚜", "🚲", "🛵", "🏍", "🛺", "🚔", "🚍", "🚘", "🚖", "🚝", "🚞"]
    
    static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: 4) { parIndex in
            vehicles[parIndex]
        }
    }
    
    @Published private var model: MemoryGame<String> = createMemoryGame()
    
    
    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }
    
    
    // MARK: - Intent(s)
    
    func choose(_ card: MemoryGame<String>.Card) {
        objectWillChange.send()
        model.choose(card)
    }
}
