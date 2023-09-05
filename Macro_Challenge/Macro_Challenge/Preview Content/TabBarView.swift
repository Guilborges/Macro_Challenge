//
//  TelaInicial.swift
//  Macro_Challenge
//
//  Created by Guilherme Borges on 06/06/23.
//

import SwiftUI

struct TabBarView: View {
    @StateObject var prodVm: ProductViewModel
    @State private var tags: [Tag] = []
    public var setIndexProduct: Int
    
    
    var body: some View {
        TabView {
            
            
            SellingList(prod: prodVm)
              
                .tabItem {
                    Image("storeIcon2")
                    Text("Loja")
                }.background(Color("background"))
            
            PrincipalList(prod: prodVm)
            
                .tabItem {
                    Image("processIcon2")
                    Text("Status")
                }.background(Color("background"))
            
            
            
        }
        .background(Color("background"))
    }
}


//



