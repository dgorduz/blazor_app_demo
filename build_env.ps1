$env:ASPNETCORE_URLS="http://*:8080"

# Start the dotnet build process in the background
$buildJob = Start-Job -RunAs32 -ScriptBlock {
    Start-Process "dotnet" -ArgumentList "build", "BlazorApp.csproj", "-c", "Development" -NoNewWindow -PassThru
}

# Wait for the build process to complete and retrieve the job result
$null = Receive-Job $buildJob

# Start the dotnet publish process in the background
$publishJob = Start-Job -RunAs32 -ScriptBlock {
    Start-Process "dotnet" -ArgumentList "publish", "BlazorApp.csproj", "-c", "Development" -NoNewWindow -PassThru
}

# Wait for the publish process to complete and retrieve the job result
$null = Receive-Job $publishJob

# Start the dotnet BlazorApp.dll process in the background
$appJob = Start-Job -RunAs32 -ScriptBlock {
    Start-Process "dotnet" -ArgumentList "C:\Users\Administrator\blazor_app_demo\bin\Development\net8.0\BlazorApp.dll" -NoNewWindow -PassThru
}

# Save the job information to be able to stop the process later
$jobs = @($buildJob, $publishJob, $appJob)
$jobs | Format-Table -AutoSize | Out-File -FilePath "C:\Users\Administrator\blazor_app_demo\jobs.txt"

# Optionally, you can close the PowerShell session, and the background jobs will continue