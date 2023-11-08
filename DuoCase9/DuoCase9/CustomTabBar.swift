//
//  CustomTabBar.swift
//  DuoCase9
//
//  Created by Nigel Proveniers on 08/11/2023.
//

import SwiftUI

enum Tab: String, CaseIterable{
    case house
    case message
    case leaf
}

struct CustomTabBar: View {
    @Binding var selectedTab: Tab
    private var fillImage: String{
        selectedTab.rawValue + ".fill"
    }
    
    private var tabColor: Color {
        switch selectedTab {
        case .house:
            return .blue
        case .message:
            return .red
        case .leaf:
            return .green
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
            .frame(width: nil, height: 60)
            .background(Color.black)
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
