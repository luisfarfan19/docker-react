# Two steps. First step: builder.
# We create what is just important to us. The 'build' folder (npm run build)

FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# Second step. START nginx
# We need to copy the 'build' folder into an specific folder
FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html


# Once the 'build' folder is copied to nginx, we can start nginx
# By default, nginx can serve as web server when started on port 80

# RUN:
# docker build .
# docker run -p 8080:80 < ContainerID >


