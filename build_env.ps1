$env:ASPNETCORE_URLS="http://*:8080"
dotnet build "BlazorApp.csproj" -c Development
dotnet publish "BlazorApp.csproj" -c Development
Start-Job -ScriptBlock {
    Start-Process "dotnet" -ArgumentList "C:\Users\Administrator\blazor_app_demo\bin\Development\net8.0\BlazorApp.dll" -NoNewWindow
}
