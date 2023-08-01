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
            PrincipalList(prod: prodVm)
                .tabItem {
                    Image(systemName: "globe")
                }
            
            WashingList(prod: prodVm)
                .tabItem {
                    Image(systemName: "globe")
                }
            
            MaintenanceList(prod: prodVm)
                .tabItem {
                    Image(systemName: "globe")
                }
            
            SellingList(prod: prodVm)
                .tabItem {
                    Image(systemName: "globe")
                }

        }
        
        
        
        
    }
}


//



