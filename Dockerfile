FROM node:alpine
WORKDIR '/app'
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

#Second Phase - pulling nginx and getting the build from the previous phase /app/build
FROM nginx
EXPOSE 80
COPY --from=0 /app/build /usr/share/nginx/html