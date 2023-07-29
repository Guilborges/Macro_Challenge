//
//  ViewComponents.swift
//  Macro_Challenge
//
//  Created by Victor Levenetz Mariano on 14/06/23.
//

import Foundation
import SwiftUI


struct ButtonCircleYellow: View {
    var body: some View{
        Circle()
                .frame(width: 20)
                .foregroundColor(.yellow)
       
    }
}

struct ButtonCirclePurple: View {
    var body: some View{
        Circle()
                .frame(width: 20)
                .foregroundColor(.purple)
       
    }
}

struct ButtonCircleBlue: View {
    var body: some View{
        Circle()
                .frame(width: 20)
                .foregroundColor(.blue)
        
    }
}

struct ButtonCircleGreen: View {
    var body: some View{
        Circle()
                .frame(width: 20)
                .foregroundColor(.green)

    }
}
struct ButtonCircleOrange: View {
    var body: some View{
        Circle()
                .frame(width: 20)
                .foregroundColor(.orange)
 
    }
}

struct ViewComponents_Preview: PreviewProvider {
    static var previews: some View {
        ButtonCircleOrange()
    }
}
