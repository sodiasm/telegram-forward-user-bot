FROM --platform=$TARGETPLATFORM node:25-alpine
ARG TARGETPLATFORM

RUN mkdir app

COPY ../src /app/src

COPY ../locales /app/locales

COPY ../package*.json /app

WORKDIR /app

RUN mkdir data

RUN npm install -g npm@latest \
    && npm ci --omit=dev --no-optional \
    && rm package-lock.json

ENTRYPOINT [ "node", "src/index.js" ]
CMD []
