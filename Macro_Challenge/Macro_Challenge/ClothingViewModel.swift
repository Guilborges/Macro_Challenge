//
//  ClothingViewModel.swift
//  Macro_Challenge
//
//  Created by Victor Levenetz Mariano on 23/05/23.
//

import Foundation


class ClothingViewModel {
    typealias ClothingFilter = (Clothing) -> Bool
    
    var clothings: [Clothing] = []
    var filters : [ClothingFilter] = []
    
    init(clotings: [Clothing],filters: [ClothingFilter] = []){
        self.clothings = clotings
        self.filters = filters
    }
    
    var clothingMatchingFilter: [Clothing]{
        var filteredClothing = clothings
        
        for filter in filters{
            filteredClothing = filteredClothing.filter(filter)
        }
        return filteredClothing
    }
}
