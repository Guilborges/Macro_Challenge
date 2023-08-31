//
//  CoreDataManager.swift
//  Macro_Challenge
//
//  Created by Victor Levenetz Mariano on 08/08/23.
//



import CoreData
import SwiftUI
class CoreDataManeger {
    
    static let instanceSingle = CoreDataManeger()
    
    let containter: NSPersistentContainer
    let context: NSManagedObjectContext
    
    
    init(){
        
        containter = NSPersistentContainer(name: "ProductDataModel")
        containter.loadPersistentStores { ( description, error) in
            if let error = error{
                print("erro ao carregar o Core Data \(error)")
            }
        }
        context = containter.viewContext
    }
    
    func saveCoreData(){
        do{
            try context.save()
        
        } catch let error {
            print("error ao salvar core data \(error.localizedDescription)")
        }
        
    }
    
    
    func fetchResults() -> [ProductDb] {
            let fetchRequest: NSFetchRequest<ProductDb> = ProductDb.fetchRequest()
            do {
                let fetchedResults = try context.fetch(fetchRequest)
                return fetchedResults
            } catch {
                // Lide com erros
                return []
            }
        }
    
}
