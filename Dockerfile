FROM alpine:latest

run apk add --no-cache tzdata ffmpeg inotify-tools

COPY ./docker-ffmpeg /bin/docker-ffmpeg
RUN chmod +x /bin/docker-ffmpeg

COPY ./docker-ffmpeg-watcher /bin/docker-ffmpeg-watcher
RUN chmod +x /bin/docker-ffmpeg-watcher

ENV INPUT_STREAM=""
ENV OUTPUT_PREFIX=Stream
ENV SEGMENT_TIME=300
ENV SEGMENT_FORMAT=mp4

VOLUME /output

ENTRYPOINT ["/bin/docker-ffmpeg"]
