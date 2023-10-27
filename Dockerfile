# 第一阶段: 构建阶段
FROM node:16 AS build
# 创建应用目录
WORKDIR /app
# 复制项目文件
COPY . .
# 安装依赖项
RUN npm install
# 构建项目
RUN npm run build

# 第二阶段: 生产阶段
FROM nginx:latest

COPY --from=build /app/dist /usr/share/nginx/html
COPY default.conf /etc/nginx/conf.d/default.conf

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]