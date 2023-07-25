//
//  CoreData.swift
//  Macro_Challenge
//
//  Created by Guilherme Borges on 25/07/23.
//

import Foundation
import CoreData

class CoreDataManager {
    static let shared = CoreDataManager() // Singleton para gerenciar o Core Data nao sei se é isso ao certo
    let persistentContainer: NSPersistentContainer

    private init() {
        persistentContainer = NSPersistentContainer(name: "ProductViewModel")
        persistentContainer.loadPersistentStores { _, error in
            if let error = error {
                fatalError("Erro ao configurar o Core Data: \(error)")
            }
        }
    }

    func saveContext() {
        if persistentContainer.viewContext.hasChanges {
            do {
                try persistentContainer.viewContext.save()
            } catch {
                fatalError("Erro ao salvar o contexto do Core Data: \(error)")
            }
        }
    }
}

