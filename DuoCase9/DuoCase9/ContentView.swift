
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
            ZStack
            {
                VStack{
                    TabView(selection: $selectedTab){
                        if selectedTab == .house {
                            HomeView()
                        }
                        else if selectedTab == .message
                        {
                            SleepTrack()
                        }
                        else if selectedTab == .leaf
                        {
                            BreatheCode()
                        }
                    }   
                }
                VStack{
                    Spacer()
                    CustomTabBar(selectedTab: $selectedTab)
                }

            }

        }
    
}
     
    struct ContentView_Preview: PreviewProvider {
        static var previews: some View{
            ContentView()
        }
    }
