# Goormton k8s 과정 : 실습과제2

## 수행과제
- ### DB 띄우기
  - 웹 서버와 연결할 mysql DB를 클러스터 상에 띄웁니다.
- ### DB url을 환경변수로 주입하여 웹 서버 띄우기
  - 웹 서버 이미지를 사용하여 Deployment 형상을 작성합니다. 위에서 띄운 DB에 접근할 수 있도록 Deployment의 환경 변수로 DB url을 주입합니다.
  - 외부에서 접근할 수 있도록 Service와 Ingress를 생성합니다.
