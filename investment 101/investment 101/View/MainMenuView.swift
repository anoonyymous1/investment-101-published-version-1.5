//
//  MainMenuView.swift
//  investment 101
//
//  Created by Celine Tsai on 25/7/23.
//

import SwiftUI
import XCAStocksAPI

struct MainMenuView: View {
    @State private var selectedTab: Int = 0

    
    @State private var showCourseWalkthrough = !UserDefaults.standard.bool(forKey: "hasViewedCourseWalkthrough")
    @State private var showStockWalkthrough = !UserDefaults.standard.bool(forKey: "hasViewedStockWalkthrough")
    var body: some View {
        
        TabView(selection: $selectedTab) {
            //courses
            NavigationStack{
                UnitsView()
            }
            .tabItem {
                Image(systemName: "book.fill")
                Text("Learn")
            }
            .sheet(isPresented: $showCourseWalkthrough) {
                CourseTutorialView()
            }
            
//            .tag(0)
//            //stockview
//            NavigationStack{
//                redirectview()
//                    .onAppear()
//            }
//            .environmentObject(appVM)
//            .tabItem {
//                Image(systemName: "chart.line.uptrend.xyaxis")
//                Text("Stocks")
//            }
//            .sheet(isPresented: $showStockWalkthrough) {
//                StockTutorialView()
//            }
//            
//            .tag(1)
            
            NavigationStack{
                //profile view
                ProfileView()
            }
            .tabItem {
                Image(systemName: "person.fill")
                Text("Profile")
            }
            
            .tag(1)
        }
        .navigationBarBackButtonHidden(true)
    }
}
