import SwiftUI

struct BreatheCode: View {
    @State private var isInfoPopupVisible = false
    @State private var currentPage = 0
    
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
                    
                    Text("It’s time to relax. Here are some different ways to breathe:")
                        .padding(.top, 10)
                        .font(.system(size: 20))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .frame(minWidth: 0, maxWidth: 230, alignment: .center)
                    
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
                    
                    Spacer()
                }
                .padding()
                .background(Color(hex: 0x132043))
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

