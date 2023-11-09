import SwiftUI

struct BreatheCode: View {
    @State private var isInfoPopupVisible = false
    @State private var currentPage = 0
    
    var body: some View {
        ZStack {
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
                            .padding(16)
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
                
                NavigationLink(destination: ContentView()) {
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
            .blur(radius: isInfoPopupVisible ? 5 : 0) // Apply blur effect to the entire view
            
            if isInfoPopupVisible {
                InfoPopup(currentPage: $currentPage, isInfoPopupVisible: $isInfoPopupVisible)
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
                .foregroundColor(Color(hex: 0x2E4465))
                .frame(width: 250, height: 250)
                .overlay(
                    VStack {
                        if currentPage == 0 {
                            Text("Information Slide 1")
                                .font(.title)
                                .foregroundColor(.white)
                                .padding(.bottom, 20)
                        } else if currentPage == 1 {
                            Text("Information Slide 2")
                                .font(.title)
                                .foregroundColor(.white)
                                .padding(.bottom, 20)
                        } else {
                            Text("Information Slide 3")
                                .font(.title)
                                .foregroundColor(.white)
                                .padding(.bottom, 20)
                            
                            Button(action: {
                                // Handle exit button tap
                                self.isInfoPopupVisible = false
                                self.currentPage = 0
                            }) {
                                Text("Exit")
                                    .foregroundColor(.white)
                            }
                        }
                        
                        if currentPage < 2 {
                            Button(action: {
                                // Handle next button tap
                                currentPage += 1
                            }) {
                                Text("Next")
                                    .foregroundColor(.white)
                            }
                        }
                        
                        Spacer()
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

