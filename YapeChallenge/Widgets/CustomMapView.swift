//
//  CustomMapView.swift
//  YapeChallenge
//
//  Created by Brian Ortiz on 2023-07-13.
//

import Foundation
import GoogleMaps
import SwiftUI

struct CustomMapView: UIViewRepresentable {
 
    @Binding var zoomLevel: Float
    let locationPoint: Feature
    
    func makeCoordinator() -> Coordinator {
        Coordinator()
    }
    
    func makeUIView(context: Context) -> GMSMapView {
        
        let camera = GMSCameraPosition.camera(withLatitude: locationPoint.geometry.coordinates[1], longitude: locationPoint.geometry.coordinates[0], zoom: zoomLevel)
        let mapView = GMSMapView(frame: CGRect.zero, camera: camera)
     
        mapView.settings.zoomGestures = true
        
        return mapView
    }
    
    
    func updateUIView(_ mapView: GMSMapView, context: Context) {
       
        mapView.animate(toZoom: zoomLevel)
        
        mapView.clear()
        
            
        let marker: GMSMarker = GMSMarker()
        let latitude = Double(locationPoint.geometry.coordinates[1])
        let longitude = Double(locationPoint.geometry.coordinates[0])
        
        marker.icon = imageWithImage(image: UIImage(named: "icon_location")!, scaledToSize: CGSize(width: 40.0, height: 45.0))
        marker.title = locationPoint.properties.city
        marker.position = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        marker.map = mapView
        
    }
    
    func imageWithImage(image:UIImage, scaledToSize newSize:CGSize) -> UIImage{
        UIGraphicsBeginImageContextWithOptions(newSize, false, 0.0)
        image.draw(in: CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height))
        let newImage:UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return newImage
    }
    
    
    class Coordinator: NSObject {}
    
}
