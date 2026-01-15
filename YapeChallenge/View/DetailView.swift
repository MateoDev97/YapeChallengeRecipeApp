//
//  DetailView.swift
//  YapeChallenge
//
//  Created by Brian Ortiz on 2023-07-13.
//

import SwiftUI

struct DetailView: View {

    var recipe: RecipeItem
    @ObservedObject var viewModel = DetailViewModel()

    var body: some View {
        
        VStack {
            
            if let imageItem = viewModel.imageRecipe, let urlImage = URL(string: imageItem) {
                
                AsyncImage(
                    url: urlImage,
                    content: { image in
                        image.resizable()
                            .scaledToFill()
                            .frame(width: K.DeviceSize.screenWidth, height: 300)
                            .clipped()

                    },
                    placeholder: {
                        Image("card_recipe_background")
                            .resizable()
                            .scaledToFill()
                            .frame(width: K.DeviceSize.screenWidth, height: 300)
                            .clipped()
                    }
                )
            } else {
                ZStack {
                    Image("card_recipe_background")
                        .resizable()
                        .scaledToFill()
                        .frame(width: K.DeviceSize.screenWidth, height: 300)
                        .clipped()
                    if viewModel.isLoading {
                        ProgressView()
                            .controlSize(.large)
                    }
                }
                
            }
            
            ScrollView {
                VStack(spacing: 0) {
                    
                    Text(recipe.title)
                        .font(.custom(K.Fonts.brandHeavy, size: 22))
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Text("Servings:")
                        .font(.custom(K.Fonts.brandMedium, size: 20))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.top, 10)
                    Text(recipe.servings)
                        .font(.custom(K.Fonts.brandRegular, size: 16))
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Text("Ingredients:")
                        .font(.custom(K.Fonts.brandMedium, size: 20))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.top, 10)
                    Text(recipe.ingredients)
                        .font(.custom(K.Fonts.brandRegular, size: 16))
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Text("Instructions:")
                        .font(.custom(K.Fonts.brandMedium, size: 20))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.top, 10)
                    Text(recipe.instructions)
                        .font(.custom(K.Fonts.brandRegular, size: 16))
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    
                    
                    NavigationLink(destination: MapView(), label: {
                        HStack {
                            Image("icon_map")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 35, height: 35)
                            Text("Receipe Origin")
                                .font(.custom(K.Fonts.brandRegular, size: 16))
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.top, 5)
                        }
                    }).padding(.vertical, 30)
                    
                }.padding(.horizontal, 25)
            }
            
            Spacer()
            
            
        }
        .ignoresSafeArea(.all)
        .onAppear {
            viewModel.setUpViewModel(recipe)
        }
        .alert(viewModel.alertMessage, isPresented: $viewModel.showAlert) {
            Button("OK", role: .cancel) { }
        }
    }
}
