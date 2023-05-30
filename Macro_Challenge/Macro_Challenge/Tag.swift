//
//  Tag.swift
//  Macro_Challenge
//
//  Created by Victor Levenetz Mariano on 27/05/23.
//

import Foundation


class Tag: Identifiable  {
    let id = UUID()
    var name: String
//    var frequency: Int = 0
    
    init(name: String) {
        self.name = name
//        self.frequency = frequency
    }
    

    func createTag(name: String ) -> Tag {
        return Tag(name: name)
        
    }
    
    func instanceTags (){
        
    }

}
