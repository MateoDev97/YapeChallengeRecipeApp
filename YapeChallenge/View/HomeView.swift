//
//  HomeView.swift
//  YapeChallenge
//
//  Created by Brian Ortiz on 2023-07-13.
//

import SwiftUI

struct HomeView: View {
    
    @ObservedObject var viewModel = HomeViewModel()
    
    @FocusState var focusedSearch: Int?
    
    var body: some View {
        
        ScrollView {
            VStack {
                
                HStack {
                    TextField("Search recipes", text: $viewModel.valueQuerySearch)
                        .textFieldStyle(.roundedBorder)
                        .autocorrectionDisabled()
                        .focused($focusedSearch, equals: 1)
                        .onSubmit {
                            focusedSearch = nil
                            viewModel.searchAction()
                        }
                    Button("Search") {
                        focusedSearch = nil
                        viewModel.searchAction()
                    }
                }
                
                Text("List Recipes")
                    .font(.custom(K.Fonts.brandHeavy, size: 32))
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                
                if viewModel.isLoading {
                    ProgressView()
                        .controlSize(.large)
                        .padding(.top, 70)
                }
                
                if viewModel.listRecips.isEmpty && !viewModel.isLoading {
                    Text("No results")
                        .font(.custom(K.Fonts.brandMedium, size: 24))
                        .padding(.top, 70)
                }
                
                ForEach(viewModel.listRecips) { recipe in
                    
                    ZStack(alignment: .topLeading) {
                        Image("card_recipe_background")
                            .resizable()
                            .scaledToFit()
                            .cornerRadius(25)
                        
                        VStack(alignment: .leading) {
                            Text(recipe.title)
                                .font(.custom(K.Fonts.brandMedium, size: 24))
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .lineLimit(3)
                                .padding(.top, 10)
                                .padding(.leading, 15)
                                .padding(.trailing, 100)
                            
                            
                            HStack {
                                Image("icon_dish")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 30, height: 30)
                                Text(recipe.servings)
                                    .font(.custom(K.Fonts.brandMedium, size: 20))
                                Spacer()
                            }.padding(.leading, 15)
                            
                            
                            NavigationLink(destination: DetailView(recipe: recipe), label: {
                                Text("Details")
                                    .font(.custom(K.Fonts.brandMedium, size: 16))
                                    .foregroundColor(.black)
                                    .padding(.vertical, 5)
                                    .padding(.horizontal, 25)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 25)
                                            .stroke(.green, lineWidth: 1)
                                    )
                            })
                            .padding(.vertical, 10)
                            .padding(.leading, 15)
                            
                        }
                        
                    }
                    .padding(.vertical, 5)
                    
                    
                }
                
                
            }
            .padding(.vertical, 20)
            .padding(.horizontal, 20)
            .onAppear {
                viewModel.setUpViewModel()
            }
        }
        .alert(viewModel.alertMessage, isPresented: $viewModel.showAlert) {
            Button("OK", role: .cancel) { }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
