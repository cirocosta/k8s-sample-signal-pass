FROM golang:alpine AS base

	COPY . .
	RUN go build -v \
		-ldflags '-w -extldflags "-static"' \
		-o /usr/local/bin/sample-signal-pass


FROM alpine AS final-with-signal-defined

	COPY --from=base \
		/usr/local/bin/sample-signal-pass \
		/usr/local/bin/sample-signal-pass

	STOPSIGNAL SIGUSR2

FROM alpine AS final-without-signal-defined

	COPY --from=base \
		/usr/local/bin/sample-signal-pass \
		/usr/local/bin/sample-signal-pass
