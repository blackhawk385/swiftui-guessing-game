//
//  ViewModifiers.swift
//  BullsEyeRevamp
//
//  Created by VenD on 12/26/22.
//

import Foundation
import SwiftUI

struct ValueStyle : ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(Font.custom("Arial Rounded MT Bold", size: 24))
            .foregroundColor(Color.yellow)
            .shadow(color: Color.black, radius: 5, x: 2, y: 2)
        
    }
}

struct TextSizeModifier : ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(Font.custom("Arial Rounded MT Bold", size: 18))
            .foregroundColor(Color.white)
            .shadow(color: Color.black, radius: 5, x: 2, y: 2)
    }
}

struct AboutHeadingStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(Font.custom("Arial Rounded MT Bold", size: 30))
            .foregroundColor(Color.black)
            .padding(.top, 20)
            .padding(.bottom, 20)
    }
}
struct AboutBodyStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(Font.custom("Arial Rounded MT Bold", size: 16))
            .foregroundColor(Color.black)
            .padding(.leading, 60)
            .padding(.trailing, 60)
            .padding(.bottom, 20)
    }
}
