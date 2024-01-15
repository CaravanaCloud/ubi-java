docker build -f Containerfile \
    --no-cache \
    --progress=plain \
    -t caravanacloud/ubi-java:latest \
    .

docker push caravanacloud/ubi-java:latest