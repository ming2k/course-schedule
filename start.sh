#!/bin/bash

# 设置变量
IMAGE_NAME="course-schedule"
CONTAINER_NAME="course-schedule-container"

# 构建 Docker 镜像
echo "Building Docker image..."
docker build -t $IMAGE_NAME .

# 检查是否有同名容器正在运行,如果有则停止并删除
if [ "$(docker ps -q -f name=$CONTAINER_NAME)" ]; then
    echo "Stopping existing container..."
    docker stop $CONTAINER_NAME
    echo "Removing existing container..."
    docker rm $CONTAINER_NAME
fi

# 启动新的容器
echo "Starting new container..."
docker run -d --name $CONTAINER_NAME -p 80:80 $IMAGE_NAME

echo "Container started. You can access the app at http://localhost"