import SwiftUI

extension Color {
    init(hex: UInt) {
        let red = Double((hex & 0xFF0000) >> 16) / 255.0
        let green = Double((hex & 0x00FF00) >> 8) / 255.0
        let blue = Double((hex & 0x0000FF)) / 255.0
        self.init(red: red, green: green, blue: blue)
    }
}

struct BreathingApp: View {
    @State private var isBreathing = false
    @State private var countdown = 4
    @State private var phase = "Breathe In"
    @State private var circlePosition: CGSize = CGSize(width: -150, height: -150) // Initial position (top-left corner slightly above the border)

    var body: some View {
        ZStack {
            Color(hex: 0x132043) // Set the background color here

            VStack {

                Spacer().frame(height: 150)
                HStack {
                    Spacer()
                    Text("Breathing Time ")
                        .foregroundColor(.white) // Text color
                        .font(.title)
                        .bold()
                    Spacer()
                    
                }
                Spacer().frame(height: 100)
                ZStack {
                    Rectangle()
                        .frame(width: 300, height: 300) // Updated dimensions of the square
                        .foregroundColor(Color(hex: 0x435585))
                        .cornerRadius(20)
                        .overlay(
                            VStack {
                                Text(phase)
                                    .foregroundColor(.white)
                                    .font(.title)
                                    .bold()

                                Text("\(countdown)")
                                    .font(.title)
                                    .foregroundColor(.white)
                            }
                        )
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color(hex: 0xF6E1E1), lineWidth: 9) // Border color (hex: #ffffff)
                        )
                        .onTapGesture {
                            self.isBreathing.toggle()
                            self.countdown = 4
                            self.phase = "Breathe In"
                            self.circlePosition = CGSize(width: -140, height: -140) // Set initial position for the circle (slightly above the top-left corner above the border)
                            self.startCountdown()
                        }
                    
                    

                    Circle()
                        .frame(width: 40, height: 40) // Adjusted size of the circle
                        .foregroundColor(Color(hex: 0x00C2FF))
                        .offset(circlePosition)
                        .animation(.linear(duration: Double(countdown)))
                }

                Spacer()
            }
        }
        .edgesIgnoringSafeArea(.all)
    }

    func startCountdown() {
        if countdown > 0 {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                self.countdown -= 1
                
                // Calculate circle position based on the current phase
                withAnimation(.linear(duration: Double(self.countdown))) {
                    if self.phase == "Breathe In" {
                        self.circlePosition = CGSize(width: 150, height: -150) // Top-right corner above the border
                    } else if self.phase == "Hold" {
                        self.circlePosition = CGSize(width: 150, height: 150) // Bottom-right corner above the border
                    } else if self.phase == "Breathe Out" {
                        self.circlePosition = CGSize(width: -150, height: 150) // Bottom-left corner above the border
                    } else {
                        self.circlePosition = CGSize(width: -150, height: -150) // Top-left corner above the border
                    }
                }
                
                self.startCountdown()
            }
        } else {
            // Countdown finished, switch to the next phase
            if phase == "Breathe In" {
                phase = "Hold"
                countdown = 5
            } else if phase == "Hold" {
                phase = "Breathe Out"
                countdown = 5
            } else if phase == "Breathe Out" {
                phase = "Hold 2"
                countdown = 5
            } else if phase == "Hold 2" {
                phase = "Breathe In"
                countdown = 4
            }

            // Start countdown for the next phase
            startCountdown()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
    
