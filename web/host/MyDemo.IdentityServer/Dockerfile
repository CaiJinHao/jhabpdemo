#See https://aka.ms/containerfastmode to understand how Visual Studio uses this Dockerfile to build your images for faster debugging.

FROM mcr.microsoft.com/dotnet/aspnet:6.0 AS base
WORKDIR /app
EXPOSE 80
EXPOSE 443

FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build
WORKDIR /src
COPY ["NuGet.Config", "."]
COPY ["host/MyDemo.IdentityServer/MyDemo.IdentityServer.csproj", "host/MyDemo.IdentityServer/"]
COPY ["src/MyDemo.Application.Contracts/MyDemo.Application.Contracts.csproj", "src/MyDemo.Application.Contracts/"]
COPY ["src/MyDemo.Domain.Shared/MyDemo.Domain.Shared.csproj", "src/MyDemo.Domain.Shared/"]
COPY ["host/MyDemo.Host.Shared/MyDemo.Host.Shared.csproj", "host/MyDemo.Host.Shared/"]
RUN dotnet restore "host/MyDemo.IdentityServer/MyDemo.IdentityServer.csproj"
COPY . .
WORKDIR "/src/host/MyDemo.IdentityServer"
RUN dotnet build "MyDemo.IdentityServer.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "MyDemo.IdentityServer.csproj" -c Release -o /app/publish /p:UseAppHost=false

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "MyDemo.IdentityServer.dll"]