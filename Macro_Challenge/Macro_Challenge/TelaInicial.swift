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
            TabScreen1(prod: prodVm)
                .tabItem {
                    Image(systemName: "globe")
                }
            
            TabScreen2(prod: prodVm)
                .tabItem {
                    Image(systemName: "globe")
                }
            
            ContentView(prod: prodVm, tags: $tags)
                .tabItem {
                    Image(systemName: "globe")
                }
            
            PrincipalListView(prod: prodVm)
                .tabItem {
                    Image(systemName: "globe")
                }

        }
        
        
        
        
    }
}


//



