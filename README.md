Hi. This is docker image with postgresql 9.3, nginx, phppgadmin, and DB of country numbers.

To pull it run "sudo docker pull steblyuk/production"
to start it run "sudo docker run -it -d steblyuk/production /bin/bash" , then "sudo docker ps", Take id od running container, and run command "sudo docker exec -it <container_id> bash"
To look all table in terminal enter next command sh /home/test_task/countryInfo.sh
