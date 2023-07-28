//
//  ProductAddSpec.swift
//  Macro_ChallengeTests
//
//  Created by Vinicius on 30/05/23.
//

import XCTest
@testable import Macro_Challenge

final class ProductAddSpec: XCTestCase {
    var prod: Product!
    var status: ProductStatus = ProductStatus.acquarid
    
   
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        try super.setUpWithError()
        //prod = Product(tags: [Tag(name: "arroz")], purchasedPrice: 2, status: status , acessory: true)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        prod = nil
        try super.tearDownWithError()
    }


    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testValueDoubleOnPurchasedPrice () {
        print(prod.purchasedPrice)
        XCTAssertEqual(String(prod.purchasedPrice), String(2.0))
      
        
        
        
    }
    
//    func testReturnDoubleValue() {
//       // XCTAssertEqual(prod.convertStringToDouble(text: "2.0"), 2.0)
//    }

}
