FROM node:18-alpine as build-deps

WORKDIR /app

ARG REACT_APP_PATH

COPY ${REACT_APP_PATH} ./

# you can use yarn but I propose npm is faster
RUN npm install
RUN npm run build 

FROM nginx:1.27.2-alpine-slim
COPY --from=build-deps /app/build /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]