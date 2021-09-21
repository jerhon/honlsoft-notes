FROM squidfunk/mkdocs-material:7.2.8 as build
ADD mkdocs.yml mkdocs.yml
ADD docs docs
RUN mkdocs build

FROM nginx:1.21.3-alpine
COPY --from=build /docs/site /usr/share/nginx/html