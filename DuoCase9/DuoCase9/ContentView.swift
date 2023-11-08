
    //
    //  ContentView.swift
    //  DuoCase9
    //
    //  Created by Mario Almandoz Latierro on 25/10/23.
    //
    import SwiftUI
     
    struct ContentView: View {
        
        @State var selectedTab = "Home"
        
        var body: some View {
            ZStack{
                Color.gray.opacity(0.8).ignoresSafeArea()
                TabView(selection: $selectedTab) {
                    HomeView()
                        .tag("Home")
                        .tabItem {
                            Image(systemName: "chart.line.uptrend.xyaxis")
                        }
                    
                    SleepTrack()
                        .tag("Sleep")
                        .tabItem {
                            Image(systemName: "zzz")
                        }
                    
                    BreatheCode()
                        .tag("Breathing")
                        .tabItem { Image(systemName: "waveform.path.ecg")
                        }
                }.background(Color.gray)
            }
        }
    }
     
     
    struct ContentView_Preview: PreviewProvider {
        static var previews: some View{
            ContentView()
        }
    }
