//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Антон Бобрышев on 06.06.2022.
//

import SwiftUI


class EmojiMemoryGame: ObservableObject {
    
    static let animalsEmojis = ["🐱", "🦋", "🦄", "🦕", "🐙", "🦧", "🐈‍⬛", "🐄", "🦬", "🦏", "🐊", "🦤", "🦦", "🦫", "🐋", "🐘", "🦍", "🐎", "🦜", "🦖", "🐍", "🦑", "🦇", "🦅"]
    
    static let vehiclesEmojis = ["✈️", "🚕", "🚂", "🚘", "🚲", "🚁", "🛥", "🛻", "🚜", "🚌", "🚗", "🚙", "🚎", "🏎", "🚓", "🚑", "🚒", "🚚", "🚛", "🛴", "🏍", "🚀", "🛸", "🛶"]

    static let foodEmojis = ["🍏", "🍊", "🍌", "🍋", "🥒", "🌶", "🫑", "🍔", "🥩", "🥐", "🍖", "🍆", "🥝", "🧆", "🥗", "🌯", "🍇", "🥯", "🧀", "🥟", "🍚", "🍰", "🌰", "🍣"]
    
    static func createMemoryGame() -> MemoryGame<String> {
        
        MemoryGame<String>(numbersOfPairsOfCards: 20) { pairIndex in
            animalsEmojis[pairIndex]
        }
    }
  
    @Published private var model: MemoryGame<String> = createMemoryGame()
    
    var cards: Array<MemoryGame<String>.Card> {
        
        model.cards
    }
    
    func choose(_ card: MemoryGame<String>.Card) {
        
        model.choose(card)
    }
}
