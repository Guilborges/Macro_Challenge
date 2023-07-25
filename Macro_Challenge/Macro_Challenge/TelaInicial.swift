//
//  TelaInicial.swift
//  Macro_Challenge
//
//  Created by Guilherme Borges on 06/06/23.
//

import SwiftUI

struct TelaInicial: View {
    @StateObject var prodVm: ProductViewModel
    @State private var tags: [Tag] = []
    public var setIndexProduct: Int

    
    var body: some View {
        TabView {
            TabScreen1(prodVm: ProductViewModel(), setIndexProduct: setIndexProduct)
                .tabItem {
                    Image(systemName: "globe")
                }
            
            TabScreen2(prodVm: ProductViewModel())
                .tabItem {
                    Image(systemName: "globe")
                }
            
            ContentView(prod: prodVm, tags: $tags)
                .tabItem {
                    Image(systemName: "globe")
                }

        }
        
        
        
        
    }
}


//



