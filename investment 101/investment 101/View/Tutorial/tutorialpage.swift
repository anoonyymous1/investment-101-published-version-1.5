//
//  TutorialView.swift
//  FoodPin
//
//  Created by Simon Ng on 8/10/2021.
//

import SwiftUI
import UIKit


struct TutorialPage: View {
    
    let image: String
    let heading: String
    let subHeading: String
    
    var body: some View {
        VStack(spacing: 70) {
            Image(image)
                .resizable()
                .scaledToFit()
            
            VStack(spacing: 10) {
                Text(heading)
                    .font(.headline)
                
                Text(subHeading)
                    .font(.body)
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.center)
            }
            .padding(.horizontal, 40)
            
            Spacer()
        }
        .padding(.top)
    }
}





//struct TutorialView_Previews: PreviewProvider {
//    static var previews: some View {
//        CourseTutorialView()
//        
//        TutorialPage(image: "onboarding-1", heading: "TITLE", subHeading: "the description goes here")
//            .previewLayout(.sizeThatFits)
//    }
//}
