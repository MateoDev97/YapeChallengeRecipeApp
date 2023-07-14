//
//  RecipeDetailTest.swift
//  YapeChallengeTests
//
//  Created by Brian Ortiz on 2023-07-14.
//

import XCTest
@testable import YapeChallenge


class RecipeDetailTest: XCTestCase {
    
    var viewModel = DetailViewModel()
    
    let mockRecipeSelected = RecipeItem(
        title: "Broccoli Shrimp Lasagna",
        ingredients: "6 Lasagna noodles; uncooked|3 tb Margarine|1/4 c All-purpose flour|1/4 c Green onion; sliced|1/4 ts Salt|1/4 ts Dry mustard|1/4 ts Dried thyme|1/4 ts Cayenne pepper|2 1/2 c Milk; skim|1 c Monterey jack cheese; shredded|1 lb Broccoli flowerets|2 1/2 c Shredded cheddar cheese; lowfat, Healthy C|1 lb Shrimp; cooked, deveined",
        servings: "8 Servings",
        instructions: "Cook lasagna noodles to desired doneness as directed on package; drain. Rinse with hot water. Meanwhile, melt margarine in medium saucepan over medium heat. Stir in flour, onions, salt, dry mustard, thyme and ground red pepper. Gradually add milk, stirring constantly. Cook and stir until mixture is bubbly and thickened. Remove from heat. Add Monterey Jack cheese; stir until melted. Heat oven to 350°F. In ungreased 13x9-inch (3-quart) baking dish, layer 1/2 cup sauce, 3 noodles, all of the broccoli, 1/2 cup of the Cheddar cheese and 1 cup sauce. Top with remaining noodles, all of the shrimp, 1 cup of the Cheddar cheese, the remaining sauce and the remaining cheese. Bake for 30 minutes or until hot and bubbly. Let stand 10 minutes before serving. NOTES : Calories: 504.3 (22.3% from fat) Fat: 12.4g Cholesterol: 124mg Carbohydrate: 59g Fiber: 3.4g Sodium: 648mg"
    )
    
    
    
    func testGetImageForRecipe() {
        let expectation = self.expectation(description: "testGetImageForRecipe")
        
        viewModel.getImageFromRecipeName(mockRecipeSelected.title)
        XCTAssertTrue(viewModel.isLoading)
        XCTAssertNil(viewModel.imageRecipe)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 10.0) {
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 10, handler: nil)
        
        XCTAssertFalse(viewModel.isLoading)
        XCTAssertNotNil(viewModel.imageRecipe)
        
        if let image = viewModel.imageRecipe {
            let urlImage = URL(string: image.original)
            XCTAssertNotNil(urlImage)
        }
        
        
    }
    
    
}
