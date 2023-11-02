//
//  HealthManager.swift
//  Peuebaas
//
//  Created by Mario Almandoz Latierro on 26/10/23.
//

import Foundation
import HealthKit

extension Date{
    static var startOfDay: Date {
        Calendar.current.startOfDay(for: Date())
    }
}
extension Double {
    func formattedString() -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumFractionDigits = 0
        
        return numberFormatter.string(from: NSNumber(value: self))!
    }
}


class HealthManager: ObservableObject {
    let healthStore = HKHealthStore()
    
    @Published var activities: [String : Activity] = [:]
    
    @Published var oneMonthChartData = [DailyStepsView]()
    
    @Published var mockActivities: [String : Activity] = [
        "TodaySteps" : Activity(id: 0, tittle: "Today steps", subtittle: "Goal 10,000", image: "figure.walk", amount:"12.000"),
        "TodayCalories" : Activity(id: 1, tittle: "Today calories", subtittle: "Goal 900", image: "flame", amount:"300")
    
    ]
    
    init() {
        let steps = HKQuantityType(.stepCount)
        let calories = HKQuantityType(.activeEnergyBurned)
        let workout = HKObjectType.workoutType()
        
        let healthTypes: Set = [steps, calories, workout]
        //Aqui se cogen los pasos hechos
        Task {
            do{
                try await healthStore.requestAuthorization(toShare: [], read: healthTypes)
                fetchTodaySteps()
                fetchTodayCalories()
            }catch {
                print("error fetching health data")
            }
        }
    }
    
    func fetchDailySteps(startDate: Date, completion: @escaping ([DailyStepsView]) -> Void){
        let steps = HKQuantityType(.stepCount)
        let interval = DateComponents(day:1)
        let query = HKStatisticsCollectionQuery(quantityType: steps, quantitySamplePredicate: nil, anchorDate: startDate  , intervalComponents: interval)
        
        query.initialResultsHandler = { query, result, error in
            guard let result = result else {
                completion([])
                return
            }
            var dailySteps = [DailyStepsView]()
            
            result.enumerateStatistics(from: startDate, to: Date()) { statistics, stop in
                dailySteps.append(DailyStepsView(date: statistics.startDate, stepCount:
                 statistics.sumQuantity()?.doubleValue(for: .count()) ?? 0.00))
            }
            completion(dailySteps)
        }
        healthStore.execute(query)
    }
    
    func fetchTodaySteps() {// Este es el metodo que cuenta los pasos
        let steps = HKQuantityType(.stepCount)
        let predicate = HKQuery.predicateForSamples(withStart: .startOfDay, end: Date())
        let query = HKStatisticsQuery(quantityType: steps, quantitySamplePredicate: predicate) { _, result, error in
            guard let quantity = result?.sumQuantity(), error == nil else {
                print("error fetching todays step data")
                return
            }
            let stepCount = quantity.doubleValue(for: .count())
            let activity = Activity(id: 0, tittle: "Today steps", subtittle: "Goal 10,000", image: "figure.walk", amount: stepCount.formattedString())
            
            DispatchQueue.main.async {
                self.activities["todaySteps"] = activity
            }
            
            print(stepCount.formattedString())
        }
        healthStore.execute(query)
    }
    
    func fetchTodayCalories() {
        let calories = HKQuantityType(.activeEnergyBurned)
        let predicate = HKQuery.predicateForSamples(withStart: .startOfDay, end: Date())
        let query = HKStatisticsQuery(quantityType: calories, quantitySamplePredicate: predicate) { _, result, error in
            guard let quantity = result?.sumQuantity(), error == nil else {
                print("error fetching todays calories data")
                return
            }
            let caloriesBurned = quantity.doubleValue(for: .kilocalorie())
            let activity = Activity(id: 1, tittle: "Today calories", subtittle: "Goal 900", image: "flame", amount: caloriesBurned.formattedString())
            
            DispatchQueue.main.async {
                self.activities["todayCalories"] = activity
            }
            print(caloriesBurned.formattedString())
        }
        healthStore.execute(query)
    }
   
}

