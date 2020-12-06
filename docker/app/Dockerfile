ARG BASE_IMAGE
ARG BASE_IMAGE_TAG
ARG APP_PORT

# Builder image for setting common things for dev.
FROM $BASE_IMAGE:${BASE_IMAGE_TAG} AS builder

USER 1000:1000
EXPOSE $APP_PORT

# Change some folders for fixing permission denied errors since we are not running as root.
ENV \
    GOOS="linux" \
    GOARCH="amd64" \
    CGO_ENABLED=0 \
    GOCACHE=/tmp/.cache/go-build \
    GOMODCACHE=/tmp/.cache/go-mod \
    GOPATH=/app
#      XDG_CACHE_HOME=/tmp/.gocache

WORKDIR /app


## Run tests for good measure.
#FROM builder AS test
#COPY . .
#RUN \
#    go test


# The actual build step.
# FROM test AS build
FROM builder AS build

COPY . .
WORKDIR /app/src
RUN \
    go build -ldflags="-w -s" -o /tmp/build/cardsagainst . \
    && chmod +x /tmp/build/cardsagainst



# This runs in prod.
FROM scratch AS prod

LABEL maintainer=mhavelant

USER 1000:1000
EXPOSE $APP_PORT
COPY --from=build /tmp/build/cardsagainst /cardsagainst
ENTRYPOINT ["/cardsagainst"]
