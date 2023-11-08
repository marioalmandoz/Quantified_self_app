//
//  SleepTrack.swift
//  DuoCase9
//
//  Created by Mario Almandoz Latierro on 7/11/23.
//

import SwiftUI
extension Color {
    init(hex: UInt, alpha: Double = 1.0) {
        self.init(
            .sRGB,
            red: Double((hex & 0xFF0000) >> 16) / 255.0,
            green: Double((hex & 0x00FF00) >> 8) / 255.0,
            blue: Double(hex & 0x0000FF) / 255.0,
            opacity: alpha
        )
    }
}

struct SleepTrack: View {
    var date: Date = Date()
    var percentage: Double = 0.6
    var min: Int = 0
    var h: Int = 6
    
    init(date: Date = Date(), percentage: Double = 0.9) {
            self.date = date
            self.percentage = percentage
        }
    var body: some View {
        ZStack{
            Color(red: 0, green: 0, blue: 0.2, opacity: 1)
                .ignoresSafeArea()
            
            VStack{
                Text(getFormattedDate())
                    .foregroundColor(.white)
                    .font(.system(size: 25))
                    .opacity(0.8)
                    .padding()
                
                
                ZStack{
                    
                    Circle()
                        .trim(from: 0, to: CGFloat(percentage))
                        .stroke(lineWidth: 15)
                        .foregroundColor(Color.white)
                        .rotationEffect(.degrees(-90))
                        .frame(width: 280, height: 280) // Asegúrate de que el marco sea un cuadrado
                        .background(Circle()
                            .fill(Color(hex: 0x435585).opacity(0.2))
                        )
                        .padding()
                        

                    
                        
                    //Esto es el boton
                    Button(action: {
                        print("sleep time has started")
                    }) {
                        Text("Start")
                            .foregroundColor(.white)
                            .font(.system(size: 40))
                    }
                }.padding()
                Spacer()
                
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color.gray.opacity(0.2))
                    .overlay(
                        VStack() {
                            
                            Text("Sleep Duration")
                                .foregroundColor(.white)
                                .font(.system(size: 25))
                                .frame(maxWidth: .infinity, alignment: .leading)
                            

                            
                            Text("\(h) h \(min) min")
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
                                .frame(maxWidth: .infinity, alignment: .leading) // Alinea el texto a la izquierda

                            
                            Text("\(h) h \(min) min")
                                .foregroundColor(.white)
                                .font(.system(size: 35))
                                
            
                        }
                    ).frame(width: 300, height: 90)
                    .padding()
        
                
                
                Spacer()
                               
            }
        }
    }
    func getFormattedDate() -> String {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "MMMM dd, yyyy" // Define el formato de fecha deseado
            return dateFormatter.string(from: date)
        }
}


struct SleepTrack_Provider: PreviewProvider {
    static var previews: some View{
        SleepTrack()
            .environmentObject(HealthManager())
    }
}
