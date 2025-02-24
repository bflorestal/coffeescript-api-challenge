# Stage 1
FROM node:lts-alpine AS builder

WORKDIR /app

COPY package*.json ./

RUN npm install

COPY . .

# Compilation avec npx coffee --compile --output dist/ src/
RUN npm run build

# Stage 2
FROM node:lts-alpine AS runner

WORKDIR /app

COPY --from=builder /app/dist ./dist
COPY --from=builder /app/node_modules ./node_modules
COPY --from=builder /app/package*.json ./

ENV NODE_ENV=production

EXPOSE 8000

CMD ["npm", "start"]