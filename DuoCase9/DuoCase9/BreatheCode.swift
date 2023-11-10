import SwiftUI

struct BreatheCode: View {
    @State private var isInfoPopupVisible = false
    @State private var currentPage = 0
    @State private var stressLevel: Double = 5
    @State private var anxietyLevel: Double = 5
    @State private var tirednessLevel: Double = 5
    
    var body: some View {
        ZStack {
            NavigationView {
                VStack {
                    HStack {

                        Spacer()
                        
                        Button(action: {
                            self.isInfoPopupVisible.toggle()
                            self.currentPage = 0
                        }) {
                            Image(systemName: "info.circle")
                                .foregroundColor(.white)
                                .font(.title)
                                
                        }
                       
                    }
                    
                    Text("Breathing Exercises")
                        .font(.system(size: 30))
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity)
                        .padding(.top, 10)

                    Spacer().frame(height: 40)
                    
                    NavigationLink(destination: BreathingApp()) {
                        Text("Sleep Helper")
                            .font(.title)
                            .foregroundColor(.white)
                            .padding(30)
                            .background(Color(hex: 0x435585))
                            .cornerRadius(10)
                            .frame(width: 250)
                    }
                    
                    Spacer().frame(height: 40)
                    
                    NavigationLink(destination: BreathingApp()) {
                        Text("Reduce Stress")
                            .font(.title)
                            .foregroundColor(.white)
                            .padding(30)
                            .background(Color(hex: 0x435585))
                            .cornerRadius(10)
                            .frame(width: 250)
                    }
                    
                    Spacer().frame(height: 40)
                    
                    NavigationLink(destination: BreathingApp()) {
                        Text("Reduce Anxiety")
                            .font(.title)
                            .foregroundColor(.white)
                            .padding(30)
                            .background(Color(hex: 0x435585))
                            .cornerRadius(10)
                            .frame(minWidth: 250, maxWidth: 260)
                    }
                    
                    Spacer().frame(height: 80)
                    NavigationLink(destination: MoodInputView(isInfoPopupVisible: $isInfoPopupVisible, stressLevel: $stressLevel, anxietyLevel: $anxietyLevel, tirednessLevel: $tirednessLevel)) {
                        Text("Need help? ")
                            .font(.title)
                            .foregroundColor(.white)
                            .padding(15)
                            .background(Color(hex: 0x494214))
                            .cornerRadius(10)
                            .frame(minWidth: 250, maxWidth: 260)
                    }
                    Spacer()
                    
                }
                .padding()
                .background(Color(red: 0, green: 0, blue: 0.3, opacity: 1))
                .blur(radius: isInfoPopupVisible ? 5 : 0) // Apply blur effect when the popup is visible
            }
            
            if isInfoPopupVisible {
                InfoPopup(currentPage: $currentPage, isInfoPopupVisible: $isInfoPopupVisible)
                    .edgesIgnoringSafeArea(.all)
            }
        }
    }
}





struct InfoPopup: View {
    @Binding var currentPage: Int
    @Binding var isInfoPopupVisible: Bool
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(Color(hex: 0x435585))
                .frame(width: 300, height: 300)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.white, lineWidth: 4) // Border color and line width
                )
                .overlay(
                    VStack {
                        if currentPage == 0 {
                            Text("General Info")
                                .font(.title)
                                .foregroundColor(.white)
                                .padding(.bottom, 20)
                            Text("You can find various breathing exercises to help with different problems")
                                .foregroundColor(.white)
                        } else if currentPage == 1 {
                            Text("Sleep Helper")
                                .font(.title)
                                .foregroundColor(.white)
                                .padding(.bottom, 20)
                            Text("This is the military breathing style, with a 3 step breathing technique")
                                .foregroundColor(.white)
                        } else if currentPage == 2 {
                            Text("Reduce stress")
                                .font(.title)
                                .foregroundColor(.white)
                                .padding(.bottom, 20)
                            Text("This 3-5-6 technique helps reduce stress, by breathing 3s hold 5s and breathout 6s")
                                .foregroundColor(.white)
                        } else {
                            Text("Reduce anxiety")
                                .font(.title)
                                .foregroundColor(.white)
                                .padding(.bottom, 20)
                            Text("This basic breathing is called the quad 4, where there are 4 steps")
                                .foregroundColor(.white)
                            
                            Button(action: {
                                // Handle exit button tap
                                self.isInfoPopupVisible = false
                                self.currentPage = 0
                            }) {
                                Text("Exit")
                                    .foregroundColor(.white)
                                    .padding()
                                    .background(Color(hex: 0x132043))
                                    .cornerRadius(20)
                            }
                        }
                        
                        Spacer()
                        
                        if currentPage < 3 {
                            HStack {
                                Spacer()
                                Button(action: {
                                    // Handle next button tap
                                    currentPage += 1
                                }) {
                                    Text("Next")
                                        .foregroundColor(.white)
                                        .padding()
                                        .background(Color(hex: 0x132043))
                                        .cornerRadius(20)
                                }
                                Spacer()
                            }
                        }
                    }
                        .padding()
                        
                )
                
        }
    }
}

struct BreatheCode_Provider: PreviewProvider {
    static var previews: some View {
        BreatheCode()
    }
}

struct MoodInputView: View {
    @Binding var isInfoPopupVisible: Bool
    @Binding var stressLevel: Double
    @Binding var anxietyLevel: Double
    @Binding var tirednessLevel: Double

    // Additional state variable to control the visibility of the suggestion message
    @State private var showSuggestionMessage = false

    // Mockup suggestion message
    var suggestionMessage: String {
        let totalScore = stressLevel + anxietyLevel + tirednessLevel
        if totalScore > 15 {
            return "We suggest you trying the Anxiety Breathing technique in order to help with your current anxiety problem"
        } else {
            return "Your mood seems to be in a good range. Keep it up!"
        }
    }

    var body: some View {
        ZStack {
            Color(red: 0, green: 0, blue: 0.3, opacity: 1)
                .ignoresSafeArea()

            VStack {
                Text("Rate your mood for sleeping problems:")
                    .foregroundColor(.white)
                    .padding(.bottom, 20)

                // Stress Level
                VStack {
                    Text("Stress Level: \(Int(stressLevel))")
                        .foregroundColor(.white)
                    Slider(value: $stressLevel, in: 1...10, step: 1)
                }
                .padding()

                // Anxiety Level
                VStack {
                    Text("Anxiety Level: \(Int(anxietyLevel))")
                        .foregroundColor(.white)
                    Slider(value: $anxietyLevel, in: 1...10, step: 1)
                }
                .padding()

                // Tiredness Level
                VStack {
                    Text("Tiredness Level: \(Int(tirednessLevel))")
                        .foregroundColor(.white)
                    Slider(value: $tirednessLevel, in: 1...10, step: 1)
                }
                .padding()

                Button(action: {
                    // Close the mood input view
                    isInfoPopupVisible = false

                    // Show the suggestion message
                    showSuggestionMessage = true
                }) {
                    Text("Done")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color(hex: 0x435585)) // Set the background color to red
                        .cornerRadius(20)
                }
                .padding(.top, 20)

                // Display the suggestion message only when showSuggestionMessage is true
                if showSuggestionMessage {
                    Text(suggestionMessage)
                        .foregroundColor(.white)
                        .padding(.top, 20)
                        .multilineTextAlignment(.center)
                }
            }
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
}
