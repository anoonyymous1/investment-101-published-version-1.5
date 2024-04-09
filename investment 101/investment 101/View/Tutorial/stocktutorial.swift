//
//  stocktutorial.swift
//  investment 101
//
//  Created by ian cheng on 1/24/24.
//

//import SwiftUI
//
//struct StockTutorialView: View {
//    @Environment(\.dismiss) var dismiss
//    
//    @State private var currentPage = 0
//    
//    let pageHeadings = [ "Understanding Stock Market Display", "Analyzing Stock Market Metrics", "Mastering Market Insights" ]
//    let pageSubHeadings = [ "Dive into the world of stock market data visualization and learn how to decipher the intricate details of stock prices, trends, and performance.","Discover how to analyze key stock market metrics displayed on our platform, from real-time stock prices to historical data, helping you make informed investment decisions.", "Gain valuable insights into the stock market with our intuitive display features. Explore advanced charts, live trading data, and more, empowering you to stay ahead in your investment journey."
//                            ]
//    let pageImages = [ "stock-tutorial-1", "stock-tutorial-2", "stock-tutorial-3" ]
//    init() {
//        
//
//        UIPageControl.appearance().currentPageIndicatorTintColor = .gray
//        UIPageControl.appearance().pageIndicatorTintColor = .lightGray
//    }
//    
//    var body: some View {
//        VStack {
//            TabView(selection: $currentPage) {
//                ForEach(pageHeadings.indices) { index in
//                    TutorialPage(image: pageImages[index], heading: pageHeadings[index], subHeading: pageSubHeadings[index])
//                        .tag(index)
//                }
//            }
//            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
//            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .automatic))
//            .animation(.default, value: currentPage)
//            
//            VStack(spacing: 20) {
//                Button(action: {
//                    HapticManager.shared.mediumFeedback()
//
//                    if currentPage < pageHeadings.count - 1 {
//                        currentPage += 1
//                    } else {
//                        UserDefaults.standard.set(true, forKey: "hasViewedStockWalkthrough")
//
//                        dismiss()
//                    }
//                }) {
//                    Text(currentPage == pageHeadings.count - 1 ? "GET STARTED" : "NEXT")
//                        .font(.headline)
//                        .foregroundColor(.white)
//                        .padding()
//                        .padding(.horizontal, 50)
//                        .background(Color(.gray))
//                        .cornerRadius(25)
//                }
//
//                if currentPage < pageHeadings.count - 1 {
//                    
//                    Button(action: {
//                        UserDefaults.standard.set(true, forKey: "hasViewedStockWalkthrough")
//
//                        HapticManager.shared.rigidFeedback()
//                        dismiss()
//                    }) {
//                        
//                        Text("Skip")
//                            .font(.headline)
//                            .foregroundColor(Color(.darkGray))
//                        
//                    }
//                }
//            }
//            .padding(.bottom)
//
//        }
//        
//    }
//}
//
//struct StockTutorialView_Previews: PreviewProvider {
//    static var previews: some View {
//        StockTutorialView()
//        
//        TutorialPage(image: "onboarding-1", heading: "TITLE", subHeading: "the description goes here")
//            .previewLayout(.sizeThatFits)
//    }
//}
