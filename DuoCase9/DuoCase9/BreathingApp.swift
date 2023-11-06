import SwiftUI

struct ContentView: View {
    @State private var isBreathing = false
    @State private var countdown = 4
    @State private var phase = "Breathe In"
    @State private var circlePosition: CGSize = CGSize(width: -90, height: -90) // Initial position (top-left corner)

    var body: some View {
        VStack {
            Text(isBreathing ? phase : "Press to start")
                .font(.largeTitle)
                .foregroundColor(.blue)
                .onTapGesture {
                    self.isBreathing.toggle()
                    self.countdown = 4
                    self.phase = "Breathe In"
                    self.startCountdown()
                }
                .padding()

            ZStack {
                Rectangle()
                    .frame(width: 200, height: 200)
                    .foregroundColor(.green)
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

                Circle()
                    .frame(width: 20, height: 20)
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
                        self.circlePosition = CGSize(width: 90, height: -90) // Top-right corner (Hold)
                    } else if self.phase == "Hold" {
                        self.circlePosition = CGSize(width: 90, height: 90) // Bottom-right corner (Breathe Out)
                    } else if self.phase == "Breathe Out" {
                        self.circlePosition = CGSize(width: -90, height: 90) // Bottom-left corner (Hold 2)
                    } else {
                        self.circlePosition = CGSize(width: -90, height: -90) // Top-left corner (Breathe In)
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
