aws configure set region us-east-2
export PASSWORD="$(aws ecr get-login --no-include-email --region us-east-2 | awk '{print $6}')"
docker login -u AWS -p $PASSWORD  https://855754041257.dkr.ecr.us-east-2.amazonaws.com
aws ecr create-repository --repository-name appimage
docker rmi 855754041257.dkr.ecr.us-east-2.amazonaws.com/appimage:latest
docker rmi appimage:latest
docker build -t appimage .
docker tag appimage:latest 855754041257.dkr.ecr.us-east-2.amazonaws.com/appimage:latest 
docker system prune -f
docker push 855754041257.dkr.ecr.us-east-2.amazonaws.com/appimage:latest		




