FROM daux/daux.io AS build
ADD . /app/src
RUN daux generate --format=html --source=/app/src/docs --destination=/app/out
RUN ls /app/out

FROM nginx
COPY --from=build /app/out /usr/share/nginx/html