//
//  SocialMediaListView.swift
//  Landmark
//
//  Created by Vatsal Kulshreshtha on 08/08/19.
//  Copyright © 2019 Vatsal Kulshreshtha. All rights reserved.
//

//import SwiftUI
//import SafariServices
//
//struct Account: Identifiable {
//    var id: Int
//    
//    let image, name, username, url: String
//}
//
//struct SocialMediaListView: View {
//    let accounts: [Account] = [
//           .init(id: 0, image: "github", name: "Github", username: "randomgithubuser", url: "https://github.com"),
//           .init(id: 1, image: "linkedin", name: "LinkedIn", username: "randomlinkedinurl", url: "https://www.linkedin.com/in/vatsal-kulshreshtha-4251375a"),
//           .init(id: 2, image: "instagram", name: "Instagram", username: "randominstauser", url: "http://instagram.com/")
//       ]
//    var body: some View {
//        NavigationView{
//            List(accounts, id: \.id) { acc in
//                HStack {
//                    Image(acc.image)
//                        .resizable()
//                        .frame(width: 40, height: 40)
//                    VStack(alignment: .leading) {
//                        Text(acc.name)
//                            .font(.headline)
//                        Text("\(acc.username)")
//                            .font(.subheadline)
//                        Button(action: {
//                            HapticManager.shared.hardFeedback()
//                            if let url = URL(string: acc.url) {
//                                UIApplication.shared.open(url)
//                            }
//                        }){
//                            Text("")
//                        }
//                    }
//                }
//                
//            }
//            
//        }
//    }
//}
//
//#if DEBUG
//struct SocialMediaListView_Previews: PreviewProvider {
//    static var previews: some View {
//        SocialMediaListView()
//    }
//}
//#endif
