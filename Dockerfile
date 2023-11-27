FROM nikolaik/python-nodejs:python3.8-nodejs12 AS builder

ENV NODE_WORKDIR /app
WORKDIR $NODE_WORKDIR

# Add Yarn repository key
RUN wget -q -O - https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -

RUN apt-get update \
    && apt-get install -y build-essential gcc wget git libvips \
    && rm -rf /var/lib/apt/lists/* \
    && npm install canvas@2.6.1 \
    && npm install

COPY . .

CMD ["npm", "start"]
