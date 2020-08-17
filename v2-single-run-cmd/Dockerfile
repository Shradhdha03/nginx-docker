FROM alpine:3


ARG VERSION
ENV VERSION ${VERSION:-1.19.2}

# Install build tools
RUN   apk add --no-cache --virtual .build-deps                                                    \
        build-base                                                                              \
        pcre-dev                                                                                \
        wget                                                                                    \
        zlib-dev                                                                                \
        zlib-static                                                                     &&      \
                                                                                                \
# Retieve and unpack nginx source
        TMP="$(mktemp -d)"  && cd "$TMP"                                                &&      \                                                                                       
        wget -q http://nginx.org/download/nginx-${VERSION}.tar.gz                       &&      \ 
        tar xf nginx-${VERSION}.tar.gz                                                  &&      \ 
                                                                                                \
# Build and install nginx
        cd nginx-${VERSION}                                                             &&      \
        ./configure --with-ld-opt="-static" --with-http_sub_module                      &&      \ 
        make install                                                                    &&      \
                                                                                                \
# Clean up 
cd / && rm -rf /var/cache/apk/* && \
        rm -rf /tmp/* && \
         apk update && \
\                                                                                               
        rm -rf "$TMP"              &&      \ 
        apk del .build-deps

COPY index.html /usr/local/nginx/html/
COPY nginx.conf /usr/local/nginx/conf/

# Symlink access and error logs to /dev/stdout and /dev/stderr,
# in order to make use of Docker's logging mechanism
RUN ln -sf /dev/stdout /usr/local/nginx/logs/access.log      
RUN ln -sf /dev/stderr /usr/local/nginx/logs/error.log

# Change default stop signal from SIGTERM to SIGQUIT
STOPSIGNAL SIGQUIT

# Expose port
EXPOSE 80

CMD ["/usr/local/nginx/sbin/nginx", "-g", "daemon off;"]