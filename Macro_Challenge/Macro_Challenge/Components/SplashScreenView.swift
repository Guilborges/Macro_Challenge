//
//  SplashScreenView.swift
//  Macro_Challenge
//
//  Created by Guilherme Borges on 21/08/23.
//

import SwiftUI

struct SplashScreenView: View {
    var body: some View {
        Image("fundo")
        .resizable()
        .aspectRatio(contentMode: .fill)
        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        .edgesIgnoringSafeArea(.all)
                   
    }
}

struct SplashScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreenView()
    }
}
