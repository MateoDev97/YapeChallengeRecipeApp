//
//  DetailViewModel.swift
//  YapeChallenge
//
//  Created by Brian Ortiz on 2023-07-13.
//

import Combine


class DetailViewModel: ObservableObject {
    
    private var cancellables = Set<AnyCancellable>()

    @Published var isLoading = false

    @Published var alertMessage = ""
    @Published var showAlert = false
    
    @Published var imageRecipe: ImageResult?
    
    
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
        
        
        let encodedQuery = recipeName.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? recipeName
        
        let extraPath = "?api_key=\(ApiPath.API_KEY_SERPDOG)&q=\(encodedQuery)&gl=us"
        
        NetworkManager.shared.genericRequestCustomer(baseUrl: ApiPath.URL_SEARCH_IMAGES, extraPath: extraPath, typeResponse: ImagesResponse.self)
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
                
                
                if let firstImage = responseData.imageResults.first {
                    self?.imageRecipe = firstImage
                } else {
                    self?.showAlert(message: "No image result")
                }
                
                
            })
            .store(in: &cancellables)
    }
    
}

