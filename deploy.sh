docker build -t kotmich97/multi-client:latest -t kotmich97/multi-client:$SHA -f ./client/Dockerfile ./client
docker build -t kotmich97/multi-server:latest -t kotmich97/multi-server:$SHA -f ./server/Dockerfile ./server
docker build -t kotmich97/multi-worker:latest -t kotmich97/multi-worker:$SHA -f ./worker/Dockerfile ./worker
docker push kotmich97/multi-client:latest
docker push kotmich97/multi-client:$SHA
docker push kotmich97/multi-server:latest
docker push kotmich97/multi-server:$SHA
docker push kotmich97/multi-worker:latest
docker push kotmich97/multi-worker:$SHA
kubectl apply -f k8s
kubectl set image deployments/client-deployment client=kotmich97/multi-client:$SHA
kubectl set image deployments/server-deployment server=kotmich97/multi-server:$SHA
kubectl set image deployments/worker-deployment worker=kotmich97/multi-worker:$SHA