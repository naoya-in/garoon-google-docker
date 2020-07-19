FROM openjdk:8-jre
MAINTAINER NAOYA INOUE

# インストール
RUN apt-get update && apt-get install -y \
  busybox-static \
  && apt-get clean

# タイムゾーン設定
ENV TZ=Asia/Tokyo

# crontabファイルをコピー
COPY crontab /var/spool/cron/crontabs/root

# busybox crond -f -L /dev/stderr
CMD ["busybox", "crond", "-f", "-L", "/dev/stderr"]