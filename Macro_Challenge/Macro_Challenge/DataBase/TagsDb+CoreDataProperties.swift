//
//  TagsDb+CoreDataProperties.swift
//  Macro_Challenge
//
//  Created by Victor Levenetz Mariano on 09/08/23.
//
//

import Foundation
import CoreData


extension TagsDb {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<TagsDb> {
        return NSFetchRequest<TagsDb>(entityName: "TagsDb")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var name: String?
    @NSManaged public var product: NSSet?

}

// MARK: Generated accessors for product
extension TagsDb {

    @objc(addProductObject:)
    @NSManaged public func addToProduct(_ value: ProductDb)

    @objc(removeProductObject:)
    @NSManaged public func removeFromProduct(_ value: ProductDb)

    @objc(addProduct:)
    @NSManaged public func addToProduct(_ values: NSSet)

    @objc(removeProduct:)
    @NSManaged public func removeFromProduct(_ values: NSSet)

}

extension TagsDb : Identifiable {

}
