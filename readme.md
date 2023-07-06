1. Install Vagrant (https://developer.hashicorp.com/vagrant/docs/installation)  
2. Instal VirtualBox  
3. Create Vagrantfile  
    - create infrastructure - "vagrant up"  
    - clear envairement - "vagrant destroy"   

4. Connect to postgres DB - ```psql -h 10.0.0.4 -p 5432 -U postgres```, pass - "mysecretpassword"  

Connect to VN - "vagrant ssh", "vagrant ssh-config".  
vagrant status  

Result  
```
CONTAINER ID   IMAGE             COMMAND                  CREATED          STATUS          PORTS                                       NAMES
4b174d5c6df7   postgres:latest   "docker-entrypoint.s…"   24 minutes ago   Up 24 minutes   0.0.0.0:5432->5432/tcp, :::5432->5432/tcp   postgres-latest
vagrant@ubuntu:~$ docker exec -it 4b174d5c6df7  bash
root@4b174d5c6df7:/# psql -U postgres
psql (15.3 (Debian 15.3-1.pgdg120+1))                                                                                                                      pos
Type "help" for help.

postgres=# CREATE DATABASE test;
CREATE DATABASE
postgres=# \q  
root@4b174d5c6df7:/# 
```

