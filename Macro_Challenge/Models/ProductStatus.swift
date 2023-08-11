//
//  ProductStatus.swift
//  Macro_Challenge
//
//  Created by Victor Levenetz Mariano on 27/05/23.
//

import Foundation


enum ProductStatus: String, Codable, CaseIterable, Identifiable{
    
    var id: String { self.rawValue }
    
    
    
    //var id: UUID
    case todos = "Todos"
    case acquarid = "Adquirido"
    case washing = "Lavando"
        case maintenance = "Manuteção"
        case selling = "Vendendo"
        
        case sold = "Vendido"
       // case nullo = "null"
        
    }
    


