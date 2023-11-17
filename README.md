# Azure DevOps User Permissions Audit Script

This script is designed to audit user permissions in Azure DevOps Online (ADO) repositories. It runs in the Windows Subsystem for Linux (WSL) on a Windows 11 machine. The script lists users who have both READ and CONTRIBUTE permissions to any repository in a specified Azure DevOps project.

## Prerequisites

Before running the script, ensure the following prerequisites are met:

- Windows Subsystem for Linux (WSL): Installed on your Windows 11 machine.
- Azure DevOps Personal Access Token (PAT): A PAT with permissions to access repositories and permissions data in Azure DevOps. Create a PAT in Azure DevOps.
- `jq`` Utility: Installed in WSL for JSON parsing. Install it using:

```bash
sudo apt-get install jq
```

## Setup

Download the Script: Download or create the script file ado-audit.sh on your system.

Modify the Script:

1. Open the script in a text editor.
2. Replace `YourOrganization`, `YourProject`, and `YourPersonalAccessToken` with your actual Azure DevOps details.
3. Make the Script Executable:

```bash
chmod +x ado-audit.sh
```

## Usage

Run the script from within WSL:

```bash
./ado-audit.sh
```

The script will output the names of users with **READ** and **CONTRIBUTE** permissions for each repository in the specified Azure DevOps project.

## Note

- The script assumes a basic Azure DevOps setup. If your organization has a more complex setup, you may need to modify the script accordingly.
- Ensure that the PAT provided has adequate permissions to avoid unauthorized access errors.
- The performance and response time of the script depend on the number of repositories in your Azure DevOps project.