#!/bin/bash

# Replace these variables with your Azure DevOps details
ORGANIZATION="YourOrganization"
PROJECT="YourProject"
PAT="YourPersonalAccessToken"

# Base API URL
BASE_API_URL="https://dev.azure.com/$ORGANIZATION/$PROJECT"

# Function to fetch repositories
fetch_repos() {
    curl -s -u ":$PAT" "$BASE_API_URL/_apis/git/repositories?api-version=6.0" | jq -r '.value[].id'
}

# Function to fetch and process permissions for a repository
fetch_and_process_permissions() {
    local repo_id=$1
    local repo_permissions

    # Fetch permissions
    repo_permissions=$(curl -s -u ":$PAT" "$BASE_API_URL/_apis/permissionsreport/repositories/$repo_id?api-version=6.0-preview.1")

    # Process and output users with Read and Contribute permissions
    echo "$repo_permissions" | jq -r '.identityPermissions[] | select(.permissions.read == true and .permissions.contribute == true) | "\(.identity.displayName) has READ and CONTRIBUTE permissions in Repo ID: '$repo_id'"'
}

# Main execution
echo "Fetching repositories..."
repo_ids=$(fetch_repos)

echo "Processing permissions..."
for repo_id in $repo_ids; do
    fetch_and_process_permissions "$repo_id"
done
