FROM node:10.13-alpine
WORKDIR /usr/src/app
COPY ["package.json", "package-lock.json*", "./"]
RUN npm install --production --silent && mv node_modules ../
RUN npm install react-scripts -g --silent
COPY . .
RUN npm run build
EXPOSE 5001
CMD serve -l 5001 build