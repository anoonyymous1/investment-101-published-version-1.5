//
//  SplashScreenView.swift
//  investment 101
//
//  Created by Celine Tsai on 19/1/24.
//

import SwiftUI
import Foundation

struct QuoteGenerator {
    static let quotes: [String: String] = [
        "Warren Buffett": "Price is what you pay. Value is what you get.",
        "Benjamin Graham": "The intelligent investor is a realist who sells to optimists and buys from pessimists.",
        "Peter Lynch": "Behind every stock is a company. Find out what it’s doing.",
        "Ray Dalio": "The most important thing is to be able to think independently, and to disagree. That’s how innovation happens.",
        "George Soros": "If investing is entertaining, if you’re having fun, you’re probably not making any money. Good investing is boring.",
        "John Bogle": "The stock market is a giant distraction to the business of investing.",
        "Charlie Munger": "The big money is not in the buying and the selling, but in the waiting.",
        "Philip Fisher": "The stock market is filled with individuals who know the price of everything, but the value of nothing.",
        "Jesse Livermore": "The key to making money in stocks is not to get scared out of them.",
        "Robert Kiyosaki": "It’s not about how much money you make, but how much money you keep, how hard it works for you, and how many generations you keep it for."
    ]


    static func getRandomQuote() -> (author: String, quote: String) {
        let randomIndex = quotes.index(quotes.startIndex, offsetBy: Int.random(in: 0..<quotes.count))
        let randomEntry = quotes[randomIndex]
        return (author: randomEntry.key, quote: randomEntry.value)
    }
}


struct SplashScreenView: View {

    // Dictionary of quotes with their authors
    let (author, quote) = QuoteGenerator.getRandomQuote()
//    private let quote = "\nThe best investment you can make is in yourself.\n"
//    private let author = "- Warren Buffet"
    
    @State private var displayedText = ""
    @State private var showAuthor = false
    @State private var rotationDegrees = 0.0
    @State private var typingTimer: Timer?
    @State private var loadingProgress = 0.0

    
    var body: some View {
        VStack(alignment: .center) {
           
            Image("inapp_icon")
                .resizable()
                .frame(width: 150, height: 150)
                .rotationEffect(.degrees(rotationDegrees))
                .onAppear {
                    withAnimation(Animation.easeInOut(duration: 1).repeatForever(autoreverses: false)) {
                        rotationDegrees = 360
                    }
                }

            Text(displayedText)
                .font(.system(.title3, design: .rounded))
                .bold()
                .frame(maxWidth: .infinity)
                .padding()
                .multilineTextAlignment(.center)

            if showAuthor {
                Text(author)
                    .italic()
                    .transition(.opacity)
            }
            
            // Loading Bar
            ProgressView(value: loadingProgress, total: 1)
                .progressViewStyle(LinearProgressViewStyle(tint: Color.black))
                .scaleEffect(x: 1, y: 2, anchor: .center)
                
                .padding()

        }
        .onAppear {
            startTypingAnimation()
        }
    }

    private func startTypingAnimation() {
        let totalCharacters = quote.count
        var currentIndex = 0
        let hapticInterval = 3
        
        
        typingTimer = Timer.scheduledTimer(withTimeInterval: 0.03, repeats: true) { timer in
            if currentIndex < totalCharacters {
                let index = quote.index(quote.startIndex, offsetBy: currentIndex)
                displayedText += String(quote[index])
                currentIndex += 1
                if currentIndex % hapticInterval == 0 {
                    HapticManager.shared.rigidFeedback()
                }
                loadingProgress = Double(currentIndex) / Double(totalCharacters)
            } else {
                HapticManager.shared.hardFeedback()
                timer.invalidate()
                showAuthor = true
                loadingProgress = 1
                // Add any actions you want to happen after the typing animation is complete
            }
        }
    }
}



struct SplashScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreenView()
    }
}
