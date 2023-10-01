FROM golang:latest

RUN mkdir /app

ADD . /app

COPY sonar-project.properties /app

WORKDIR /app

RUN sonar-scanner -Dsonar.projectKey=GoWeb-App -Dsonar.sources=.

RUN go build -o main .

EXPOSE 8080

CMD [ "/app/main" ]
