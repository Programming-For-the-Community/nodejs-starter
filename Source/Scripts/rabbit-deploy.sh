echo "Pulling Image"
echo "=========================="
rabbitImage="professorchaos0802/private:my-rabbit-1.0.0"
rabbitContainer="rabbit"
docker pull $rabbitImage
echo

containers=$(docker ps -a --format "{{.Names}}")
echo "Existing Containers"
echo "=========================="
echo $containers
echo

if [[ $containers == *"${rabbitContainer}"* ]]; then
    echo "Stopping Existing Containers"
    echo "=========================="
    docker stop $rabbitContainer
    docker rm $rabbitContainer
fi
echo

echo "Starting Container"
echo "=========================="
docker run -d --name $rabbitContainer -it -p 5672:5672 -p 15672:15672 $rabbitImage