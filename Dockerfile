FROM node:20-alpine3.17

WORKDIR /usr/app
COPY src /usr/app/src
COPY package*.json /usr/app
COPY tsconfig*.json /usr/app
COPY index.html /usr/app
COPY api /usr/app/api2


RUN npm install 
RUN npm run build 

RUN rm -rf node_modules      
RUN rm -rf src      
RUN mv dist api2

WORKDIR /usr/app/api2
RUN npm install



EXPOSE 5173
CMD ["node" ,"index.js"]