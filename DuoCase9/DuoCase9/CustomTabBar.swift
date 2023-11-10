//
//  CustomTabBar.swift
//  DuoCase9
//
//  Created by Nigel Proveniers on 08/11/2023.
//

import SwiftUI

enum Tab: String, CaseIterable{
    case house
    case moon
    case person
}


extension Color {
    init(hex: Int, alpha: Double = 1) {
        self.init(
            .sRGB,
            red: Double((hex >> 16) & 0xFF) / 255.0,
            green: Double((hex >> 8) & 0xFF) / 255.0,
            blue: Double(hex & 0xFF) / 255.0,
            opacity: alpha
        )
    }
}

struct CustomTabBar: View {
    @Binding var selectedTab: Tab
    private var fillImage: String{
        selectedTab.rawValue + ".fill"
    }
    
    private var tabColor: Color {
        switch selectedTab {
        case .house:
            return .white
        case .moon:
            return .white
        case .person:
            return .white
        }
    }
    
    var body: some View {
        VStack{
            HStack{
                ForEach(Tab.allCases, id: \.rawValue) { tab in
                    Spacer()
                    Image(systemName: selectedTab == tab ? fillImage :
                            tab.rawValue)
                    .scaleEffect(selectedTab==tab ? 1.25 : 1.0)
                    .foregroundColor(selectedTab==tab ? tabColor : .gray)
                    .font(.system(size: 22))
                    .onTapGesture{
                        withAnimation(.easeIn(duration: 0.1)){
                            selectedTab = tab
                        }
                    }
                    Spacer()
                }
            }
            .frame(width: .infinity, height: 50)
            .background(Color(hex: 0x435585))
            .cornerRadius(10)
            .padding()
        }
    }
}

struct CustomTabBar_Preview: PreviewProvider {
    static var previews: some View {
        CustomTabBar(selectedTab: .constant(.house))
    }
}
