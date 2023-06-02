//
//  Macro_ChallengeApp.swift
//  Macro_Challenge
//
//  Created by Guilherme Borges on 22/05/23.
//

import SwiftUI

@main
struct Macro_ChallengeApp: App {
    @State var tags: [Tag] = []
    @State var imagePicker = ImagePicker().image
    var body: some Scene {
        WindowGroup {
            ContentView(prod: Product.init(tags: [Tag(name: "")], purchasedPrice: 200, status: ProductStatus.acquarid, acessory: true), tags: $tags )
        }
        
    }
}
