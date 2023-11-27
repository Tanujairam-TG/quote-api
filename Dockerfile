FROM nikolaik/python-nodejs:python3.8-nodejs12 AS builder

ENV NODE_WORKDIR /app
WORKDIR $NODE_WORKDIR

COPY package*.json ./

RUN apt-get update \
    && apt-get install -y build-essential gcc wget git libvips \
    && rm -rf /var/lib/apt/lists/* \
    && npm install canvas@2.6.1 \
    && npm install

COPY . .

CMD ["npm", "start"]
