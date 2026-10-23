# 5주차 : 도커
## `docker --version` 출력 결과
```
Client:
 Version:    29.8.1
 Context:    default
 Debug Mode: false
 (정말 매우 매우 길어서 후략...)
```
## `docker run hello-world` 실행 시 출력 결과
```
Hello from Docker!
This message shows that your installation appears to be working correctly.

To generate this message, Docker took the following steps:
 1. The Docker client contacted the Docker daemon.
 2. The Docker daemon pulled the "hello-world" image from the Docker Hub.
    (amd64)
 3. The Docker daemon created a new container from that image which runs the
    executable that produces the output you are currently reading.
 4. The Docker daemon streamed that output to the Docker client, which sent it
    to your terminal.

To try something more ambitious, you can run an Ubuntu container with:
 $ docker run -it ubuntu bash

Share images, automate workflows, and more with a free Docker ID:
 https://hub.docker.com/

For more examples and ideas, visit:
 https://docs.docker.com/get-started/
```
## 컨테이너 세 개를 각각 다른 포트로 실행한 후, curl로 세 페이지를 확인한 결과
```
HTTP/1.1 200 OK
Server: nginx/1.31.6
Date: Thu, 01 Oct 2026 03:23:52 GMT
Content-Type: text/html
Content-Length: 897
Last-Modified: Thu, 01 Oct 2026 03:17:04 GMT
Connection: keep-alive
ETag: "6abdd0b0-381"
Accept-Ranges: bytes
```
```
HTTP/1.1 200 OK
Server: nginx/1.31.6
Date: Thu, 01 Oct 2026 03:23:57 GMT
Content-Type: text/html
Content-Length: 897
Last-Modified: Thu, 01 Oct 2026 03:19:39 GMT
Connection: keep-alive
ETag: "6abdd14b-381"
Accept-Ranges: bytes
```
```
HTTP/1.1 200 OK
Server: nginx/1.31.6
Date: Thu, 01 Oct 2026 03:24:00 GMT
Content-Type: text/html
Content-Length: 897
Last-Modified: Thu, 01 Oct 2026 03:20:28 GMT
Connection: keep-alive
ETag: "6abdd17c-381"
Accept-Ranges: bytes
```
