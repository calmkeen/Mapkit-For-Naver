# 네이버 지도를 통한 좌표 및 알림 테스트

## 목적
현재 swiftUI는 제대로 된 naver, kakao 맵을 지원하지 않아 UIViewRepresetable을 사용해서 쓴다.

- 네이버 지도를 swiftUI를 통해 써본다.
- 좌표 및 진동 기능등을 더 넣어본다.

## 주석코드 설명
MapkitView는 임의 지정 좌표를 핀기능과 apple지도를 통해 구현
mapkittestView는 여러 좌표를 지정해 여러 핀 구현(apple map)


## 문제 확인
1.showLocationButton으로 간단하게 자신의 좌표를 가져왔으나 어떤식으로 본인 좌표를 끌어오는지 모르겠음
![image](https://user-images.githubusercontent.com/78361650/162695826-2e552196-6f27-496e-8cdb-52af413262e1.png)
2. 핀으로 위치 저장방식을 세워야하는데 기능이 쓸데없이 겹침 . 위의 버튼과 구지 화면터치 버튼. 그런데 방법을 잘 모르겠음


## 문제 해결
1. Coordinator으로 touchDelegate를 만들어 적용시키면 mapView가 호출되어서 지도 탭(터치)시 print문이 출력된다고 함.
1-1. 코드
```
func mapView(_ mapView: NMFMapView, didTapMap latlng: NMGLatLng, point: CGPoint) {
            @State var SaveLocation = [latlng.lat, latlng.lng]
            print("지도 탭")
            print("\(SaveLocation)")

```
위와 같은 식으로 받는다.

2. 해결해야함 . 아직 고민중


## 이미지 첨부


- 위치 정보 요청 인증
<img width="375" alt="image" src="https://user-images.githubusercontent.com/78361650/162164193-b8d14377-5d9f-4cad-ad4b-977f3b81be2e.png">

- 위치정보 버튼 
<img width="367" alt="image" src="https://user-images.githubusercontent.com/78361650/162164323-f8cbdbd3-888e-44eb-a85d-5aaf67c35e67.png">

-진동파트는 코드상에 주석처리
