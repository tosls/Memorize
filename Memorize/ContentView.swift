//
//  ContentView.swift
//  Memorize
//
//  Created by Антон Бобрышев on 27.05.2022.
//

import SwiftUI

struct ContentView: View {
    var vehiclesEmojis = ["✈️", "🚕", "🚂", "🚘", "🚲", "🚁", "🛥", "🛻", "🚜", "🚌", "🚗", "🚙", "🚎", "🏎", "🚓", "🚑", "🚒", "🚚", "🚛", "🛴", "🏍", "🚀", "🛸", "🛶"]
    var animalsEmojis = ["🐱", "🦋", "🦄", "🦕", "🐙", "🦧", "🐈‍⬛", "🐄", "🦬", "🦏", "🐊", "🦤", "🦦", "🦫", "🐋", "🐘", "🦍", "🐎", "🦜", "🦖", "🐍", "🦑", "🦇", "🦅"]
    var foodEmojis = ["🍏", "🍊", "🍌", "🍋", "🥒", "🌶", "🫑", "🍔", "🥩", "🥐", "🍖", "🍆", "🥝", "🧆", "🥗", "🌯", "🍇", "🥯", "🧀", "🥟", "🍚", "🍰", "🌰", "🍣"]
    
    @State var emojiTheme = ["✈️", "🚕", "🚂", "🚘", "🚲", "🚁", "🛥", "🛻", "🚜", "🚌", "🚗", "🚙", "🚎", "🏎", "🚓", "🚑", "🚒", "🚚", "🚛", "🛴", "🏍", "🚀", "🛸", "🛶"]
    @State var emojiCount = 8
    
    var body: some View {
        VStack {
            screenTitle
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                    ForEach(emojiTheme[0..<emojiCount], id: \.self) {
                        emoji in CardView(content: emoji).aspectRatio(2/3, contentMode: .fit)
                    }
                }
            }
            .foregroundColor(.red)
            Spacer()
            HStack {
                vehiclesEmojisTheme
                Spacer()
                animalsEmojisTheme
                Spacer()
                foodsEmojisTheme
            }
            .font(.largeTitle)
            .padding(.horizontal)
        }
        .padding(.horizontal)
    }
    
    var screenTitle: some View {
        Text("Memorize!").font(.largeTitle)
    }
    
    var removeCard: some View {
        Button {
            if emojiCount > 1 {
                emojiCount -= 1
            }
        } label: {
            VStack {
                Image(systemName: "minus.circle")
            }
        }
    }
    
    var addCard: some View {
        Button {
            if emojiCount < vehiclesEmojis.count {
                emojiCount += 1
            }
        } label: {
            Image(systemName: "plus.circle")
        }
    }
    
    var vehiclesEmojisTheme: some View {
        Button {
            emojiTheme = vehiclesEmojis.shuffled()
        } label: {
            VStack {
                Image(systemName: "car")
                Text("Vehicles").font(.system(size: 15))
            }
        }
    }
    var animalsEmojisTheme: some View {
        Button {
            emojiTheme = animalsEmojis.shuffled()
        } label: {
            VStack {
                Image(systemName: "pawprint")
                Text("Animals").font(.system(size: 15))
            }
        }
    }
    var foodsEmojisTheme: some View {
        Button {
            emojiTheme = foodEmojis.shuffled()
        } label: {
            VStack {
                Image(systemName: "cart")
                Text("Foods").font(.system(size: 15))
            }
        }
    }
}

struct CardView: View {
    var content: String
    @State var isFaceUp: Bool = true
    
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            
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
        Group {
            ContentView()
                .preferredColorScheme(.dark)
                .previewInterfaceOrientation(.portrait)
            ContentView()
                .preferredColorScheme(.light)
        }
    }
}
