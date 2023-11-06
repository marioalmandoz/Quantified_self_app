////
////  ContentView.swift
////  DuoCase9
////
////  Created by Mario Almandoz Latierro on 25/10/23.
////
//import SwiftUI
//import HealthKit
//
//struct ContentView: View {
//    
//
//    @EnvironmentObject var manager: HealthManager
//    @State var selectedTab = "Home"
//    
//    var body: some View {
//        TabView(selection: $selectedTab) {
//            ContentView()
//                .environmentObject(manager)
//                .tag("Home")
//                .tabItem {
//                    Image(systemName: "house")
//                }
//            
//            ChartsView()
//                .environmentObject(manager)
//                .tag("Charts")
//                .tabItem {
//                    Image(systemName: "chart.line.uptrend.xyaxis")
//                }
//                
//            ContentView()
//                .tag("Content")
//                .tabItem { Image(systemName: "person")
//                }
//        }
//    }
//}
//
//
//struct ContentView_Preview: PreviewProvider {
//    static var previews: some View{
//        ContentView()
//            .environmentObject(HealthManager())
//    }
//}
