Fixed bugs in task:
- update [script.sh](https://github.com/terra144481/terra144481-VM_Vagrant_Docker_Postgres/blob/29cd754e97c139885b92ce4efa11a117ea0175c7/script.sh) - delete password confirmation from thermo user, line 5  
- update [vagrantfile](https://github.com/terra144481/terra144481-VM_Vagrant_Docker_Postgres/blob/29cd754e97c139885b92ce4efa11a117ea0175c7/Vagrantfile) - add restart container after rebooting system + add thermo to docker group  
- add gitignore file





1. Install Vagrant (https://developer.hashicorp.com/vagrant/docs/installation)  
2. Instal VirtualBox  
3. Create Vagrantfile  
    - create infrastructure - ```vagrant up```  
    - clear envairement - ```vagrant destroy```  
    - ```vagrant status```
4. Create user `thermo` with existing ssh_key.  
5. Install docker and run conteiner with postgres latest version  


 Connect to postgres DB - ```psql -h 10.0.0.4 -p 5432 -U postgres```, pass - "mysecretpassword"  

Connect to VM - ```"vagrant ssh", "vagrant ssh-config"```.    
Connect as user thermo - ```ssh thermo@10.0.0.4 -i "path to id_rsa key"```  

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

