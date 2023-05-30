//
//  TagModel.swift
//  Macro_Challenge
//
//  Created by Guilherme Borges on 30/05/23.
//

import SwiftUI

struct TagModel: Identifiable, Hashable {
    var id = UUID().uuidString
    var text: String
    var size: CGFloat = 0
}

