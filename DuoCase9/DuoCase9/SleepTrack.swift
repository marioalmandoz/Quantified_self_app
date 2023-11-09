//  SleepTrack.swift
//  DuoCase9
//
//  Created by Mario Almandoz Latierro on 7/11/23.
//
import SwiftUI
 
struct SleepData {
    var hours: Int
    var minutes: Int
}
 
struct SleepTrack: View {
    var date: Date = Date()
    @State private var buttonText = "Start"
    @State private var sleepData = SleepData(hours: 8, minutes: 0)
    @State private var sleepDuration = SleepData(hours: 8, minutes: 0)
    @State private var isAnimating = false
    @State private var timer: Timer? = nil
    @State private var elapsedTime: TimeInterval = 0
    @State private var startSleepTime: Date? = nil
 
    init(date: Date = Date()) {
        self.date = date
    }
 
    var body: some View {
        let percentage = calculatePercentage()
        
        return NavigationView {
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
                            .trim(from: 0, to: isAnimating ? CGFloat(percentage / 100) : 0.0)
                            .stroke(lineWidth: 15)
                            .foregroundColor(Color.white)
                            .rotationEffect(.degrees(-90))
                            .frame(width: 280, height: 280)
                            .background(Circle().fill(Color.white.opacity(0.2)))
                            .padding()
                            .onTapGesture {
                                if buttonText == "Start" {
                                    startSleepTime = Date()
                                    startTimer()
                                    buttonText = "Stop"
                                    print("Sleep time has started")
                                } else {
                                    stopTimer()
                                    buttonText = "Start"
                                    print("Sleep time has stopped")
                                }
                            }
                            .onAppear {
                                withAnimation(.linear(duration: 1.5)) {
                                    isAnimating = true
                                }
                            }
 
                        Button(action: {
                            if buttonText == "Start" {
                                startSleepTime = Date()
                                startTimer()
                                buttonText = "Stop"
                                print("Sleep time has started")
                            } else {
                                stopTimer()
                                buttonText = "Start"
                                print("Sleep time has stopped")
                            }
                        }) {
                            Text(buttonText)
                                .foregroundColor(.white)
                                .font(.system(size: 40))
                        }
                    }
 
                    Spacer()
 
                    RoundedRectangle(cornerRadius: 25)
                        .fill(Color.gray.opacity(0.2))
                        .overlay(
                            VStack {
                                Text("Sleep Duration")
                                    .foregroundColor(.white)
                                    .font(.system(size: 25))
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .padding(.leading, 10)
                                Text("\(formattedSleepDuration())")
                                    .foregroundColor(.white)
                                    .font(.system(size: 35))
                            }
                        )
                        .frame(width: 300, height: 90)
                        .padding()
 
                    NavigationLink(destination: GoalChange(sleepData: $sleepData)) {
                        RoundedRectangle(cornerRadius: 25)
                            .fill(Color.gray.opacity(0.2))
                            .overlay(
                                VStack {
                                    Text("Sleep Goal")
                                        .foregroundColor(.white)
                                        .font(.system(size: 25))
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .padding(.leading, 10)
                                    Text("\(sleepData.hours)h \(sleepData.minutes)min")
                                        .foregroundColor(.white)
                                        .font(.system(size: 35))
                                }
                            )
                            .frame(width: 300, height: 90)
                            .padding()
                    }
 
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
 
    func calculatePercentage() -> Double {
        let totalMinutesData = sleepData.hours * 60 + sleepData.minutes
        let totalMinutesDuration = sleepDuration.hours * 60 + sleepDuration.minutes
        return totalMinutesData > 0 ? Double(totalMinutesDuration) / Double(totalMinutesData) * 100 : 0.0
    }
 
    func formattedSleepDuration() -> String {
        let totalMinutes = Int(elapsedTime / 60)
        let hours = totalMinutes / 60
        let minutes = totalMinutes % 60
        return String(format: "%02dh %02dmin", hours, minutes)
    }
 
    func startTimer() {
        if timer == nil {
            timer = Timer.scheduledTimer(withTimeInterval: 1.0 / 60, repeats: true) { _ in
                if let startTime = self.startSleepTime {
                    self.elapsedTime = Date().timeIntervalSince(startTime) * 60
                    self.updateSleepDuration()
                }
            }
        }
    }
 
    func stopTimer() {
        timer?.invalidate()
        timer = nil
        updateSleepDuration()
    }
 
    func updateSleepDuration() {
        let totalMinutesData = sleepData.hours * 60 + sleepData.minutes
        let elapsedMinutes = Int(elapsedTime / 60)
        if elapsedMinutes <= totalMinutesData {
            sleepDuration.hours = elapsedMinutes / 60
            sleepDuration.minutes = elapsedMinutes % 60
        }
    }
}
 
struct SleepTrack_Provider: PreviewProvider {
    static var previews: some View {
        SleepTrack()
    }
}
