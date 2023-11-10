FROM golang:1.21 as builder

WORKDIR /app

COPY ./main.go .

RUN go build -o /bin/fullcycle ./main.go

FROM scratch

COPY --from=builder /bin/fullcycle /bin/fullcycle

CMD ["/bin/fullcycle"]