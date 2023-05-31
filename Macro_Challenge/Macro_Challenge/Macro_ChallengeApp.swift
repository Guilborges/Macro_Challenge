//
//  Macro_ChallengeApp.swift
//  Macro_Challenge
//
//  Created by Guilherme Borges on 22/05/23.
//

import SwiftUI

@main
struct Macro_ChallengeApp: App {
    var body: some Scene {
        WindowGroup {

            Home( prod:.init(tags:[Tag(name: "")] , price: 2, status: ProductStatus.sewing, acessory: false) )

        }
    }
}
