FROM mcr.microsoft.com/dotnet/core/sdk:3.0-buster AS build
COPY . .

WORKDIR /host/MyDemo.IdentityServer
RUN dotnet restore
RUN dotnet ef migrations script -i -o migrations-IdentityServerHost.sql

WORKDIR /host/MyDemo.HttpApi.Host
RUN dotnet restore
RUN dotnet ef migrations script -i -o migrations-MyDemo.sql

FROM mcr.microsoft.com/mssql-tools AS final
WORKDIR /
COPY --from=build ./host/MyDemo.IdentityServer/migrations-IdentityServerHost.sql migrations-IdentityServerHost.sql
COPY --from=build ./host/MyDemo.HttpApi.Host/migrations-MyDemo.sql migrations-MyDemo.sql
COPY --from=build ./database/entrypoint.sh .
RUN /bin/bash -c "sed -i $'s/\r$//' entrypoint.sh"
RUN chmod +x ./entrypoint.sh

ENTRYPOINT ["./entrypoint.sh"]