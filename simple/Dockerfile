FROM mynginx:1.0

# Change default stop signal from SIGTERM to SIGQUIT
STOPSIGNAL SIGQUIT

# Expose port
EXPOSE 80


CMD ["/usr/local/nginx/sbin/nginx", "-g", "daemon off;"]
 