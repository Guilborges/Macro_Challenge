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
                .foregroundColor(Color("aquired"))
       
    }
}

struct ButtonCirclePurple: View {
    var body: some View{
        Circle()
                .frame(width: 20)
                .foregroundColor(Color("selling"))
       
    }
}

struct ButtonCircleBlue: View {
    var body: some View{
        Circle()
                .frame(width: 20)
                .foregroundColor(Color("washing"))
        
    }
}

struct ButtonCircleGreen: View {
    var body: some View{
        Circle()
                .frame(width: 20)
                .foregroundColor(Color("sold"))

    }
}
struct ButtonCircleOrange: View {
    var body: some View{
        Circle()
                .frame(width: 20)
                .foregroundColor(Color("maintenance"))
 
    }
}

struct ViewComponents_Preview: PreviewProvider {
    static var previews: some View {
        ButtonCircleOrange()
    }
}
