Docker Compose Mount Volume with Different User Demo
===================

有时候需要让docker container里的文件有一个不同的owner，以便里面的服务使用不同的username执行（比如apache/mysql等）

但是在宿主机上文件的用户名很可能不是docker container里需要的，docker也没有提供一种方式让我们在mount volume的时候指定用户名。

我们需要在Dockerfile里增加一条`chown`命令修改owner，比较好的地方在于，它只对docker container有效，并不会修改宿主机上的owner。

```
docker-compose up
```
