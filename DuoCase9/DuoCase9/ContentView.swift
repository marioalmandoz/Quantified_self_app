//
//  ContentView.swift
//  DuoCase9
//
//  Created by Mario Almandoz Latierro on 25/10/23.
//
import SwiftUI
import HealthKit



struct ContentView: View {
    

    @EnvironmentObject var manager: HealthManager
    @State var selectedTab = "Home"
    
    var body: some View {
        ZStack{
            Color.gray.opacity(0.8).ignoresSafeArea()
            TabView(selection: $selectedTab) {
                HomeView()
                    .environmentObject(manager)
                    .tag("Home")
                    .tabItem {
                        Image(systemName: "chart.line.uptrend.xyaxis")
                    }
                
                SleepTrack()
                    .environmentObject(manager)
                    .tag("Sleep")
                    .tabItem {
                        Image(systemName: "zzz")
                    }
                
                BreathingTrack()
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
            .environmentObject(HealthManager())
    }
}
