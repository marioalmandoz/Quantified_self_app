import SwiftUI

struct ContentView: View {
    @State private var isBreathing = false
    @State private var countdown = 4
    @State private var phase = "Breathe In"
    @State private var circlePosition: CGSize = CGSize(width: -140, height: -140) // Initial position (top-left corner slightly above the border)

    var body: some View {
        VStack {
            Spacer()

            ZStack {
                Rectangle()
                    .frame(width: 300, height: 300) // Updated dimensions of the square
                    .foregroundColor(.green)
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
                    .onTapGesture {
                        self.isBreathing.toggle()
                        self.countdown = 4
                        self.phase = "Breathe In"
                        self.circlePosition = CGSize(width: -140, height: -140) // Set initial position for the circle (slightly above the top-left corner above the border)
                        self.startCountdown()
                    }

                Circle()
                    .frame(width: 40, height: 40) // Adjusted size of the circle
                    .foregroundColor(.red)
                    .offset(circlePosition)
                    .animation(.linear(duration: 1))
            }

            Spacer()
        }
    }

    func startCountdown() {
        if countdown > 0 {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                self.countdown -= 1
                
                // Calculate circle position based on the current phase
                withAnimation {
                    if self.phase == "Breathe In" {
                        self.circlePosition = CGSize(width: 140, height: -140) // Top-right corner above the border
                    } else if self.phase == "Hold" {
                        self.circlePosition = CGSize(width: 140, height: 140) // Bottom-right corner above the border
                    } else if self.phase == "Breathe Out" {
                        self.circlePosition = CGSize(width: -140, height: 140) // Bottom-left corner above the border
                    } else {
                        self.circlePosition = CGSize(width: -140, height: -140) // Top-left corner above the border
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
