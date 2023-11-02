//
//  ActivityCard.swift
//  Peuebaas
//
//  Created by Mario Almandoz Latierro on 26/10/23.
//

import SwiftUI

struct Activity {
    let id: Int
    let tittle: String
    let subtittle: String
    let image: String
    let amount: String
    
}

struct ActivityCard : View {
    @State var activity: Activity
    var body: some View {
        ZStack {
            Color(uiColor: .systemGray6)
                .cornerRadius(15)
            
            VStack(spacing: 20){
                HStack(alignment: .top) {
                    VStack(alignment: .leading, spacing: 5) {
                        Text(activity.tittle)
                            .font(.system(size: 16))
                        
                        Text(activity.subtittle)
                            .font(.system(size: 12))
                    }
                   Spacer()
                    Image(systemName: activity.image)
                        .foregroundColor(.green)
                    
                }
                
                Text(activity.amount)
                    .font(.system(size: 24))
                    .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
            }
            .padding()
        }
        
    }
}

struct ActivityCard_Provider: PreviewProvider {
    static var previews: some View{
        ActivityCard(activity: Activity(id: 0, tittle: "Daily steps", subtittle: "Goal: 10,000", image: "figure.walk", amount: "6,545"))
    }
}
