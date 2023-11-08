import SwiftUI

struct MainPageView: View {
    var body: some View {
        NavigationView {
            
            VStack {
                
                Text("Breathing Exercises")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                
                Text("It’s time to relax.                Here are some different ways to breathe: ")
                    .padding(.top, 2)
                    .font(.system(size: 20))
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .frame(minWidth: 0, maxWidth: 230, alignment: .center)
                
                Spacer().frame(height: 40)
                
                NavigationLink(destination: ContentView()) {
                    Text("To sleep:  4-7-8 (military)")
                        .font(.title)
                        .foregroundColor(.white)
                        .padding(30)
                        .background(Color(hex: 0x435585))
                        .cornerRadius(10)
                        .frame(maxWidth: 260)
                }
                
                Spacer().frame(height: 20)
                
                NavigationLink(destination: ContentView()) {
                    Text("Reduce stress:   3-5-6")
                        .font(.title)
                        .foregroundColor(.white)
                        .padding(30)
                        .background(Color(hex: 0x435585))
                        .cornerRadius(10)
                        .frame(minWidth: 250,maxWidth: 260)
                }
                
                Spacer().frame(height: 20)
                
                NavigationLink(destination: ContentView()) {
                    Text("Reduce anxiety: 4-4-4-4")
                        .font(.title)
                        .foregroundColor(.white)
                        .padding(30)
                        .background(Color(hex: 0x435585))
                        .cornerRadius(10)
                        .frame(minWidth: 250,maxWidth: 260)
                }
                
                Spacer()
            }
            .padding()
            .background(Color(hex: 0x132043))
        }

    }
}
struct MainPageView_Previews: PreviewProvider {
    static var previews: some View {
        MainPageView()
    }
}
