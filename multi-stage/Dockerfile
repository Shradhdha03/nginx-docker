FROM alpine:3.12.0 AS build

# Install build tools
RUN apk add --no-cache --virtual .build-deps                         \
        build-base                                                   \
        pcre-dev                                                     \
        wget                                                         \
        zlib-dev                                                     \
        zlib-static

# Define build argument for version
ARG VERSION
ENV VERSION ${VERSION:-1.19.2}

# Retrieve and verify Nginx source
RUN wget -q http://nginx.org/download/nginx-${VERSION}.tar.gz   
    
# Extract archive
RUN tar xf nginx-${VERSION}.tar.gz 

# Build and install nginx
RUN cd /nginx-${VERSION} && ./configure                              \
        --with-ld-opt="-static"                                      \
        --with-http_sub_module                                    && \
    make install                                                

FROM alpine:3.12.0

WORKDIR /usr/local/nginx/html

# Customise static content, and configuration
COPY --from=build /usr/local/nginx /usr/local/nginx

# Customise static content, and configuration
COPY index.html /usr/local/nginx/html/
COPY nginx.conf /usr/local/nginx/conf/

# Symlink access and error logs 
RUN ln -sf /dev/stdout /usr/local/nginx/logs/access.log           && \
    ln -sf /dev/stderr /usr/local/nginx/logs/error.log

# Change default stop signal from SIGTERM to SIGQUIT
STOPSIGNAL SIGQUIT

# Expose port
EXPOSE 80

# Start nginx
CMD ["/usr/local/nginx/sbin/nginx", "-g", "daemon off;"]