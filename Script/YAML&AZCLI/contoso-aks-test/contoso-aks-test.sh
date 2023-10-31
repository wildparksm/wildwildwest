export RESOURCE_GROUP=rg-tdgl-video
export CLUSTER_NAME=aks-tdgl-video
export LOCATION=koreacentral

az group create --name=$RESOURCE_GROUP --location=$LOCATION
# 이 명령어는 Azure 리소스 그룹을 생성합니다. 리소스 그룹은 Azure 리소스의 논리적 컨테이너입니다.

az aks create \
--resource-group $RESOURCE_GROUP \
--name $CLUSTER_NAME \
--node-count 2 \
--enable-addons http_application_routing \
--generate-ssh-keys \
--node-vm-size Standard_B2s \
--network-plugin azure

# 이 명령어는 AKS 클러스터를 생성합니다. 다음과 같은 옵션이 지정됩니다.

# --resource-group: AKS 클러스터를 생성할 리소스 그룹의 이름입니다.
# --name: AKS 클러스터의 이름입니다.
# --node-count: AKS 클러스터의 노드 수입니다.
# --enable-addons http_application_routing: HTTP Application Routing 애드온을 사용합니다. 이 애드온은 AKS 클러스터의 인그레스 컨트롤러를 제공합니다.
# --generate-ssh-keys: AKS 클러스터에 대한 SSH 키를 생성합니다. 이렇게 하면 SSH를 사용하여 AKS 클러스터에 연결할 수 있습니다.
# --node-vm-size: AKS 클러스터 노드에 사용될 가상 머신의 크기입니다.
# --network-plugin azure: AKS 클러스터의 Azure 네트워크 플러그인을 지정합니다.
