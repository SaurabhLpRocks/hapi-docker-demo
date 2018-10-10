FROM node:latest

LABEL author="Saurabh Palatkar"

# specify the working directory
WORKDIR app

# install app dependencies
COPY package.json .
COPY package-lock.json .
RUN npm install && npm i gulp --g

# add files to container
COPY . .

# gulp build
RUN npm run build

# expose app port
EXPOSE 8080

# run application
CMD ["npm", "start"]