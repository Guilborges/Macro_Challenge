//
//  SplashScreenAppView.swift
//  Macro_Challenge
//
//  Created by Guilherme Borges on 21/08/23.
//

import SwiftUI

struct SplashScreenAppView: View {
    @State private var isLoading = true

    var body: some View {
        Group {
            if isLoading {
                SplashScreenView()
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                            withAnimation {
                                isLoading = false
                            }
                        }
                    }
            } else {
                TabBarView(prodVm: ProductViewModel(), setIndexProduct: 0)
                                        
            }
        }
    }
}
