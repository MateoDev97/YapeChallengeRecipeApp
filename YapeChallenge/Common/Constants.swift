//
//  Constants.swift
//  YapeChallenge
//
//  Created by Brian Ortiz on 2023-07-13.
//

import Foundation
import UIKit

struct K {
    
    struct URLs {
        static let URL_SEARCH_RECEIPES = "https://recipe-by-api-ninjas.p.rapidapi.com/v1/recipe"
        static let API_HOST = "recipe-by-api-ninjas.p.rapidapi.com"
        static let UNSPLASH_API = "https://api.unsplash.com/search/photos"
        
    }
    
    struct Keys {
        static let GOOGLE_API_KEY = "AIzaSyBr_bxYZh7f6YFCrGlDV2G0pqzWnrY3VrM"
        static let API_KEY = "12a5cf2d44mshca3153e5062a6e4p142f97jsnb37c6be7399c"
        static let UNSPLASH_ACCESS_KEY = "DQvR-xdL8Kf2DfAgkjEmQX8Z3BO61GjZ4yxBBukLzUs"
        static let UNSPLASH_SECRET_KEY = "Ma4p4La-klo1TB9eyc_AQpmk0LoL7rMFlkvq_vFqHgQ"
    }
    
    struct Fonts {
        static let brandHeavy = "Avenir-Heavy"
        static let brandMedium = "Avenir-Medium"
        static let brandRegular = "Avenir-Book"
    }
    
    struct DeviceSize {
        static let screenWidth = UIScreen.main.bounds.size.width
        static let screenHeight = UIScreen.main.bounds.size.height
    }
}
