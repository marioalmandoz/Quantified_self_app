//
//  ViewModule.swift
//  DuoCase9
//
//  Created by Mario Almandoz Latierro on 25/10/23.
//

import Foundation
import SwiftUI
import HealthKit

final class ViewModel: ObservableObject{
    private let healthStore = HKHealthStore()
    private var observerQuery: HKObserverQuery?
    @Published public var allMySteps: String = "0"
    private var query: HKStatisticsQuery!
    
    init() {
            // Inicializa la propiedad 'query' aquí
            self.query = nil
        }
    
    func requestAccessToHealthData() {
        let readableTypes: Set<HKSampleType> = [HKQuantityType.quantityType(forIdentifier: .stepCount)!]
        
        guard HKHealthStore.isHealthDataAvailable() else {
            return
        }
        healthStore.requestAuthorization(toShare: nil, read: readableTypes) { success, error in
            if success {
                print("Request Authorization \(success.description)")
            }
        }
    }

    
    func getTodaySteps() {
        guard let stepCountType = HKObjectType.quantityType(forIdentifier: .stepCount) else {
            print("Error: Identifier .stepCount")
            return
        }
        
        observerQuery = HKObserverQuery(sampleType: stepCountType, predicate: nil, updateHandler: {query, completionHandler, error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
                return
            }
            self.getMySteps()        })
        observerQuery.map(healthStore.execute)
    }
    
    private func getMySteps() {
        let stepsQuantityTyoe = HKQuantityType.quantityType(forIdentifier: .stepCount)!
        
        let now = Date()
        let startOfDay = Calendar.current.startOfDay(for: now)
        let predicate = HKQuery.predicateForSamples(withStart: startOfDay, end: now, options: .strictStartDate)
        
        self.query = HKStatisticsQuery(quantityType: stepsQuantityTyoe, 
                                       quantitySamplePredicate: predicate,
                                       options: .cumulativeSum,
                                       completionHandler: {_, result, _ in
            guard let result = result, let sum = result.sumQuantity() else {
                DispatchQueue.main.async {
                    self.allMySteps = String(Int(0))
                }
                return
            }
            DispatchQueue.main.sync {
                self.allMySteps = String(Int(sum.doubleValue(for: HKUnit.count())))
            }
        })
        healthStore.execute(query)
    }
}
