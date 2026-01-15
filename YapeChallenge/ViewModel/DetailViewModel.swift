//
//  DetailViewModel.swift
//  YapeChallenge
//
//  Created by Brian Ortiz on 2023-07-13.
//

import Combine
import UnsplashPhotoPicker

class DetailViewModel: ObservableObject {
    
    private var cancellables = Set<AnyCancellable>()

    @Published var isLoading = false

    @Published var alertMessage = ""
    @Published var showAlert = false
    
    @Published var imageRecipe: String?
    
    
    private var recipe: RecipeItem?

    
    func setUpViewModel(_ recipe: RecipeItem) {
        self.recipe = recipe
        
        if imageRecipe == nil {
            getImageFromRecipeName(recipe.title)
        }
    }
    
    func showAlert(message: String) {
        alertMessage = message
        showAlert = true
    }
}


extension DetailViewModel {
    
    func getImageFromRecipeName(_ recipeName: String) {
        isLoading = true
        
        let headers = ["Authorization": "Client-ID \(K.Keys.UNSPLASH_ACCESS_KEY)"]
        
        let encodedQuery = recipeName.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? recipeName
        
        let extraPath = "?query=\(encodedQuery)&per_page=1"
        
        NetworkManager.shared.genericRequestCustomer(baseUrl: K.URLs.UNSPLASH_API, extraPath: extraPath, headers: headers, typeResponse: UnsplashSearchResponse.self)
            .sink(receiveCompletion: { [weak self] completion in
                self?.isLoading = false
                switch completion {
                case .failure(let err):
                    self?.showAlert(message: err.localizedDescription)
                    break
                default:
                    break
                }
            }, receiveValue: { [weak self] responseData in
                self?.isLoading = false
                
                if let firstImage = responseData.results.first {
                    self?.imageRecipe = firstImage.urls.regular
                } else {
                    self?.showAlert(message: "No image result")
                }
                
                
            })
            .store(in: &cancellables)
    }
    
}

