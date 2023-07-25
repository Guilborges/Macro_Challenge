//
//  Macro_ChallengeApp.swift
//  Macro_Challenge
//
//  Created by Guilherme Borges on 22/05/23.
//

import SwiftUI

@main

struct Macro_ChallengeApp: App {
    
    
   // @State  var prod: ProductViewModel
   

    var body: some Scene {
        

        WindowGroup {

            TelaInicial(prodVm: ProductViewModel(), setIndexProduct: 0)


        }
        
    }
}
