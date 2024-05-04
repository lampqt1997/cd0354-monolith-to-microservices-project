kubectl delete service frontend
kubectl delete service backend-user
kubectl delete service backend-feed
kubectl delete service reverseproxy

kubectl apply -f reverseproxy-service.yaml
kubectl apply -f backend-feed-service.yaml
kubectl apply -f backend-user-service.yaml
kubectl apply -f frontend-service.yaml

kubectl expose deployment frontend --type=LoadBalancer --name=publicfrontend
kubectl expose deployment reverseproxy --type=LoadBalancer --name=publicreverseproxy
