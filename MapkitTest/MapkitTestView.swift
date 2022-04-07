import SwiftUI
import MapKit

struct Place: Identifiable {
let id = UUID()
let name: String
let latitude: Double
let longitude: Double
var coordinate: CLLocationCoordinate2D {
    CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
  }
}

struct MapView: View {

let places = [
    Place(name: "Position 1", latitude: 31.21, longitude: 120.50),
    Place(name: "Position 2", latitude: 31.210205, longitude: 120.52301),
    Place(name: "Position 3", latitude: 31.230006, longitude: 120.54002)
]

@State private var region = MKCoordinateRegion(
    center: CLLocationCoordinate2D(latitude: 31.21, longitude: 120.50),
    span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
)

var body: some View {
    Map(coordinateRegion: $region, showsUserLocation: false,  annotationItems: places){ place in
        MapPin(coordinate: place.coordinate)
        
        //MapMarker(coordinate: place.coordinate)
    }
//    if Place.name == "Postion 1"{
//        print("same place")
//    }
  }
}
struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
