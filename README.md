# InfraOps: AI-Powered Microsoft Infrastructure Monitoring

A hands-on infrastructure operations lab combining Windows Server administration, PowerShell automation, event-log analysis, rule-based incident assessment, and Power BI reporting.

![Power BI Dashboard](dashboard/screenshots/InfraOps-Dashboard.png)

## Overview

**InfraOps** is a local proof-of-concept designed to demonstrate how IT teams can collect infrastructure health information, investigate Windows events, prioritize incidents, and communicate findings through a dashboard.

The project uses a virtualized Microsoft environment and a PowerShell-based analysis engine to process a sample incident dataset and produce recommendations.

> **Project status:** Local prototype. Azure Monitor and Log Analytics integration is planned but not deployed. The current analysis uses predefined rules rather than a generative AI model.

## Architecture

![InfraOps Architecture Overview](dashboard/InfraOps-Architecture.png)

1. **Infrastructure:** Windows Server 2022, Active Directory Domain Services, DNS, DHCP, a Windows file server, and a Windows 11 domain-joined client.
2. **Automation:** PowerShell scripts for Active Directory inventory, disabled-account reporting, and server health checks.
3. **Monitoring:** Windows event-log exports and a baseline summary across three lab systems.
4. **Incident analysis:** Rule-based incident scoring and recommendations for DNS, time synchronization, and domain-join findings.
5. **Visualization:** Power BI report with incident counts, priority scores, affected servers, and recommended actions.

## Technology Stack

- Windows Server 2022 and Windows 11
- Active Directory Domain Services
- DNS and DHCP
- PowerShell
- Windows Event Viewer and `Get-WinEvent`
- Power BI Desktop
- Kusto Query Language (KQL) templates for potential Azure Monitor / Log Analytics investigations
- VMware Workstation

## Sample Results

The current sample dataset contains three documented findings:

| Incident | System | Category | Priority |
|---|---|---|---|
| INC-001 | DC01 | DNS | Medium |
| INC-002 | DC01 | Time Synchronization | Medium |
| INC-003 | FILE01 | Domain Join | Medium |

The dashboard summarizes **3 sample incidents across 2 servers**, with **0 incidents classified as High priority** by the current analysis.

These are prototype results, not live production monitoring data.

## Repository Structure

```text
.
├── README.md
├── scripts/
│   ├── InfraOps-AI-Analysis.ps1
│   └── InfraOps-IncidentScoring.ps1
├── data/
│   └── sample/
│       └── InfraOps-Incidents.json
├── queries/
│   └── kql/
│       ├── InfraOps-TopEvents.kql
│       ├── InfraOps-SeveritySummary.kql
│       ├── InfraOps-DNS-TimeInvestigation.kql
│       ├── InfraOps-ServerComparison.kql
│       └── InfraOps-EventTimeline.kql
├── reports/
│   └── documentation/
│       ├── InfraOps-Monitoring-Baseline.txt
│       ├── InfraOps-Incident-Analysis.txt
│       ├── InfraOps-AI-Incident-Assessment.txt
│       └── InfraOps-Incident-Scoring.txt
└── dashboard/
    ├── InfraOps-Monitoring-Dashboard.pbix
    └── screenshots/
        └── InfraOps-Dashboard.png
```

*The file tree illustrates the intended layout. Confirm the exact filenames in GitHub and adjust this list if your uploaded names differ.*

## How to Explore the Project

1. Review `reports/documentation/InfraOps-Monitoring-Baseline.txt` for the monitoring baseline.
2. Review `data/sample/InfraOps-Incidents.json` for the sample incident records.
3. Explore `scripts/InfraOps-AI-Analysis.ps1` to understand the rule-based analysis and recommendation logic.
4. Browse `queries/kql/` for query templates.
5. View `dashboard/screenshots/InfraOps-Dashboard.png` or open the Power BI `.pbix` file in Power BI Desktop.

## Limitations and Future Work

- Incident assessment currently uses predefined PowerShell rules; it is not generative AI.
- The prototype processes local sample data rather than a live monitoring stream.
- KQL templates have not been validated against a live Log Analytics workspace.
- Azure Monitor integration, automated refresh, and advanced anomaly detection remain future enhancements.
- The incident scoring model can be refined with configurable weights and more validation scenarios.

## Disclaimer

This repository is intended for educational and portfolio use. The sample results are illustrative and should not be treated as production incident-response guidance. No credentials or sensitive infrastructure logs should be committed to the repository.
