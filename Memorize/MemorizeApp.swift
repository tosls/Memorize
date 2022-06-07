//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Антон Бобрышев on 27.05.2022.
//

import SwiftUI

@main
struct MemorizeApp: App {
    let game = EmojiMemoryGame()
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: game)
        }
    }
}
