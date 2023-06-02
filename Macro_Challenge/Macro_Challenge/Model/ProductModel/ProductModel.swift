





class ProductModel:Identifiable, ObservableObject{
    let id = UUID()
    var tags: [Tag] = []
    public var purchasedPrice: Double
    var status: ProductStatus
    var acessory: Bool
    
    init(tags: [Tag], purchasedPrice: Double, status: ProductStatus, acessory: Bool) {
       
        self.tags = tags
        self.purchasedPrice = purchasedPrice
        self.status = status
        self.acessory = acessory
    }
    
}
