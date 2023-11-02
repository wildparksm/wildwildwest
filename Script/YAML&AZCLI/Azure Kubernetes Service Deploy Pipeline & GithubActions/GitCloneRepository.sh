# Github 에서 https://github.com/MicrosoftDocs/mslearn-aks-deployment-pipeline-github-actions 레포지토리를 땡겨 온 뒤
# Git clone 명령어 실행 

git clone https://github.com/{your-username}/mslearn-aks-deployment-pipeline-github-actions
cd mslearn-aks-deployment-pipeline-github-actions
bash init.sh

# init.sh 파일은 다음 작업을 수행합니다.

# 새 리소스 그룹을 만듭니다.
# 새 AKS 클러스터를 만들고 이 클러스터에 액세스할 수 있도록 Kubectl을 설정합니다.
# 새 Container Registry 리포지토리를 만들어 AKS 클러스터에 연결합니다.
# AKS_NAME, DNS_NAME, RESOURCE_GROUP_NAME 및 ACR_NAME 환경 변수를 설정합니다.
# 스크립트 실행이 완료되면 변수의 목록이 표시됩니다. 변수 이름을 복사하여 저장하세요. 연습에는 이러한 변수가 필요합니다.

# 스크립트 출력에 표시된 리소스 그룹이 나열되는지 확인합니다
az group list -o table

# 스크립트 출력에 표시된 Container Registry 인스턴스가 나열되는지 확인합니다.
az acr list -o table


# Installation concluded, copy these values and store them, you'll use them later in this exercise:
# -> Resource Group Name: mslearn-gh-pipelines-26928
# -> ACR Name: contosocontainerregistry31266
# -> ACR Login Username:
# -> ACR Password:
# -> AKS Cluster Name: contosocontainerregistry31266
# -> AKS DNS Zone Name: de79d0c498164b0a8bec.eastus.aksapp.io