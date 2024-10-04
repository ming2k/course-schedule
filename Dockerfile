# 使用 nginx 作为基础镜像
FROM nginx:alpine

# 将当前目录下的 index.html 复制到容器的 /usr/share/nginx/html/ 目录
COPY index.html /usr/share/nginx/html/

# 暴露 80 端口
EXPOSE 80

# 启动 nginx
CMD ["nginx", "-g", "daemon off;"]