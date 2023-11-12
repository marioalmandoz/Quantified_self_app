import SwiftUI
 
struct HomeView: View {
    
    var percentage: Double = 0.9
    let data: [Double] = [0.2, 0.6, 0.8, 0.4, 0.7, 0.9, 0.5] // Valores de ejemplo
    let weekdays: [String] = ["S", "M", "T", "W", "T", "F", "S"]
    
    var body: some View {
        ZStack{
            Color(red: 0, green: 0, blue: 0.3, opacity: 1)
                .ignoresSafeArea()
            VStack {
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color.gray.opacity(0.2))
                    .overlay(
                        HStack{
                            //Cirlulo en la izquierda
                            Circle()
                                .stroke(lineWidth: 6)
                                .foregroundColor(Color.white)
                                .rotationEffect(.degrees(-90))
                                .frame(width: 35, height: 35) // Asegúrate de que el marco sea un cuadrado
                                .background(Circle().fill(Color.white.opacity(0.2)))
                                .offset(x: 23, y: -20)
                            Image(systemName: "zzz")
                                    .resizable()
                                    .frame(width: 10, height: 10) // Ajusta el tamaño del símbolo según tus preferencias
                                    .foregroundColor(.white)
                                    .offset(x: -7, y: -20)
                            VStack(alignment: .leading) {
                                Text("Respire")
                                    .foregroundColor(.white)
                                    .font(.system(size: 25))
                                    .padding(.bottom, 5)
                                    .offset(x: 13, y: 20)
                                Text("WELCOME")
                                    .foregroundColor(.white)
                                    .font(.system(size: 25))
                                    .padding()
                                    .offset(x: -30, y: 0)
                            }
                            
                        }
                        
                    ).frame(width: 300, height: 100)
                    .padding(.top, 90)
                Spacer()
                
                Text("Sleep Goal")
                    .foregroundColor(.white)
                    .font(.system(size: 25))
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .overlay(
                        Image(systemName: "zzz")
                                .resizable()
                                .frame(width: 30, height: 30) // Ajusta el tamaño del símbolo según tus preferencias
                                .foregroundColor(.white)
                    )
                
                
              
                HStack {
                    VStack(alignment: .leading) {
                        Text("Sleep Avg")
                            .fixedSize()
                            .foregroundColor(.white)
                            .font(.system(size: 20))
                        Text("6h 30min")
                            .fixedSize()
                            .foregroundColor(.white)
                            .font(.system(size: 20))
                        Text("")
                        
                        Text("Goal")
                            .fixedSize()
                            .foregroundColor(.white)
                            .font(.system(size: 20))
                        Text("8h 0min")
                            .fixedSize()
                            .foregroundColor(.white)
                            .font(.system(size: 20))
                    }
                    
                    ZStack{
                        
                        Circle()
                            .trim(from: 0, to: CGFloat(percentage))
                            .stroke(lineWidth: 15)
                            .foregroundColor(Color.white)
                            .rotationEffect(.degrees(-90))
                            .frame(width: 100, height: 100) // Asegúrate de que el marco sea un cuadrado
                            .background(Circle().fill(Color.white.opacity(0.2)))
                            .padding()
                            .frame(maxWidth: .infinity, alignment: .trailing)
                        
                        //Esto es el boton
                        Button(action: {
                            print("sleep time has started")
                        }) {
                            Text("80%")
                                .foregroundColor(.white)
                                .font(.system(size: 20))
                        }
                        .frame(width: 80, height: 80) // Ajusta el tamaño del botón
                        .background(Circle().fill(Color.gray.opacity(0.0))) // Hace que el botón sea un círculo
                        .offset(x: 40, y: 0) // Ajusta la posición del botón
                    }.padding()
                }.padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(20)
                
                Text("Sleep Quality")
                    .foregroundColor(.white)
                    .font(.system(size: 25))
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .overlay(
                            Image(systemName: "star.fill") // Agrega la estrella
                                .foregroundColor(.yellow) // Color de la estrella (puedes ajustarlo según tus preferencias)
                                .font(.system(size: 20)) // Tamaño de la estrella
                                .offset(x: -10, y: 0) // Ajusta la posición de la estrella
                        )
                
                
                VStack{
                    HStack {
                        VStack {
                            Spacer()
                            Text("100%")
                                .foregroundColor(.white)
 
                            Spacer().padding()
                            Text("50%")
                                .foregroundColor(.white)
 
                            Spacer().padding()
                            Text("0%")
                                .foregroundColor(.white)
 
                        }
 
                        
                        // Gráfico de barras
                        ForEach(data, id: \.self) { value in
                            Bar(value: CGFloat(value))
                        }
                    }.border(Color.white).padding()
                        
                    HStack {
                        ForEach(0..<7, id: \.self) { index in
                            Text(weekdays[index])
                                .foregroundColor(.white)
                                .font(.system(size: 14))
                                .padding(.horizontal, 10)
                        
                        }
                    }
    
                }.padding()
                    .offset(x: -10, y: -40)
                Spacer()
                Spacer()
            }
        }
        Spacer()
    }
    
}
    
struct Bar: View {
    var value: Double
    
    var body: some View {
        ZStack {
            VStack {
                Spacer()
                Rectangle()
                    .fill(Color.white.opacity(0.9))
                    .frame(width: 20, height: CGFloat(value) * 150) // Usamos el valor directamente
                Text(String(format: "%.0f%%", value * 100))
                    .font(.system(size: 12))
                    .foregroundColor(.white)
            }
        }
    }
}
 
    
struct HomeView_Provider: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
