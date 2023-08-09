//
//  CoreDataManager.swift
//  Macro_Challenge
//
//  Created by Victor Levenetz Mariano on 08/08/23.
//



import CoreData
import SwiftUI
class CoreDataManeger {
    
    static let instance = CoreDataManeger()
    
    let containter: NSPersistentContainer
    let context: NSManagedObjectContext
    
    
    init(){
        containter = NSPersistentContainer(name: "ProductDataBase")
        containter.loadPersistentStores { ( description, error) in
            if let error = error{
                print("erro ao carregar o Core Data \(error)")
            }
        }
        context = containter.viewContext
    }
    
    func save(){
        do{
            try context.save()
        
        } catch let error {
            print("error ao salvar core data \(error.localizedDescription)")
        }
        
    }
    
    
    
    
}
