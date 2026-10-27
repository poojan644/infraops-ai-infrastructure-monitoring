# InfraOps: AI-Powered Microsoft Infrastructure Monitoring

A portfolio project demonstrating Microsoft infrastructure administration, PowerShell automation, Windows event-log analysis, rule-based incident assessment, and Power BI reporting.

## Project Overview

InfraOps is a local infrastructure monitoring and incident-analysis prototype built using a virtualized Windows environment. It collects selected Windows event logs, summarizes infrastructure findings, assigns incident priorities using predefined rules, and presents the results in a Power BI dashboard.

## Architecture

1. **Infrastructure Layer:** Windows Server 2022, Active Directory Domain Services, DNS, DHCP, Windows 11 client, and file server.
2. **Automation Layer:** PowerShell scripts for user inventory, disabled-account reporting, and server health snapshots.
3. **Monitoring Layer:** Windows event-log exports and incident summaries for domain controller, file server, and client workstation.
4. **Incident Analysis Layer:** PowerShell-based rule engine that scores known findings and generates recommendations.
5. **Visualization Layer:** Power BI dashboard showing incident counts, priority scores, affected servers, and recommendations.

## Technology Stack

- Windows Server 2022
- Windows 11
- Active Directory Domain Services
- DNS and DHCP
- PowerShell
- Windows Event Viewer / `Get-WinEvent`
- Power BI Desktop
- KQL query templates for a potential Azure Monitor / Log Analytics integration

## Current Prototype Findings

The sample analysis contains three documented findings:

| Incident | System | Category | Priority |
|---|---|---|---|
| INC-001 | DC01 | DNS | Medium |
| INC-002 | DC01 | Time Synchronization | Medium |
| INC-003 | FILE01 | Domain Join | Medium |

The current sample reports three incidents across two servers and zero high-priority incidents. These values describe the sample dataset, not a live production environment.

## Repository Structure

```text
infraops-ai-infrastructure-monitoring/
├── README.md
├── scripts/
│   ├── Get-ADUserInventory.ps1
│   ├── Get-DisabledAccounts.ps1
│   ├── Get-DC01HealthCheck.ps1
│   ├── Get-FILE01HealthCheck.ps1
│   └── InfraOps-AI-Analysis.ps1
├── data/
│   └── sample/
│       └── InfraOps-Incidents.json
├── queries/
│   └── kql/
├── reports/
│   └── documentation/
└── dashboard/
    └── screenshots/
```

*The folder structure will be populated as project files are reviewed and added.*

## Important Limitations

- Incident analysis currently uses predefined PowerShell rules; it is not a generative AI model.
- The prototype uses local Windows event-log exports and sample incident data.
- Azure Monitor and Log Analytics integration is not currently deployed.
- KQL files are templates and have not been validated against a live Log Analytics workspace.
- The findings are intended for demonstration and learning, not production incident response.

## Future Enhancements

- Integrate Azure Monitor and Log Analytics when an appropriate environment is available.
- Validate and execute KQL queries against ingested event data.
- Improve incident scoring with configurable severity, frequency, and recency rules.
- Expand Power BI visuals and add automated report refresh.
- Add CI checks for PowerShell scripts and repository structure.

## Disclaimer

This project is for educational and portfolio purposes. Sample data and findings are illustrative. Do not upload credentials, access tokens, private keys, or sensitive infrastructure logs.
