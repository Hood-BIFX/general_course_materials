import requests
import time
from opsecrets import op

# --- Configuration ---
# Replace with your actual GitHub Personal Access Token
GITHUB_TOKEN = op("Private", "Github", "CLtoken")

# Authentication headers required by GitHub's REST API
HEADERS = {
    'Authorization': f'token {GITHUB_TOKEN}',
    'Accept': 'application/vnd.github+json',
    'X-GitHub-Api-Version': '2022-11-28'
}

ORG_NAME = 'BIFX5xx-yy'
TEMPLATE_REPO = '<repo-name>'

# List of your students' exact GitHub usernames
STUDENT_USERNAMES = [
    'student1_gh', 
    'student2_gh'
]

def create_student_repos(students):
    for student in students:
        new_repo_name = f"{TEMPLATE_REPO}-{student}"
        print(f"Creating repository {ORG_NAME}/{new_repo_name} from template...")
        
        # 1. Create repository from template
        create_url = f"https://api.github.com/repos/{ORG_NAME}/{TEMPLATE_REPO}/generate"
        create_payload = {
            "owner": ORG_NAME,
            "name": new_repo_name,
            "description": f"BIFX551 submission repository for {student}",
            "private": True # Keeps student work hidden from each other
        }
        
        response = requests.post(create_url, headers=HEADERS, json=create_payload)
        
        if response.status_code == 201:
            print(f"  [Success] Created {new_repo_name}.")
        else:
            print(f"  [Error] Failed to create {new_repo_name}: {response.json()}")
            continue # Skip adding the collaborator if the repo doesn't exist
            
        # Give GitHub's backend a brief moment to initialize the repository tree
        time.sleep(2)
        
        # 2. Add student as an admin (owner-equivalent for organization repos)
        print(f"  Adding {student} to {new_repo_name}...")
        collab_url = f"https://api.github.com/repos/{ORG_NAME}/{new_repo_name}/collaborators/{student}"
        collab_payload = {
            "permission": "admin"
        }
        
        collab_response = requests.put(collab_url, headers=HEADERS, json=collab_payload)
        
        if collab_response.status_code == 201:
            print(f"  [Success] Added {student}. An invitation email has been sent.")
        elif collab_response.status_code == 204:
             print(f"  [Info] {student} is already a collaborator on {new_repo_name}.")
        else:
            print(f"  [Error] Failed to add {student}: {collab_response.json()}")
            
        print("-" * 50)

if __name__ == '__main__':
    create_student_repos(STUDENT_USERNAMES)
