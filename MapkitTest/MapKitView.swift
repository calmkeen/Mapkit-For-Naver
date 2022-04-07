//
//  MapKitView.swift
//  MapkitTest
//
//  Created by calmkeen on 2022/04/06.
//

import SwiftUI
import MapKit

struct MapKitView: View {
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 37.5666791, longitude: 126.9782914),span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5))
    let markers = [Marker(location: MapMarker(coordinate: CLLocationCoordinate2D(latitude: 37.5666791, longitude: 126.9782914), tint: .red))]
    var body: some View {
        Map(coordinateRegion: $region,showsUserLocation: true, userTrackingMode: .constant(.follow),annotationItems: markers){
            marker in marker.location
        }
            .edgesIgnoringSafeArea(.all)
        
    }
}

struct Marker : Identifiable{
    let id = UUID()
    var location: MapMarker
}
struct MapKitView_Previews: PreviewProvider {
    static var previews: some View {
        MapKitView()
    }
}
