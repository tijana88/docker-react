FROM node:alpine as builder  
# as = name of the phase

WORKDIR '/app'
COPY package.json .
RUN npm install

COPY . .

RUN npm run build

# start of new phase, 1 phase = 1 FROM
FROM nginx 
COPY --from=builder /app/build /usr/share/nginx/html
