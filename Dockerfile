FROM mcr.microsoft.com/dotnet/sdk:3.1 as dotnetImage
COPY . /app
WORKDIR /app
RUN dotnet build

FROM node as nodeImage
COPY --from=dotnetImage /app /app
WORKDIR /app/DotnetTemplate.Web
RUN npm install && npm run build
EXPOSE 5000/tcp
CMD ["dotnet", "run"]