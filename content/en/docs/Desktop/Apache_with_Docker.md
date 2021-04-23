---
title: "Install Apache webserver"
linkTitle: "Install Apache webserver"
weight: 100
description: >-
     Installing Apache webserver using Docker
---

Create the webserver documentroot in your homedir
```bash
$ mkdir website
```
### Install Apache container
Now we pull the httpd:2.4 container from dockerhub and map the documentroot to our just created directory
```bash
$ sudo docker run -dit --name my-web -p 8080:80 -v ~/website/:/usr/local/apache2/htdocs/ httpd:2.4
```
We use docker ps to confirm our container is running
```bash
$ sudo docker ps
CONTAINER ID        IMAGE               COMMAND              CREATED             STATUS              PORTS                  NAMES
e837d58776cd        httpd:2.4           "httpd-foreground"   18 seconds ago      Up 16 seconds       0.0.0.0:8080->80/tcp   my-web
```
### Create a simple homepage
Add index.html to our documentroot 
```bash
cat <<EOF >>/website/index.html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>My website rocks!</title>
</head>
<body>
    <h1>Welcome to my homepage!</h1>
</body>
</html>
EOF
```
And we are done! To view the result simply open http://localhost:8080/ in your webbrowser!

### Stop the container
```bash
$ sudo docker stop my-web
```
### Remove the container
```bash
$ sudo docker rm my-web
```
### Remove the dockerhub image
```bash
$ sudo docker image remove httpd:2.4
```
### References
- [TecMint](https://www.tecmint.com/install-apache-web-server-in-a-docker-container/)
