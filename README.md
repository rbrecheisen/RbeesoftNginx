# RbeesoftNginx
NGINX reverse proxy for all Rbeesoft apps


# Workflow

Step 1 - So what needs to happen? First you need to deploy everything to the remote VPS
and run everything. This should startup the nginx container but also pull the
app images from DockerHub.

Step 2 - Build a new app image, e.g., version 0.0.2, using the app project. Then add a
new service to the nginx docker-compose called <app_name>-backend-new. It should refer
to the new version image. You can leave the postgres database the same. To be able to 
access the new service using nginx, you need to update nginx.conf as well and add a new
server block for the new service. Problem is that the <app_name>.rbeesoft-apps.nl domain
name points to the new service right away. We don't want that. How do we deal with that?