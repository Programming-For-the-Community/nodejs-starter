FROM node:20.12.1

WORKDIR /app

RUN node run build
RUN cp . /app

CMD ["node", "run start"]