docker build -t cahitbeyaz/multi-client -f ./client/Dockerfile .client
docker build -t cahitbeyaz/multi-server -f ./server/Dockerfile .server
docker build -t cahitbeyaz/multi-worker -f ./worker/Dockerfile .worker
docker push cahitbeyaz/multi-client
docker push cahitbeyaz/multi-server
docker push cahitbeyaz/multi-worker
kubectl apply -f k8s
kubectl set image deployments/server-deployment server=cahitbeyaz/multi-server