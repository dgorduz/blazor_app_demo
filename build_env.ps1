$env:ASPNETCORE_URLS="http://*:8080"
dotnet build "BlazorApp.csproj" -c Development
dotnet publish "BlazorApp.csproj" -c Development
start dotnet C:\Users\Administrator\blazor_app_demo\bin\Development\net8.0\BlazorApp.dll
Start-Sleep -Seconds 5
