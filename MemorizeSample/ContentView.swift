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
    @State var vehicles = ["🚗", "🚕", "🚙", "🚌", "🚎", "🏎", "🚑", "🚒", "🚐", "🛻", "🚚", "🚛", "🚜", "🚲", "🛵", "🏍", "🛺", "🚔", "🚍", "🚘", "🚖", "🚝", "🚞"]
    
    @State var worldFlags = ["🇰🇷", "🇹🇼", "🇩🇰", "🇳🇷", "🇳🇬", "🇬🇳", "🇬🇲", "🏳️‍🌈", "🏳️‍⚧️", "🇲🇬", "🇱🇮", "🇲🇴", "🇲🇼", "🇲🇾", "🇲🇭"]
    
    
    @State var heartSymbols = ["❤️", "🧡", "💛", "💚", "💙", "💜", "🖤", "🤍", "🤎", "💔", "❤️‍🔥", "❤️‍🩹", "❣️", "💕", "💞", "💓", "💗", "💟"]
    
//    @State var emojiCount = 6
    @State var selectedTheme: Theme = .vehicle
    
    
    var body: some View {
        VStack {
            Text("Memorize!")
                .font(.title)
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                    switch selectedTheme {
                    case .vehicle:
                        ForEach(vehicles[0..<vehicles.count], id: \.self ) { emoji in
                            CardView(content: emoji).aspectRatio(2/3, contentMode: .fit)
                        }
                    case .worldFlag:
                        ForEach(worldFlags[0..<worldFlags.count], id: \.self ) { emoji in
                            CardView(content: emoji).aspectRatio(2/3, contentMode: .fit)
                        }
                    case .heartSymbol:
                        ForEach(heartSymbols[0..<heartSymbols.count], id: \.self ) { emoji in
                            CardView(content: emoji).aspectRatio(2/3, contentMode: .fit)
                        }
                    }
                }
            }
            .foregroundColor(.red)
            Spacer()
            HStack {
                vehicleThemeButton
                worldFlagThemeButton
                heartSymbolThemeButton
            }
            .font(.largeTitle)
        }
        .padding(.horizontal)
    }
    
    var vehicleThemeButton: some View {
        Button {
            vehicles.shuffle()
            selectedTheme = .vehicle
        } label: {
            VStack {
                Image(systemName: "car")
                Text("Flag").font(.body)
            }
        }
    }
    
    var worldFlagThemeButton: some View {
        Button {
            worldFlags.shuffle()
            selectedTheme = .worldFlag
        } label: {
            VStack {
                Image(systemName: "flag")
                Text("Flag").font(.body)
            }
        }
    }
    
    var heartSymbolThemeButton: some View {
        Button {
            heartSymbols.shuffle()
            selectedTheme = .heartSymbol
        } label: {
            VStack {
                Image(systemName: "heart")
                Text("heart").font(.body)
            }
        }
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
    var content: String
    @State var isFaceUp: Bool = true
    
    var body: some View {
        ZStack {
            let shape  = RoundedRectangle(cornerRadius: 25)
            if isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(content).font(.largeTitle)
            } else {
                shape.fill()
            }
        }
        .onTapGesture {
            isFaceUp = !isFaceUp
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
//        ContentView()
//            .preferredColorScheme(.light)
    }
}
