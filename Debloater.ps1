# Full Windows Gaming Optimization Script by Taha Laachari

# Define tasks with descriptions and actions
$tasks = @(
    @{Name='Disable Startup Apps'; Action={Get-CimInstance Win32_StartupCommand | Remove-CimInstance -ErrorAction Stop}},
    @{Name='Set Processor Scheduling'; Action={Set-ItemProperty -Path 'HKLM:\\SYSTEM\\CurrentControlSet\\Control\\PriorityControl' -Name Win32PrioritySeparation -Value 26 -ErrorAction Stop}},
    @{Name='Enable Performance Mode'; Action={REG ADD 'HKCU\\Software\\Microsoft\\Windows\\CurrentVersion\\Explorer\\VisualEffects' /V VisualFXSetting /T REG_DWORD /D 2 /F | Out-Null}},
    @{Name='Disable Fast Startup'; Action={REG ADD 'HKLM\\SYSTEM\\CurrentControlSet\\Control\\Session Manager\\Power' /V HiberbootEnabled /T REG_DWORD /D 0 /F | Out-Null}},
    @{Name='Enable No GUI Boot'; Action={bcdedit /set quietboot on | Out-Null}},
    @{Name='Set Boot Timeout 10s'; Action={bcdedit /timeout 10 | Out-Null}},
    @{Name='Max Processors on Boot'; Action={bcdedit /set numproc $(Get-WmiObject Win32_Processor).NumberOfLogicalProcessors | Out-Null}},
    @{Name='Debloat Windows 11'; Action={& ([scriptblock]::Create((irm "https://debloat.raphi.re/"))) -RunDefaults -Silent}},
    @{Name='Install Brave Browser'; Action={winget install Brave.Brave -e --accept-source-agreements | Out-Null}},
    @{Name='Remove Teams and Bloatware'; Action={winget uninstall \"Microsoft Teams\"; winget uninstall Cortana | Out-Null}},
    @{Name='Move Taskbar Icons to Center'; Action={REG ADD 'HKCU\\Software\\Microsoft\\Windows\\CurrentVersion\\Explorer\\Advanced' /V TaskbarAl /T REG_DWORD /D 1 /F | Out-Null}},
    @{Name='Reduce Search Button Size'; Action={REG ADD 'HKCU\\Software\\Microsoft\\Windows\\CurrentVersion\\Search' /V SearchboxTaskbarMode /T REG_DWORD /D 1 /F | Out-Null}},
    @{Name='Update Drivers and Packages'; Action={winget upgrade --all --accept-source-agreements | Out-Null}},
    @{Name='Disable Hibernate'; Action={powercfg /hibernate off}},
    @{Name='Set High Performance Power Plan'; Action={powercfg -setactive SCHEME_MIN}},
    @{Name='Disable Windows Tips'; Action={REG ADD "HKCU\\Software\\Microsoft\\Windows\\CurrentVersion\\ContentDeliveryManager" /V SubscribedContent-338389Enabled /T REG_DWORD /D 0 /F}}
)

# Initialize variables
$totalTasks = $tasks.Count
$completedTasks = 0
$errorLog = "$env:USERPROFILE\\Desktop\\optimization_errors.log"

# Clear previous error log
if (Test-Path $errorLog) { Remove-Item $errorLog }

Write-Host "Optimizing your system, please wait..." -ForegroundColor Cyan

foreach ($task in $tasks) {
    Write-Progress -Activity "Optimizing Windows" -Status "Executing: $($task.Name)" -PercentComplete (($completedTasks / $totalTasks) * 100)
    try {
        & $task.Action
        $completedTasks++
    }
    catch {
        "Error performing task '$($task.Name)': $_" | Out-File $errorLog -Append
    }
    Start-Sleep -Milliseconds 500
}

# Final progress update
$percent = [math]::Round(($completedTasks / $totalTasks) * 100)
Write-Progress -Activity "Optimizing Windows" -Completed

# Final summary
if ($completedTasks -eq $totalTasks) {
    Write-Host "Optimization complete: 100% successful!" -ForegroundColor Green
}
else {
    Write-Host "Optimization finished: $percent% successful. Check the log at:`n$errorLog" -ForegroundColor Yellow
    Write-Host "Visit https://docs.microsoft.com/ for manual fixes." -ForegroundColor Yellow
}

Write-Host "Press Enter to exit..."
Read-Host
