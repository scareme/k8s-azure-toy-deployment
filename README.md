# conda env
```bash
cd toy-manual-deployment/
conda env remove -n toy-dev
conda env create -f env/env-dev.yaml
conda activate toy-dev
```

# local testing
```bash
azmlinfsrv --entry_script src/score.py
python src/test.py
```

# ingress controller
```bash
curl https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v1.9.1/deploy/static/provider/cloud/deploy.yaml > k8s/ingress-controller.yaml

kubectl apply -f k8s/ingress-controller.yaml
kubectl get deploy,svc,ingress -A
kubectl get svc -n ingress-nginx
minikube tunnel
minikube service list (???)
```

# docker image
```bash
docker build . -t toy-model --network host
docker run --rm toy-model 
docker run -it toy-model /bin/sh (inside container)
docker run --rm -p 5001:5001 toy-model
```

# deploy
```bash
minikube image load toy-model
kubectl delete -k k8s/workload/
kubectl apply -k k8s/workload/
kubectl logs deployment.apps/deploy-toy-model -n nsp-toy-model 
sudo bash -c "echo 10.110.131.113 webserver.io >> /etc/hosts"
kubectl get deploy,svc,ingress -A
minikube tunnel
python3 src/test.py
```
