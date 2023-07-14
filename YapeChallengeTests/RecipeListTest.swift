//
//  RecipeListTest.swift
//  YapeChallengeTests
//
//  Created by Brian Ortiz on 2023-07-14.
//


import XCTest
@testable import YapeChallenge

class RecipeListTest: XCTestCase {

    var viewModel = HomeViewModel()
    
    func testGetRandomReceipesForLasagna() {
        let expectation = self.expectation(description: "testGetRandomReceipesForLasagna")
        
        viewModel.getRandomReceipes(query: "lasagna")
        XCTAssertTrue(viewModel.isLoading)
        XCTAssertTrue(viewModel.listRecips.isEmpty)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 5, handler: nil)
        
        XCTAssertFalse(viewModel.isLoading)
        XCTAssertEqual(10, viewModel.listRecips.count)
    }
    
    func testGetRandomReceipesForRoastBeef() {
        let expectation = self.expectation(description: "testGetRandomReceipesForRoastBeef")
        
        viewModel.getRandomReceipes(query: "roast beef")
        XCTAssertTrue(viewModel.isLoading)
        XCTAssertTrue(viewModel.listRecips.isEmpty)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 5, handler: nil)
        XCTAssertFalse(viewModel.isLoading)
        XCTAssertEqual(10, viewModel.listRecips.count)
    }
    
    
    func testGetRandomReceipesNoResults() {
        let expectation = self.expectation(description: "testGetRandomReceipesNoResults")
        
        viewModel.getRandomReceipes(query: "dasdasdasdasdsa")
        XCTAssertTrue(viewModel.isLoading)
        XCTAssertTrue(viewModel.listRecips.isEmpty)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 5, handler: nil)
        
        XCTAssertFalse(viewModel.isLoading)
        XCTAssertEqual(0, viewModel.listRecips.count)
        
    }

}


