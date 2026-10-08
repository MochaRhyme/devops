# 6주차 : Dockerfile
## 내 이미지 주소
ghcr.io/mocharhyme/guestbook:v2
## 친구 이미지를 실행한 결과 캡처
같은 디렉터리에 있는 'result-image.png'에 있음
## Dockerfile의 각 줄이 하는 일을 본인의 언어로 설명
```
# 내 패키지의 기반이 되는 이미지
FROM python:3.12-slim
# 작업 경로를 컨테이너 내부 파일 시스템의 /app 폴더로 고정
WORKDIR /app
# 의존성 목록부터 복사 및 설치 (가장 덜 일어나는 의존성 업데이트를 먼저 실행해서,
# 캐싱한 레이어를 재사용하여 빌드 효율성을 높임)
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
# 나머지 파일 복사
COPY . .
# Ubuntu에 실행용 새로운 계정을 추가 및 사용
RUN useradd -m appuser
USER appuser
# 환경 변수를 통한 커스터마이징
ENV APP_TITLE="박정현의 방명록" \
    THEME_COLOR="#4692BB"
# 사용자에게 몇 번 내부 포트를 쓰는지 알리기 위한 문구
EXPOSE 5000
# 앱 실행
CMD ["python", "app.py"]
```
## 빌드 캐시가 동작한 로그
```
$ docker build -t mocharhyme/guestbook:v2 .
[+] Building 2.1s (11/11) FINISHED        docker:default
 => [internal] load build definition from Dockerfi  0.0s
 => => transferring dockerfile: 569B                0.0s
 => [internal] load metadata for docker.io/library  0.1s
 => [internal] load .dockerignore                   0.0s
 => => transferring context: 120B                   0.0s
 => [1/6] FROM docker.io/library/python:3.12-slim@  0.1s
 => => resolve docker.io/library/python:3.12-slim@  0.1s
 => [internal] load build context                   0.0s
 => => transferring context: 809B                   0.0s
 => CACHED [2/6] WORKDIR /app                       0.0s
 => CACHED [3/6] COPY requirements.txt .            0.0s
 => CACHED [4/6] RUN pip install --no-cache-dir -r  0.0s
 => [5/6] COPY . .                                  0.1s
 => [6/6] RUN useradd -m appuser                    0.6s
 => exporting to image                              0.7s
 => => exporting layers                             0.3s
 => => exporting manifest sha256:ea36ec4c3f50127fd  0.0s
 => => exporting config sha256:75f06f6554eca1cc2db  0.0s
 => => exporting attestation manifest sha256:975d1  0.1s
 => => exporting manifest list sha256:0697023da5dc  0.1s
 => => naming to docker.io/mocharhyme/guestbook:v2  0.0s
 => => unpacking to docker.io/mocharhyme/guestbook  0.1s
```
## 설정을 넣는 세 가지 방법(코드 / (Dockerfile의)ENV / (컨테이너 실행 시의)-e)의 차이 요약
### 코드
코드에서 바꾼 설정 기본값은 코드 수정 후 재빌드 시 반영됨.
### ENV
Dockerfile에서 바꾼 환경 변수는 이미지 재빌드 시 반영됨.
### -e
컨테이너 실행 시 값으로 넣어주는 값은 컨테이너 실행 시 반영됨.
