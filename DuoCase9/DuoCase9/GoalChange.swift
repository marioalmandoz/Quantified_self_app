//
//  GoalChange.swift
//  DuoCase9
//
//  Created by Mario Almandoz Latierro on 9/11/23.
//
import SwiftUI

struct GoalChange: View {
    @Binding var sleepData: SleepData
    @State private var selectedHours: Double
    @State private var selectedMinutes: Double

    init(sleepData: Binding<SleepData>) {
        _sleepData = sleepData
        _selectedHours = State(initialValue: Double(sleepData.wrappedValue.hours))
        _selectedMinutes = State(initialValue: Double(sleepData.wrappedValue.minutes))
    }

    var body: some View {
        NavigationView {
            ZStack {
                Color(red: 0, green: 0, blue: 0.3, opacity: 1)
                    .ignoresSafeArea()

                VStack {
                    Spacer()

                    Text("Sleep Goal")
                        .foregroundColor(.white)
                        .font(.system(size: 25))
                        .padding()

                    HStack {
                        Text("Hours: \(Int(selectedHours))")
                            .foregroundColor(.white)
                        Slider(value: $selectedHours, in: 0...23, step: 1)
                            .accentColor(.white)
                    }
                    .padding()

                    HStack {
                        Text("Minutes: \(Int(selectedMinutes))")
                            .foregroundColor(.white)
                        Slider(value: $selectedMinutes, in: 0...59, step: 1)
                            .accentColor(.white)
                    }
                    .padding()

                    Button(action: {
                        sleepData.hours = Int(selectedHours)
                        sleepData.minutes = Int(selectedMinutes)
                    }) {
                        Text("Guardar cambios")
                            .foregroundColor(.white)
                            .font(.system(size: 20))
                    }
                    .buttonStyle(.borderedProminent)

                    Spacer()
                }
            }
        }
    }
}

struct GoalChange_Preview: PreviewProvider {
    static var previews: some View {
        let sleepData = Binding.constant(SleepData(hours: 6, minutes: 0))
        return GoalChange(sleepData: sleepData)
    }
}
