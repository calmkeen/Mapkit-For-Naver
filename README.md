# 네이버 지도를 통한 좌표 및 알림 테스트

## 목적
현재 swiftUI는 제대로 된 naver, kakao 맵을 지원하지 않아 UIViewRepresetable을 사용해서 쓴다.

- 네이버 지도를 swiftUI를 통해 써본다.
- 좌표 및 진동 기능등을 더 넣어본다.

## 주석코드 설명
MapkitView는 임의 지정 좌표를 핀기능과 apple지도를 통해 구현
mapkittestView는 여러 좌표를 지정해 여러 핀 구현(apple map)

## 이미지 첨부


- 위치 정보 요청 인증
<img width="375" alt="image" src="https://user-images.githubusercontent.com/78361650/162164193-b8d14377-5d9f-4cad-ad4b-977f3b81be2e.png">

- 위치정보 버튼 
<img width="367" alt="image" src="https://user-images.githubusercontent.com/78361650/162164323-f8cbdbd3-888e-44eb-a85d-5aaf67c35e67.png">

-진동파트는 코드상에 주석처리
