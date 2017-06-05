FROM node:boron

# Create app directory
RUN mkdir -p /usr/src/app

# Install app dependencies AND copy complete code
WORKDIR /usr/src/app/
COPY . /usr/src/app/
RUN yarn install
RUN npm run build

ENV NODE_ENV=production
ENV PORT=3001

EXPOSE 3001
CMD [ "npm", "start" ]
