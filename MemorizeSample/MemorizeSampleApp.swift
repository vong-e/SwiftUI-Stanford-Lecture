//
//  MemorizeSampleApp.swift
//  MemorizeSample
//
//  Created by KIM SONGBONG on 2021/12/03.
//

import SwiftUI

@main
struct MemorizeSampleApp: App {
    let game = EmojiMemoryGame()
    
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: game)
        }
    }
}
