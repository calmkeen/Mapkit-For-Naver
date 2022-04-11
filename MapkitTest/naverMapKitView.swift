//
//  naverMapKitView.swift
//  MapkitTest
//
//  Created by calmkeen on 2022/04/07.
//


import Foundation
import SwiftUI
//swiftUI가 아직 개발중이라 UIKIT을 사용해서 UIViewRepresentable해서 UIKit 빌려서 사용해야함
import UIKit
//네이버
import NMapsMap
//위치 인증을 위한 것
import CoreLocation
//진동을 위한 툴
import AudioToolbox
import Combine

//MARK: - 일단 대리로 불러옴

struct MapScene: View {
    var body: some View {
        
        UIMapView()
    }
}
//MARK: - 위치 정보 처음 권한 부여
//
var locationManager : CLLocationManager?

final class ContentViewModel:
    NSObject,ObservableObject,CLLocationManagerDelegate{
    func CheckLocationEnAble() {
        
        if CLLocationManager.locationServicesEnabled(){
            
            
            var locationManager = CLLocationManager()
            locationManager = CLLocationManager()
            //거리 정확도
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.delegate = self
            
            
        }else {
            print("cannot access map")
        }
    }
}
//MARK: - 네이버 지도

struct UIMapView: UIViewRepresentable {
    @State var coord: (Double, Double) = (126.9784147, 37.5666805)
    //위치 정보 관련 권한
    var locationManager = CLLocationManager()
    @ObservedObject var viewModel = MapSceneViewModel()
    
    func makeUIView(context: Context) -> NMFNaverMapView {
        //위치 정보 관련 권한허가 되면. 띄우기
        locationManager.requestWhenInUseAuthorization()
        let mapView = NMFNaverMapView()
        mapView.showLocationButton = true
        mapView.showZoomControls = true
        mapView.mapView.positionMode = .direction
        //진동 코드
        AudioServicesPlaySystemSound(kSystemSoundID_Vibrate)
        mapView.mapView.zoomLevel = 17
        mapView.mapView.isNightModeEnabled = true
        mapView.mapView.touchDelegate = context.coordinator
        // 마커
        let marker = NMFMarker()
        marker.position = NMGLatLng(lat: locationManager.location?.coordinate.latitude ?? 0, lng: locationManager.location?.coordinate.longitude ?? 0)
        marker.mapView = mapView.mapView
        return mapView
    }
    //기본 구조
    func updateUIView(_ uiView: NMFNaverMapView, context: Context) {
        let coord = NMGLatLng(lat: coord.1, lng: coord.0)
        let cameraUpdate = NMFCameraUpdate(scrollTo: coord)
        cameraUpdate.animation = .fly
        cameraUpdate.animationDuration = 1
        uiView.mapView.moveCamera(cameraUpdate)
    }

    
    
    //대리자 새우기  이유 : 네이버 지도의 touchDelegate에 적용시키면 자동으로 mapView라 호출되어서 지도 탭(터치)시 print문이 출력
    class Coordinator: NSObject, NMFMapViewTouchDelegate, NMFMapViewCameraDelegate, NMFMapViewOptionDelegate {
        @ObservedObject var viewModel: MapSceneViewModel
        var cancellable = Set<AnyCancellable>()
        
        init(viewModel: MapSceneViewModel) {
            self.viewModel = viewModel
        }
        //위치 업데이트
        func mapView(_ mapView: NMFMapView, didTapMap latlng: NMGLatLng, point: CGPoint) {
            @State var SaveLocation = [latlng.lat, latlng.lng]
            print("지도 탭")
            print("\(SaveLocation)")
        }
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(viewModel: self.viewModel)
    }
}
class MapSceneViewModel: ObservableObject {
    
}

struct UIMapView_Previews: PreviewProvider {
    static var previews: some View {
        MapScene()
    }
}

