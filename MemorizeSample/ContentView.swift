//
//  ContentView.swift
//  MemorizeSample
//
//  Created by KIM SONGBONG on 2021/12/03.
//

import SwiftUI

enum Theme {
    case vehicle// = "vehicles"
    case worldFlag// = "worldFlags"
    case heartSymbol// = "heartSymbols"
}

struct ContentView: View {
//    @State var worldFlags = ["🇰🇷", "🇹🇼", "🇩🇰", "🇳🇷", "🇳🇬", "🇬🇳", "🇬🇲", "🏳️‍🌈", "🏳️‍⚧️", "🇲🇬", "🇱🇮", "🇲🇴", "🇲🇼", "🇲🇾", "🇲🇭"]
//    @State var heartSymbols = ["❤️", "🧡", "💛", "💚", "💙", "💜", "🖤", "🤍", "🤎", "💔", "❤️‍🔥", "❤️‍🩹", "❣️", "💕", "💞", "💓", "💗", "💟"]
    
    let viewModel: EmojiMemoryGame
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                ForEach(viewModel.cards) { card in
                    CardView(card: card)
                        .aspectRatio(2/3, contentMode: .fit)
                        .onTapGesture {
                            viewModel.choose(card)
                        }
                }
            }
        }
        .foregroundColor(.red)
        .padding(.horizontal)
    }
    
//    var remove: some View {
//        Button {
//            if emojiCount > 1 {
//                emojiCount -= 1
//            }
//        } label: {
//            Image(systemName: "minus.circle")
//        }
//    }
//
//    var add: some View {
//        Button {
//            if emojiCount < vehicles.count {
//                emojiCount += 1
//            }
//        } label: {
//            Image(systemName: "plus.circle")
//        }
//    }
}

struct CardView: View {
    let card: MemoryGame<String>.Card
     
    var body: some View {
        ZStack {
            let shape  = RoundedRectangle(cornerRadius: 25)
            if card.isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(card.content).font(.largeTitle)
            } else {
                shape.fill()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        ContentView(viewModel: game)
            .preferredColorScheme(.dark)
        ContentView(viewModel: game)
            .preferredColorScheme(.light)
    }
}
