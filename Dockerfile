FROM mcr.microsoft.com/dotnet/sdk:3.1
RUN apt-get update -yq \
    && apt-get install curl gnupg -yq \
    && curl -sL https://deb.nodesource.com/setup_10.x | bash \
    && apt-get install nodejs -yq
COPY . /app
WORKDIR /app
RUN dotnet build
WORKDIR /app/DotnetTemplate.Web
RUN npm install && npm run build
EXPOSE 5000/tcp
CMD ["dotnet", "run"]