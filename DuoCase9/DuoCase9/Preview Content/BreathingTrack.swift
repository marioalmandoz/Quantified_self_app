//
//  BreathingTrack.swift
//  DuoCase9
//
//  Created by Mario Almandoz Latierro on 7/11/23.
//

import SwiftUI

struct BreathingTrack: View {
    var body: some View {
        /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Hello, world!@*/Text("Hello, world!")/*@END_MENU_TOKEN@*/
    }
}


struct BreathingTrack_Provider: PreviewProvider {
    static var previews: some View{
        BreathingTrack()
            .environmentObject(HealthManager())
    }
}
