
    //
    //  ContentView.swift
    //  DuoCase9
    //
    //  Created by Mario Almandoz Latierro on 25/10/23.
    //
    import SwiftUI
     
struct ContentView: View {
    @State private var selectedTab: Tab = .house
    
    init() {
        UITableView.appearance().isHidden = true
    }
    
    var body: some View {
        ZStack {
            Color(red: 0, green: 0, blue: 0.3, opacity: 1).edgesIgnoringSafeArea(.all) // Set the background color of the ZStack using hex color
            
            ZStack(alignment: .bottom) {
                // Content of the pages above the TabView and CustomTabBar
                VStack {
                    // Place your main page content here
                }
                
                // TabView and CustomTabBar layered on top of each other
                VStack {
                    TabView(selection: $selectedTab) {
                        if selectedTab == .house {
                            HomeView()
                        } else if selectedTab == .moon {
                            SleepTrack()
                        } else if selectedTab == .person {
                            BreatheCode()
                        }
                    }
                    .edgesIgnoringSafeArea(.bottom) // Ensure TabView doesn't overlap with safe area at the bottom
                    
                    CustomTabBar(selectedTab: $selectedTab)
                        .background(Color.clear) // Set the background of the CustomTabBar to clear
                }
            }
        }
    }
}

    

     
    struct ContentView_Preview: PreviewProvider {
        static var previews: some View{
            ContentView()
        }
    }
