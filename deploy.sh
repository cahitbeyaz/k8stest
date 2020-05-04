docker build -t cahitbeyaz/mult-client:latest -t cahitbeyaz/mult-client:$GIT_SHA -f ./client/Dockerfile .client
docker build -t cahitbeyaz/mult-server:latest -t cahitbeyaz/mult-server:$GIT_SHA -f ./server/Dockerfile .server
docker build -t cahitbeyaz/mult-worker:latest -t cahitbeyaz/mult-worker:$GIT_SHA -f ./worker/Dockerfile .worker
docker push cahitbeyaz/multi-client:latest
docker push cahitbeyaz/multi-server:latest
docker push cahitbeyaz/multi-worker:latest
docker push cahitbeyaz/multi-client:$GIT_SHA
docker push cahitbeyaz/multi-server:$GIT_SHA
docker push cahitbeyaz/multi-worker:$GIT_SHA
kubectl apply -f k8s
kubectl set image deployments/client-deployment client=cahitbeyaz/multi-client:$GIT_SHA
kubectl set image deployments/worker-deployment worker=cahitbeyaz/multi-worker:$GIT_SHA
kubectl set image deployments/server-deployment server=cahitbeyaz/multi-server:$GIT_SHA