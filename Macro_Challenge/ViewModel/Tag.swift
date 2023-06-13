//
//  Tag.swift
//  Macro_Challenge
//
//  Created by Victor Levenetz Mariano on 27/05/23.
//

import Foundation


class Tag: Identifiable, Equatable, Hashable {
    let id = UUID()
    var name: String
    var size: CGFloat = 0
    
    init(name: String) {
        self.name = name
    }
    
    static func == (lhs: Tag, rhs: Tag) -> Bool {
        return lhs.id == rhs.id && lhs.name == rhs.name
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
        hasher.combine(name)
    }
}
    

    func createTag(name: String ) -> Tag {
        return Tag(name: name)  
    }
    
    func instanceTags (){
        
    }


