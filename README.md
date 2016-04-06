
Usage:

1) Install docker, Version 1.10 or above, eg:
   https://docs.docker.com/mac/

2) Download files from Github:
   git@github.com:ffhuber/mcomp.git

3) in terminal window, enter:
   docker-compose up -d

4) add this line to /etc/hosts file: 
   127.0.0.1 www.pulse.pearson.com

5) In Browser, enter:
   http://www.pulse.pearson.com:8080/moodle/school0/
   http://www.pulse.pearson.com:8080/moodle/school1/
   http://www.pulse.pearson.com:8080/moodle/school2/
   (Note: login credentials are on moodle dashboard)

6) Access docker container shell, eg:
   docker exec -it mcomp_mdl_1
   docker exec -it mcomp_mysql_1
   
7) Edit files temporary inside dockercontainer (with vi):
   apt-get update
   apt-get install vim
   
8) Shutdown docker with "docker-compose down"

9) Stop containers and delete images:
   docker rmi $(docker images -q)