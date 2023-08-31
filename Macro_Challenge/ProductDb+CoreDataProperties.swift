//
//  ProductDb+CoreDataProperties.swift
//  Macro_Challenge
//
//  Created by Victor Levenetz Mariano on 30/08/23.
//
//

import Foundation
import CoreData


extension ProductDb {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ProductDb> {
        return NSFetchRequest<ProductDb>(entityName: "ProductDb")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var purchasedPrice: Double
    @NSManaged public var status: String?
    @NSManaged public var acessory: Bool
    @NSManaged public var image: String?
    @NSManaged public var tags: NSSet?

}

// MARK: Generated accessors for tags
extension ProductDb {

    @objc(addTagsObject:)
    @NSManaged public func addToTags(_ value: TagsDb)

    @objc(removeTagsObject:)
    @NSManaged public func removeFromTags(_ value: TagsDb)

    @objc(addTags:)
    @NSManaged public func addToTags(_ values: NSSet)

    @objc(removeTags:)
    @NSManaged public func removeFromTags(_ values: NSSet)

}

extension ProductDb : Identifiable {

}
