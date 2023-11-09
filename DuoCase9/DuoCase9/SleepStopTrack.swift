//
//  SleepStopTrack.swift
//  DuoCase9
//
//  Created by Mario Almandoz Latierro on 9/11/23.
//
 
import Foundation
import SwiftUI
 
// Vista de parada del seguimiento
struct SleepStopView: View {
 
var date: Date = Date()
var percentage: Double = 0.6
 
init(date: Date = Date(), percentage: Double = 0.9) {
        self.date = date
        self.percentage = percentage
    }
 
var body: some View {
    NavigationView {
        ZStack{
            Color(red: 0, green: 0, blue: 0.3, opacity: 1)
                .ignoresSafeArea()
            
            VStack{
                Text(getFormattedDate())
                    .foregroundColor(.white)
                    .font(.system(size: 25))
                    .opacity(0.8)
                    .padding()
                
                NavigationLink(destination: SleepTrack()){
                    ZStack{
                        
                        Circle()
                            .trim(from: 0, to: CGFloat(percentage))
                            .stroke(lineWidth: 15)
                            .foregroundColor(Color.white)
                            .rotationEffect(.degrees(-90))
                            .frame(width: 280, height: 280) // Asegúrate de que el marco sea un cuadrado
                            .background(Circle().fill(Color.white.opacity(0.2)))
                            .padding()
                        
                        
                        
                        
                        //Esto es el boton
                        Button(action: {
                            print("sleep time has Finished")
                        }) {
                            Text("Stop")
                                .foregroundColor(.white)
                                .font(.system(size: 40))
                        }
                    }.padding()
                }
                Spacer()
                
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color.gray.opacity(0.2))
                    .overlay(
                        VStack() {
                            
                            Text("Sleep Duration")
                                .foregroundColor(.white)
                                .font(.system(size: 25))
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.leading,10)
                            
                            
                            
                            Text("6h 00min")
                                .foregroundColor(.white)
                                .font(.system(size: 35))
                        }
                    ).frame(width: 300, height: 90)// Para ajustar el tamano
                    .padding()
                
                RoundedRectangle(cornerRadius: 25)
                    .fill(Color.gray.opacity(0.2))
                    .overlay(
                        VStack {
                            Text("Sleep Goal")
                                .foregroundColor(.white)
                                .font(.system(size: 25))
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.leading,10)// Alinea el texto a la izquierda
                            
                            
                            Text("6h 00min")
                                .foregroundColor(.white)
                                .font(.system(size: 35))
                            
                            
                        }
                    ).frame(width: 300, height: 90)
                    .padding()
                
                
                
                Spacer()
                
            }
        }
    }
}
func getFormattedDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM dd, yyyy" // Define el formato de fecha deseado
        return dateFormatter.string(from: date)
    }
}
 
struct SleepStopTrack_Provider: PreviewProvider {
 
        static var previews: some View {
            SleepStopView()
        }
}
