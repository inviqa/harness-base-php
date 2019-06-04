
# Pre-requisites for testing on local environment
* Install Minikube or activate Kubernetes from Docker-for-Desktop
```bash
brew cask install minikube virtualbox
minikube start
```
* install Kubernetes' Helm
```bash
brew install kubernetes-helm
```
* initialise Helm
```bash
kubectl -n kube-system delete deployment tiller-deploy
kubectl -n kube-system delete service/tiller-deploy
helm init --wait
kubectl -n kube-system get deployments
```
* run the helm deployment
```bash
mkdir -p tests
cd tests
ws create drupal8-test inviqa/drupal8 --no-install
cd drupal8-test
echo 'attribute(\'docker-sync\'): off' >> workspace.override.yml
cp -pR ../../dist/harness-drupal8 .my127ws
ws app deploy preview
```
* get the nginx pod name
```bash
kubectl -n drupal8-test-feature-initial-base-helm-charts get pods | grep nginx
```
* create a localhost port redirection to port 8888
```bash
kubectl -n drupal8-test-feature-initial-base-helm-charts port-forward <nginx-pod-name> 8888:80
```
* visit the running site at `http://localhost:8888`


once it is installed the CSS are not loaded:

```
Refused to apply style from:
'http://drupal8-test-feature-initial-base-helm-charts.example.com:8888/sites/default/files/css/css_Z5jMg7P_bjcW9iUzujI7oaechMyxQTUqZhHJ_aYSq04.css?psjtps'
because its MIME type ('text/html') is not a supported stylesheet MIME type, and strict MIME checking is enabled.
```
