
$ProjectPath = $PSScriptRoot
$InputPath = Join-Path $ProjectPath "InfraOps-Incidents.json"
$OutputPath = Join-Path $ProjectPath "InfraOps-AI-Analysis.txt"
$CsvPath = Join-Path $ProjectPath "InfraOps-AI-Analysis.csv"

if (-not (Test-Path $InputPath)) {
    Write-Host "Input file not found: $InputPath" -ForegroundColor Red
    exit 1
}

$Data = Get-Content $InputPath -Raw | ConvertFrom-Json

$CsvResults = @()
$Report = @()
$Report += "InfraOps - Incident Analysis"
$Report += "Generated: $(Get-Date)"
$Report += "Environment: $($Data.environment)"
$Report += ""

foreach ($Incident in $Data.incidents) {
    $Score = 0

    if ($Incident.severity -eq "Error") {
        $Score += 3
    } elseif ($Incident.severity -eq "Warning") {
        $Score += 2
    }

    if ($Incident.frequency -ge 8) {
        $Score += 2
    } elseif ($Incident.frequency -ge 3) {
        $Score += 1
    }

    $Recommendation = switch ($Incident.category) {
        "DNS" { "Monitor DNS timeouts and investigate if they recur." }
        "Time Synchronization" { "Review domain time-source configuration and peer status." }
        "Domain Join" { "No immediate repair; monitor for current authentication failures." }
        default { "Investigate the event and validate the current state." }
    }

    $Priority = if ($Score -ge 5) {
        "High"
    } elseif ($Score -ge 4) {
        "Medium"
    } else {
        "Low"
    }

    $Report += "Incident: $($Incident.id)"
    $Report += "Server: $($Incident.server)"
    $Report += "Category: $($Incident.category)"
    $Report += "Event ID: $($Incident.event_id)"
    $Report += "Priority score: $Score"
    $Report += "Priority: $Priority"
    $Report += "Finding: $($Incident.finding)"
    $Report += "Validation: $($Incident.validation)"
    $Report += "Recommendation: $Recommendation"
    $CsvResults += [PSCustomObject]@{
    Incident = $Incident.id
    Server = $Incident.server
    Category = $Incident.category
    EventID = $Incident.event_id
    Score = $Score
    Priority = $Priority
    Recommendation = $Recommendation
}
    $Report += ("-" * 60)
}

$Report | Set-Content $OutputPath
$CsvResults | Sort-Object Score -Descending | Export-Csv $CsvPath -NoTypeInformation
$Report
Write-Host "Text report saved to: $OutputPath" -ForegroundColor Green
Write-Host "CSV report saved to: $CsvPath" -ForegroundColor Green
