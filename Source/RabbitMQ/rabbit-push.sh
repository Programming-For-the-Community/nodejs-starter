version="1.0.0"

docker build -t professorchaos0802/private:my-rabbit-${version} .
docker push professorchaos0802/private:my-rabbit-${version}