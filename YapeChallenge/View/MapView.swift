//
//  MapView.swift
//  YapeChallenge
//
//  Created by Brian Ortiz on 2023-07-13.
//

import SwiftUI

struct MapView: View {
    
    @ObservedObject  var viewModel = MapViewModel()
    
    @State private var zoomLevel: Float = 4

    
    var body: some View {
        
        VStack {
            
            ZStack (alignment: .bottomTrailing) {
                if let randomFeature = viewModel.randomFeature {
                    CustomMapView(zoomLevel: $zoomLevel, locationPoint: randomFeature)
                        .frame(height: K.DeviceSize.screenHeight)
                }
                
                VStack {
                    Button(action: {
                        zoomLevel += 1
                    }){
                        Image(systemName: "plus")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .foregroundColor(.gray)
                            .frame(width: 20, height: 20)
                            .padding(.horizontal, 7)
                            .padding(.vertical, 7)
                    }.background(Circle().fill(Color.white))
                    Button(action: {
                        zoomLevel -= 1
                    }){
                        Image(systemName: "minus")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .foregroundColor(.gray)
                            .frame(width: 20, height: 20)
                            .padding(.horizontal, 7)
                            .padding(.vertical, 7)
                    }.background(Circle().fill(Color.white))
                }.padding(.bottom, 75)
                    .padding(.trailing, 20)
                
            }
            
        }
        .ignoresSafeArea(.all)
        .onAppear {
            viewModel.setUpViewModel()
        }
        
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
