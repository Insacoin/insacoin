FROM node:8-alpine

RUN apk update && \
	apk add python git ca-certificates make && \
	git clone https://github.com/ttauveron/insacoin-rpc-explorer /workspace

WORKDIR /workspace

RUN npm install && \
	npm run build

EXPOSE 3002

ADD entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
CMD ["npm","start"]

