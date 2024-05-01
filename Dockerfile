FROM golang:1.22.2 as BUILDER

WORKDIR /app
COPY hello.go .
COPY go.mod .

RUN go build -o GoDockerImage .

FROM scratch

COPY --from=BUILDER /app/GoDockerImage ./GoDockerImage

CMD [ "./GoDockerImage" ]