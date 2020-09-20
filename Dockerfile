# builder phase
FROM node:alpine as builder 
WORKDIR '/app'
COPY 'package.json' .
RUN npm install
COPY . .
RUN npm run build

# /app/build -> result of the build

# run phase
FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html
# nginx starts automatically
