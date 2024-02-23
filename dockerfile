FROM golang:alpine AS build
WORKDIR /app
COPY . .
RUN go mod init fullcycle-rocks
RUN go build -o fullcycle-rocks .

FROM scratch
WORKDIR /
COPY --from=build /app/fullcycle-rocks /fullcycle-rocks
CMD ["/fullcycle-rocks"]
