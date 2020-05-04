docker build -t cahitbeyaz/multi-client -t cahitbeyaz/mult-client:latest -t cahitbeyaz/mult-client:$GIT_SHA -f ./client/Dockerfile .client
docker build -t cahitbeyaz/multi-server -t cahitbeyaz/mult-server:latest -t cahitbeyaz/mult-server:$GIT_SHA -f ./server/Dockerfile .server
docker build -t cahitbeyaz/multi-worker -t cahitbeyaz/mult-worker:latest -t cahitbeyaz/mult-worker:$GIT_SHA -f ./worker/Dockerfile .worker
docker push cahitbeyaz/multi-client
docker push cahitbeyaz/multi-server
docker push cahitbeyaz/multi-worker
kubectl apply -f k8s
kubectl set image deployments/server-deployment server=cahitbeyaz/multi-client:$GIT_SHA
kubectl set image deployments/server-deployment server=cahitbeyaz/multi-worker:$GIT_SHA
kubectl set image deployments/server-deployment server=cahitbeyaz/multi-server:$GIT_SHA