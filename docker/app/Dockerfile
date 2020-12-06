ARG BASE_IMAGE
ARG BASE_IMAGE_TAG
ARG APP_PORT

# Builder image for setting common things for dev.
FROM $BASE_IMAGE:${BASE_IMAGE_TAG} AS builder

RUN \
    apk add --no-cache \
        git

USER 1000:1000
WORKDIR /app

# Change some folders for fixing permission denied errors since we are not running as root.
ENV \
    GOOS="linux" \
    GOARCH="amd64" \
    CGO_ENABLED=0 \
    GOCACHE=/tmp/.cache/go-build \
    GOMODCACHE=/tmp/.cache/go-mod \
    GOPATH=/go
#      XDG_CACHE_HOME=/tmp/.gocache

RUN go get github.com/pilu/fresh

ENV \
    GOPATH=/app

EXPOSE $APP_PORT


## Run tests for good measure.
#FROM builder AS test
#COPY . .
#RUN \
#    go test


# The actual build step.
# FROM test AS build
FROM builder AS build

WORKDIR /app/src

COPY go.mod go.sum ./
RUN \
    go mod download

COPY . .
RUN \
    go build -ldflags="-w -s" -o /tmp/build/cardsagainst . \
    && chmod +x /tmp/build/cardsagainst


# This runs in prod.
FROM scratch AS prod

LABEL maintainer=mhavelant

USER 1000:1000
EXPOSE $APP_PORT

COPY --from=build /tmp/build/cardsagainst /app/cardsagainst
COPY --from=build /app/src/templates /app/templates
COPY --from=build /app/src/assets /app/assets

ENTRYPOINT ["/app/cardsagainst"]
