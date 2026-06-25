FROM node:20-alpine
WORKDIR /app
COPY package.json package-lock.json* ./
RUN npm ci --prefer-offline --no-audit --progress=false
COPY . .
RUN npm run prisma:generate || true
RUN npm run build
EXPOSE 3000
CMD ["npm","start"]
