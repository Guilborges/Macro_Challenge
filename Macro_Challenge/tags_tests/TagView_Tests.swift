//
//  TagView_Tests.swift
//  Macro_Challenge
//
//  Created by Guilherme Borges on 31/05/23.
//

//import XCTest
//
//class TagViewTests: XCTestCase {
//    func testGetIndex() {
//        let tag1 = Tag(id: 1, name: "Tag 1", size: 20)
//        let tag2 = Tag(id: 2, name: "Tag 2", size: 25)
//        let tag3 = Tag(id: 3, name: "Tag 3", size: 18)
//        let tags = [tag1, tag2, tag3]
//        
//        let tagView = TagView(maxLimit: 10, tags: .constant(tags))
//        
//        XCTAssertEqual(tagView.getIndex(tag: tag1), 0)
//        XCTAssertEqual(tagView.getIndex(tag: tag2), 1)
//        XCTAssertEqual(tagView.getIndex(tag: tag3), 2)
//    }
//    
//    func testGetRows() {
//        let tag1 = Tag(id: 1, name: "Tag 1", size: 20)
//        let tag2 = Tag(id: 2, name: "Tag 2", size: 25)
//        let tag3 = Tag(id: 3, name: "Tag 3", size: 18)
//        let tag4 = Tag(id: 4, name: "Tag 4", size: 30)
//        let tag5 = Tag(id: 5, name: "Tag 5", size: 22)
//        let tags = [tag1, tag2, tag3, tag4, tag5]
//        
//        let tagView = TagView(maxLimit: 10, tags: .constant(tags))
//        let rows = tagView.getRows()
//        
//        XCTAssertEqual(rows.count, 2)
//        XCTAssertEqual(rows[0].count, 3)
//        XCTAssertEqual(rows[1].count, 2)
//        XCTAssertEqual(rows[0][0], tag1)
//        XCTAssertEqual(rows[0][1], tag2)
//        XCTAssertEqual(rows[0][2], tag3)
//        XCTAssertEqual(rows[1][0], tag4)
//        XCTAssertEqual(rows[1][1], tag5)
//    }
//}
