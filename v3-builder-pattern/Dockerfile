FROM alpine:3

WORKDIR /usr/local/nginx/html

# Customise static content, and configuration
COPY /nginx-extract /usr/local/nginx

# Customise static content, and configuration
COPY index.html /usr/local/nginx/html/
COPY nginx.conf /usr/local/nginx/conf/

# Symlink access and error logs 
RUN ln -sf /dev/stdout /usr/local/nginx/logs/access.log            && \
    ln -sf /dev/stderr /usr/local/nginx/logs/error.log

# Change default stop signal from SIGTERM to SIGQUIT
STOPSIGNAL SIGQUIT

# Expose port
EXPOSE 80

# Start nginx
CMD ["/usr/local/nginx/sbin/nginx", "-g", "daemon off;"]