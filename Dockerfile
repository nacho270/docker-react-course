# builder phase
FROM node:alpine
WORKDIR '/app'
COPY 'package.json' .
RUN npm install
COPY . .
RUN npm run build

# /app/build -> result of the build

# run phase
FROM nginx
EXPOSE 80
COPY --from=0 /app/build /usr/share/nginx/html
# nginx starts automatically
