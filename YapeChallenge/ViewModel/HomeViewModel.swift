//
//  HomeViewModel.swift
//  YapeChallenge
//
//  Created by Brian Ortiz on 2023-07-13.
//

import Foundation
import Combine
import UIKit

class HomeViewModel: ObservableObject {
    
    private var cancellables = Set<AnyCancellable>()
    
    @Published var listRecips: [RecipeItem] = []
    
    @Published var valueQuerySearch = ""
    
    @Published var isLoading = false


    @Published var alertMessage = ""
    @Published var showAlert = false
    
    
    func setUpViewModel() {
        if listRecips.isEmpty {
            getRandomReceipes(query: "lasagna")
        }
    }
    
    func showAlert(message: String) {
        alertMessage = message
        showAlert = true
    }
    
    func searchAction() {
        if valueQuerySearch.isEmpty {
            showAlert(message: "You must enter a search value")
            return
        }
        
        getRandomReceipes(query: valueQuerySearch)
        valueQuerySearch = ""
    }
    
}


extension HomeViewModel {
    func getRandomReceipes(query: String) {
        
        isLoading = true
        
        listRecips.removeAll()
        
        let headers = ["X-RapidAPI-Key": ApiPath.API_KEY,
                       "X-RapidAPI-Host" : ApiPath.API_HOST]
        
        
        let encodedQuery = query.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? query
        
        let extraPath = "?query=\(encodedQuery)"
        
        NetworkManager.shared.genericRequestCustomer(baseUrl: ApiPath.URL_SEARCH_RECEIPES, extraPath: extraPath, headers: headers, typeResponse: [RecipeItem].self)
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
                self?.listRecips = responseData
            })
            .store(in: &cancellables)
    }
}
