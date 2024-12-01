server {
    listen 80;
    server_name localhost;
    root /usr/share/nginx/html;
    location / {
        try_files $uri /index.html;
    }
 
    # Additional Nginx configurations (e.g., SSL, caching, etc.) can go here
}