FROM alpine:3.12.0

# Install build tools
RUN apk add --no-cache --virtual .build-deps                         \
        build-base                                                   \
        pcre-dev                                                     \
        wget                                                         \
        zlib-dev                                                     \
        zlib-static


ARG VERSION
ENV VERSION ${VERSION:-1.19.2}

# Retrieve and verify Nginx source
RUN wget -q http://nginx.org/download/nginx-${VERSION}.tar.gz   
    
# Extract archive
RUN tar xf nginx-${VERSION}.tar.gz                               

RUN cd nginx-${VERSION} && ./configure --with-ld-opt="-static" --with-http_sub_module                                   
        
RUN cd nginx-${VERSION} &&  make install    

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

RUN rm -rf /var/cache/apk/*  && rm -rf /tmp/*                                                                   

RUN apk update  

RUN apk del .build-deps

RUN rm nginx-${VERSION}.tar.gz

RUN rm -r nginx-${VERSION}

 