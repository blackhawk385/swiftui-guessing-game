//
//  AboutView.swift
//  BullsEyeRevamp
//
//  Created by VenD on 12/26/22.
//

import SwiftUI

struct AboutView: View {
    var body: some View {
        VStack {
            Text("Bullseye").modifier(AboutHeadingStyle()).navigationBarTitle("About Bullseye")
            Text("This is Bullseye, the game where you can win points and earn fame by dragging a slider.").modifier(AboutBodyStyle())
            Text("Your goal is to place the slider as close as possible to the target value. The closer you are, the more points you score.").modifier(AboutBodyStyle()).lineLimit(nil)
            Text("Enjoy!").modifier(AboutBodyStyle())
         }
    }
}

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView()
    }
}
