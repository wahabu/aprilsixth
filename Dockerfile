FROM mcr.microsoft.com/dotnet/sdk:7.0 AS build

WORKDIR /app

COPY *.csproj ./
RUN dotnet restore

COPY . ./
RUN dotnet publish --configuration release --output out

FROM mcr.microsoft.com/dotnet/aspnet:7.0

WORKDIR /pub

COPY --from=build /app/out ./

ENTRYPOINT [ "dotnet", "aprildemo.dll" ]
