//
//  ContentView.swift
//  DuoCase9
//
//  Created by Mario Almandoz Latierro on 25/10/23.
//
import SwiftUI

struct ContentView: View {
    @StateObject var viewModel: ViewModel


    var body: some View {
        VStack {
            Image(systemName: "figure.walk")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .foregroundColor(.red)
                .frame(width: 60, height: 60)
            Text("Todays steps!")
                .font(.system(size: 20, weight: .bold, design: .rounded))
            Text(viewModel.allMySteps)
                .font(.system(size: 40, weight: .bold, design: .rounded))
        }
        .padding(12)
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .stroke(style: StrokeStyle(lineWidth: 3, dash: [5]))
        )
        .task {
            viewModel.requestAccessToHealthData() // Corregido el nombre del método
        }
    }
}

struct ContentView_Preview: PreviewProvider {
    static var previews: some View{
        ContentView(viewModel: ViewModel())
    }
}
