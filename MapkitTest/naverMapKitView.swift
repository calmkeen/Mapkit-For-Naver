//
//  naverMapKitView.swift
//  MapkitTest
//
//  Created by calmkeen on 2022/04/07.
//


import Foundation
import SwiftUI
//swiftUI가 하도 병신이라 이거 써서 UIViewRepresentable해서 써야함
import UIKit
//네이버
import NMapsMap
//위치 인증을 위한 것
import CoreLocation
//진동을 위한 툴
import AudioToolbox



struct MapScene: View {
    var body: some View {
        UIMapView()
    }
}
    //MARK: - 위치 정보 처음 권한 부여
//
var locationManger : CLLocationManager?

final class ContentViewModel: NSObject,ObservableObject,CLLocationManagerDelegate{
func CheckLocationEnAble() {
    if CLLocationManager.locationServicesEnabled(){
        locationManger = CLLocationManager()
        locationManger?.desiredAccuracy = kCLLocationAccuracyBest
        locationManger?.delegate = self
    }else {
        print("cannot access map")
    }
}
}
    //MARK: - 네이버 지도

struct UIMapView: UIViewRepresentable {
    //위치 정보 관련 권한
    var locationManager = CLLocationManager()
    @ObservedObject var viewModel = MapSceneViewModel()
    
    func makeUIView(context: Context) -> NMFNaverMapView {
        //위치 정보 관련 권한
        locationManager.requestWhenInUseAuthorization()
        
        let Naverview = NMFNaverMapView()
        Naverview.showLocationButton = true
        Naverview.showZoomControls = true
        Naverview.mapView.positionMode = .direction
        //진동 코드
        AudioServicesPlaySystemSound(kSystemSoundID_Vibrate)
        Naverview.mapView.zoomLevel = 17
        Naverview.mapView.isNightModeEnabled = true
        
        return Naverview
    }

    //기본 구조
    func updateUIView(_ uiView: NMFNaverMapView, context: Context) {
    }
}

class MapSceneViewModel: ObservableObject {
    
}

struct UIMapView_Previews: PreviewProvider {
    static var previews: some View {
        MapScene()
    }
}

