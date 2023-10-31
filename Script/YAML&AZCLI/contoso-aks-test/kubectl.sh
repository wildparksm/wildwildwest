kubectl apply -f ./deployment.yaml
# Cloud Shell에서 kubectl apply 명령을 실행하여 배포 매니페스트를 클러스터에 제출합니다.

kubectl get deploy contoso-website
# kubectl get deploy 명령을 실행하여 배포에 성공했는지 여부를 확인합니다.

kubectl get pods
# kubectl get pods 명령을 실행하여 pod가 실행 중인지 여부를 확인합니다.