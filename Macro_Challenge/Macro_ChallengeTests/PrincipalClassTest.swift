////
////  PrincipalClassTest.swift
////  Macro_ChallengeTests
////
////  Created by Victor Levenetz Mariano on 23/05/23.
////
//
//import XCTest
//@testable import Macro_Challenge
//
//
//final class PrincipalClassTest: XCTestCase {
//
//    static let clothings = [
//
//        Clothing(name: "Camiseta", clothingColor: "Verde", price: 200, clothingAcessory: false),
//        Clothing(name: "Calça", clothingColor: "Preto", price: 324, clothingAcessory: false),
//        Clothing(name: "Camiseta", clothingColor: "Rosa", price: 300, clothingAcessory: false),
//        Clothing(name: "Bermuda", clothingColor: "Branco", price: 324, clothingAcessory: false),
//        Clothing(name: "Boné", clothingColor: "Branco", price: 324, clothingAcessory: false),
//        Clothing(name: "Sapato", clothingColor: "Branco", price: 324, clothingAcessory: false)
//
//    ]
//    func testNamesClothingFilter() {
//        let clothingViewModel = ClothingViewModel(clotings: PrincipalClassTest.clothings)
//
//        clothingViewModel.filters = [{ $0.name == "Camiseta"}]
//
//        let expectedResult = [
//            Clothing(name: "Camiseta", clothingColor: "Verde", price: 200, clothingAcessory: false),
//            Clothing(name: "Camiseta", clothingColor: "Rosa", price: 300, clothingAcessory: false)
//            ]
//
//        XCTAssertEqual(clothingViewModel.clothingMatchingFilter, expectedResult)
//
//    }
//}
//
