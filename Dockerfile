FROM golang

# Fetch dependencies
RUN go get github.com/tools/godep

# Add project directory to Docker image.
ADD . /go/src/github.com/haysprevost/dummy_dash

ENV USER wprevost
ENV HTTP_ADDR :8888
ENV HTTP_DRAIN_INTERVAL 1s
ENV COOKIE_SECRET 1I5-fcbVhSh96eQv

# Replace this with actual PostgreSQL DSN.
ENV DSN postgres://wprevost@localhost:5432/dummy_dash?sslmode=disable

WORKDIR /go/src/github.com/haysprevost/dummy_dash

RUN godep go build

EXPOSE 8888
CMD ./dummy_dash