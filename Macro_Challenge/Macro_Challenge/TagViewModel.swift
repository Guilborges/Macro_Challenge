//
//  TagViewModel.swift
//  Macro_Challenge
//
//  Created by Guilherme Borges on 25/05/23.
//

import SwiftUI

// Tag Data Model...

struct TagViewModel: Identifiable {
    var id = UUID().uuidString
    var tagText : String
    //Para parar a atualização automática...
    var isExceeded = false
}


