//
//  ContentView.swift
//  MemorizeSample
//
//  Created by KIM SONGBONG on 2021/12/03.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25)
                .stroke(lineWidth: 3)
            Text("Hello, world!")
        }
        .padding(.horizontal)
        .foregroundColor(.red)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
