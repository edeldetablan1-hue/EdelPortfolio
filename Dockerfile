# Step 1: Gamitin ang .NET 8 SDK para i-build ang Blazor app
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /src
COPY . .
RUN dotnet publish -c Release -o /app/release

# Step 2: Gamitin ang Nginx para i-serve ang static files
FROM nginx:alpine
COPY --from=build /app/release/wwwroot /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]