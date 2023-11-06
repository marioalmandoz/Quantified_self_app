import SwiftUI

struct ContentView: View {
    @State private var isBreathing = false
    @State private var countdown = 4
    @State private var phase = "Breathe In"
    @State private var rotationCount = 0

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
            }

            Spacer()
        }
    }

    func startCountdown() {
        if countdown > 0 {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                self.countdown -= 1
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
                phase = "Hold"
                countdown = 5
            } else {
                // One rotation completed, increment the rotation count
                rotationCount += 1

                // Check if 2 rotations are completed, if so, stop the exercise
                if rotationCount >= 2 {
                    isBreathing = false
                    return
                }

                // Reset phase and countdown for the next rotation
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

