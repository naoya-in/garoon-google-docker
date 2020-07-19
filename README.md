
To synchronize the Garoon schedule to Google Calendar.

## Requirements

- Java 1.8

## Usage

### 1.Build
```sh
$ ./gradlew clean build copy
```

### 2.Setting
```sh
$ cp ./src/main/resources/GGsync.properties .
```

and rewrite GGsync.properties.

See also https://developer.cybozu.io/hc/ja/articles/204426680

### 3.Synchronize
```sh
$ java -jar GGsync.jar .
```

with secure access
```sh
$ java -Djavax.net.ssl.keyStore=xxxx.pfx -Djavax.net.ssl.keyStorePassword=xxxx -Djavax.net.ssl.keyStoreType=PKCS12 -jar GGsync.jar .
```

with proxy
```sh
$ java -Dhttp.proxyHost=ホスト名 -Dhttp.proxyPort=ポート番号 -Dhttps.proxyHost=ホスト名 -Dhttps.proxyPort=ポート番号 -jar GGsync.jar .
```

## License

MIT

## Copyright

Copyright(c) 2015 Cybozu, Inc.

## Docker または docker-compose
### 1. crontab ファイルを作成
```cron
*/5 * * * * java -jar /root/GGsync.jar /root/
```
#### GGsync.properties ファイル
以下のようにする
```Bash
# 秘密鍵（サービスアカウントの秘密鍵）の絶対パス
# 例）C:/GGsync/xxxxxxxxxxxx.p12
google.oauth.p12key=/root/GGsync-xxxxxxxx.p12
```
### 2. Docker build / run
```Bash
docker build -t ggsync-cron .
docker run -d -v $PWD:/root --restart=always --name ggsync-cron-1 ggsync-cron
```
### 2. docker-compose
```Bash
docker-compose up -d
```
### ログの確認
ログは標準出力しているので `docker logs` から見ることができます
```Bash
docker logs -f ggsync-cron-1
```