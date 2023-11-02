//
//  ChartsView.swift
//  DuoCase9
//
//  Created by Mario Almandoz Latierro on 2/11/23.
//

import Foundation
import SwiftUI
import Charts

struct DailyStepsView: Identifiable{
    let id = UUID()
    let date : Date
    let stepCount: Double
}

struct ChartsView: View {
    @EnvironmentObject var manager: HealthManager
    
    var body: some View {
        VStack{
            Chart{
                ForEach(manager.oneMonthChartData) {daily in
                    BarMark(x: .value(daily.date.formatted(), daily.date, unit: .day), y: .value("Steps", daily.stepCount))
                }
            }
        }
    }
}
struct ChartsView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(HealthManager())
    }
}


