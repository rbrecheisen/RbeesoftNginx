# RbeesoftNginx
NGINX reverse proxy for all Rbeesoft apps


# Workflow

Step 1 - So what needs to happen? First you need to deploy everything to the remote VPS
and run everything. This should startup the nginx container but also pull the
app images from DockerHub.

Step 2
- Build a new app image, e.g., version 0.0.2, using the app project
- Add a test service for the app to the nginx docker-compose. It should refer to
  the new image version. The test service uses the same postgres service.
- Add a test upstream and server block to nginx.conf which refers to the subdomain
  test.rbeesoft-apps.nl
- When new app version works correctly, update original app service in the nginx 
  docker-compose to point to the new image version. Optionally, delete the "test"
  service from docker-compose