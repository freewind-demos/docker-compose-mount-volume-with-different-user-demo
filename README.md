Docker Compose Mount Volume with Different User Demo
===================

有时候需要让docker container里的文件有一个不同的owner，以便里面的服务使用不同的username执行（比如apache/mysql等）

但是在宿主机上文件的用户名很可能不是docker container里需要的，docker也没有提供一种方式让我们在mount volume的时候指定用户名。

虽然我们可以在docker container中，调用`chown`来手动改变目标目录，但是这可能会同时修改宿主机上的目录属性。

我想寻找一种完全不影响宿主机的做法，但是没找到。

这里有一个办法，但是我这里不起作用：
https://devops.stackexchange.com/questions/4540/how-to-change-the-owner-of-volume-directory-in-dockerfile

最后我找到确定有用的办法还是在container启动之后用chown来改（可以放在docker-compose.yml中的command里）

注意：要特别注意docker volume比较绕，有时候可能影响结果，所以运行之前，要确保没有已存在的volume影响。
可使用`docker-compose down -v`（-v表示remove volumes），以及`docker volume prune`等删除不需要的volume

```
docker-compose up
```

运行完之后，从mac宿主机上看`ls -al`

```
drwxr-xr-x@    3 peng.li  staff    96B Feb 10 23:53 data/
```

可以看到权限后多了一个`@`，它是mac上特有的文件扩展属性，可以用`xattr -cr ./data`去除
