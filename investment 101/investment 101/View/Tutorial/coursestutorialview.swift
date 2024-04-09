

import SwiftUI





struct CourseTutorialView: View {
    @Environment(\.dismiss) var dismiss
    @State private var currentPage = 0
    
    let pageHeadings = [ "Welcome to Investment 101", "Interactive Learning", "Investment Lessons"]
    
    let pageSubHeadings = [ "Embark on a journey to financial empowerment with our Investment 101 course. Gain the knowledge and skills needed to navigate the world of investments effectively.","Our course is designed for interactive learning. After each lesson, challenge yourself with quizzes to reinforce your understanding. Successful completion is your key to unlocking the next lesson.", "Explore a wide range of investment topics, from stock markets and bonds to real estate and more. Our comprehensive lessons will equip you with the tools to make informed financial decisions."
    ]
    let pageImages = [ "course-tutorial-1", "course-tutorial-2", "course-tutorial-3" ]
    
    init() {
        
        UIPageControl.appearance().currentPageIndicatorTintColor = .gray
        UIPageControl.appearance().pageIndicatorTintColor = .lightGray
    }
    
    
    var body: some View {

        VStack {
            TabView(selection: $currentPage) {
                ForEach(pageHeadings.indices) { index in
                    TutorialPage(image: pageImages[index], heading: pageHeadings[index], subHeading: pageSubHeadings[index])
                        .tag(index)
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .automatic))
            .animation(.default, value: currentPage)
            
            VStack(spacing: 20) {
                Button(action: {
                    
                    HapticManager.shared.mediumFeedback()
                    
                    if currentPage < pageHeadings.count - 1 {
                        currentPage += 1
                    } else {
                        UserDefaults.standard.set(true, forKey: "hasViewedCourseWalkthrough")
                        dismiss()
                    }
                }) {
                    Text(currentPage == pageHeadings.count - 1 ? "GET STARTED" : "NEXT")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .padding(.horizontal, 50)
                        .background(Color(.gray))
                        .cornerRadius(25)
                }
                if currentPage < pageHeadings.count - 1 {
                    Button(action: {
                        HapticManager.shared.rigidFeedback()
                        UserDefaults.standard.set(true, forKey: "hasViewedCourseWalkthrough")
                        dismiss()
                    }) {
                        Text("Skip")
                            .font(.headline)
                            .foregroundColor(Color(.darkGray))
                    }
                }
            }
            .padding(.bottom)
        }
        
    }
}

struct CourseTutorialView_Previews: PreviewProvider {
    static var previews: some View {
        CourseTutorialView()
        
        TutorialPage(image: "onboarding-1", heading: "TITLE", subHeading: "the description goes here")
            .previewLayout(.sizeThatFits)
    }
}

