FROM arm64v8/node:18-alpine

WORKDIR /app

COPY package.json package-lock.json ./
RUN apk add --no-cache git \
    && npm ci \
    && npm cache clean --force

COPY . .
RUN npm run build

ENV NODE_ENV=production
ENV PORT=3000

EXPOSE 3000

CMD ["npm", "run", "start"]
