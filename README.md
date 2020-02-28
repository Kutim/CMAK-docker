# CMAK 的docker封装
对  https://github.com/yahoo/CMAK 的 docker 封装


## Configuration

The minimum configuration is the zookeeper hosts which are to be used for CMAK (pka kafka manager) state. This can be found in the application.conf file in conf directory. 

use the environment variable ZK_HOSTS
```
ZK_HOSTS="my.zookeeper.host.com:2181,other.zookeeper.host.com:2181"
```


## Authenticating

use the environment variable 
```
KAFKA_MANAGER_AUTH_ENABLED=true
KAFKA_MANAGER_USERNAME=XXXX
KAFKA_MANAGER_PASSWORD=xxxx
```
