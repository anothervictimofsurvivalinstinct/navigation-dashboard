FROM alpine:3.15 AS build_stage

RUN apk add \
    python3 \
    py3-pip

RUN python3 -m pip install pyyaml

COPY . .

RUN python3 main.py > index.html

FROM nginx:alpine
COPY --from=build_stage index.html /usr/share/nginx/html
