# 使用步骤

## Docker

``` shell
 docker compose -f .\docker-compose.yml -f .\docker-compose.migrations.yml -f .\docker-compose.override.yml up -d
```

## 环境准备

* MSSQLSERVER

``` shell
  docker pull mcr.microsoft.com/mssql/server:2022-latest
  docker run -d --name mssqlserver -p 1433:1433 -e "ACCEPT_EULA=Y" -e "SA_PASSWORD=Jh@123456" -t mcr.microsoft.com/mssql/server:2022-latest
```

* Redis

```shell
  docker pull redis
  docker run -d --name redis -p 6379:6379 -v --restart always -t redis
```

## 启动项目

```shell
cd .\web\host\MyDemo.IdentityServer\ | dotnet ef database update | dotnet run

cd .\web\host\MyDemo.HttpApi.Host\ | dotnet ef database update | dotnet run 
```

``` shell
cd .\admin\ | yarn | yarn start
```
