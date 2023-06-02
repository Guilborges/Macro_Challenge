import Foundation
import SwiftUI





class ProductModel:Identifiable, ObservableObject{
    let id = UUID()
    var tags: [Tag] = []
    public var purchasedPrice: Double
    var status: ProductStatus
    var acessory: Bool
    var image: Image
    
    init(tags: [Tag], purchasedPrice: Double, status: ProductStatus, acessory: Bool,image: Image) {
       
        self.tags = tags
        self.purchasedPrice = purchasedPrice
        self.status = status
        self.acessory = acessory
        self.image = image
    }
    
}
