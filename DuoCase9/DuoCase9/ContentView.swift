
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


//ZStack {
  //  Color.gray.opacity(0.8).ignoresSafeArea()
    //    TabView(selection: $selectedTab) {
      //      HomeView()
        //        .tag("Home")
          //      .tabItem {
            //        Image(systemName: "chart.line.uptrend.xyaxis")
//
  //              }
    //
      //      SleepTrack()
        //        .tag("Sleep")
          //      .tabItem {
            //        Image(systemName: "zzz")
              //  }
            
            //BreatheCode()
              //  .tag("Breathing")
                //.tabItem { Image(systemName: "waveform.path.ecg")
                //}
       // }
    
//}

//ForEach(Tab.allCases, id: \.rawValue) { tab in HStack {
//    Image(systemName: tab.rawValue)
//    Text("\(tab.rawValue.capitalized)")
//        .bold()
//        .animation(nil,  value: selectedTab)
