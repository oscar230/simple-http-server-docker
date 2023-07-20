FROM rust:1-alpine as builder
WORKDIR /usr/src/simple-http-server
COPY . .
RUN cargo install --path .

FROM alpine:3
COPY --from=builder /usr/local/cargo/bin/simple-http-server /usr/local/bin/simple-http-server
CMD ["simple-http-server"]
