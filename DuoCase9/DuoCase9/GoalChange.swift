//
//  GoalChange.swift
//  DuoCase9
//
//  Created by Mario Almandoz Latierro on 9/11/23.
//
 
import SwiftUI
 
struct GoalChange: View {
    @State private var selectedHours = 6
    @State private var selectedMinutes = 0
    var date: Date = Date()
    var percentage: Double = 0.9
    @Binding var sleepData: SleepData // Variable de enlace para pasar los valores
 
    init(date: Date = Date(), percentage: Double = 0.9, sleepData: Binding<SleepData>) {
        self.date = date
        self.percentage = percentage
        _sleepData = sleepData
    }
    var body: some View {
        NavigationView {
            ZStack {
                Color(red: 0, green: 0, blue: 0.3, opacity: 1)
                    .ignoresSafeArea()
 
                VStack {
                    Text(getFormattedDate())
                        .foregroundColor(.white)
                        .font(.system(size: 25))
                        .opacity(0.8)
                        .padding()
 
                    ZStack {
                            Circle()
                                .trim(from: 0, to: CGFloat(percentage))
                                .stroke(lineWidth: 15)
                                .foregroundColor(Color.white)
                                .rotationEffect(.degrees(-90))
                                .frame(width: 280, height: 280)
                                .background(Circle().fill(Color.white.opacity(0.2)))
                                .padding()
 
                            Button(action: {
                                print("sleep time has Finished")
                            }) {
                                Text("Start")
                                    .foregroundColor(.white)
                                    .font(.system(size: 40))
                            }
                        }.padding()
 
                    Spacer()
 
                    RoundedRectangle(cornerRadius: 25)
                        .fill(Color.gray.opacity(0.2))
                        .overlay(
                            VStack {
                                Text("Sleep Goal")
                                    .foregroundColor(.white)
                                    .font(.system(size: 25))
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .padding(.leading, 10)
 
                                // Números de horas seleccionados y valores anteriores y siguientes
                                HStack {
                                    Picker("", selection: $selectedHours) {
                                        ForEach(0..<24, id: \.self) { hour in
                                            Text("\(hour)h")
                                                .foregroundColor(.white)
                                        }
                                    }
                                    .pickerStyle(WheelPickerStyle())
                                    .frame(width: 100, height: 100)
                                    .clipped()
 
                                    // Números de minutos seleccionados y valores anteriores y siguientes
                                    Picker("", selection: $selectedMinutes) {
                                        ForEach(0..<60, id: \.self) { minute in
                                            Text("\(minute)min")
                                                .foregroundColor(.white)
                                        }
                                    }
                                    .pickerStyle(WheelPickerStyle())
                                    .frame(width: 100, height: 100)
                                    .clipped()
                                }
                            }
                        )
                        .frame(width: 300, height: 190)
                        .padding()
                    
                    Button(action: {
                        // Modificar sleepData.hours y sleepData.minutes con los valores seleccionados
                        sleepData.hours = selectedHours
                        sleepData.minutes = selectedMinutes
                        // Aquí puedes agregar código adicional si es necesario
                    }) {
                        Text("Save Changes")
                            .foregroundColor(.white)
                            .font(.system(size: 20))
                            .cornerRadius(20)
                    }.buttonStyle(.borderedProminent)
 
                    Spacer()
                }
            }
        }
    }
 
    func getFormattedDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM dd, yyyy"
        return dateFormatter.string(from: date)
    }
}
 
struct GoalChange_Provider: PreviewProvider {
    static var previews: some View {
        let sleepData = Binding.constant(SleepData(hours: 6, minutes: 0))
        return GoalChange(sleepData: sleepData)
    }
}
