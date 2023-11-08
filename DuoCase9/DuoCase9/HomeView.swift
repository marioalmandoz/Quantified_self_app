import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                
                NavigationLink(destination: FirstButtonView()) {
                    Text("Button 1")
                        .font(.title)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(10)
                        .padding(.horizontal, 50)
                }
                .padding(.bottom, 20)
                
                NavigationLink(destination: SecondButtonView()) {
                    Text("Button 2")
                        .font(.title)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.green)
                        .cornerRadius(10)
                        .padding(.horizontal, 50)
                }
                
                Spacer()
            }
            .navigationBarTitle("Home")
        }
    }
}

struct FirstButtonView: View {
    var body: some View {
        Text("First Button View")
            .font(.largeTitle)
            .navigationBarTitle("Button 1")
    }
}

struct SecondButtonView: View {
    var body: some View {
        Text("Second Button View")
            .font(.largeTitle)
            .navigationBarTitle("Button 2")
    }
}

struct HomePageView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
