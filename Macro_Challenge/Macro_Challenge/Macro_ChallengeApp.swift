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
            TagView(prod: Product(tags: [Tag(name: "", frequency: 0)], price: 2.2, status: ProductStatus.sewing, acessory: true))
        }
    }
}
