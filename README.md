# Nginx Web Server - DevOps Automation

Automated deployment of Nginx web server on AWS using Infrastructure as Code and Configuration Management.

## 🛠 Tech Stack

- **Terraform** - infrastructure creation on AWS (EC2)
- **Ansible** - server configuration and deployment
- **Docker & Docker Compose** - Nginx containerization
- **GitHub Actions** - CI/CD pipeline

## 📁 Project Structure

```
project/
├── terraform/          # Infrastructure as Code
│   ├── main.tf         # AWS EC2 resources
│   ├── variables.tf    # Configuration variables
│   └── outputs.tf      # Output values (IP address)
│
├── ansible/            # Configuration Management
│   ├── install_docker.yml    # Docker installation
│   ├── deploy_nginx.yml      # Nginx deployment
│   └── inventory.ini         # Inventory file
│
├── nginx/              # Nginx container
│   ├── Dockerfile
│   ├── docker-compose.yml
│   ├── nginx.conf
│   └── entrypoint.sh
│
└── run.sh              # Local run script
```

## 🚀 Local Run on Computer

### Prerequisites

- Docker and Docker Compose installed

### Run

```bash
cd project/nginx
docker compose up -d
```

## 🚀 Full Infrastructure Deployment

### Prerequisites

- AWS CLI configured with credentials
- Terraform installed
- Ansible installed
- SSH key configured in AWS

### Run

```bash
cd project
sh run.sh
```

The script automatically:
1. Creates EC2 instance via Terraform
2. Retrieves public IP address
3. Installs Docker via Ansible
4. Deploys Nginx container
5. Outputs access URL: `http://<IP>:8080`

## 🔄 CI/CD Pipeline

GitHub Actions automatically performs deployment on push to `main`:

1. **Terraform Apply** - creates EC2 instance
2. **Get Server IP** - retrieves public IP
3. **Ansible Playbooks** - installs Docker and deploys Nginx
4. **Cleanup** - removes infrastructure after 15 minutes

### Required GitHub Secrets

- `AWS_ACCESS_KEY_ID`
- `AWS_SECRET_ACCESS_KEY`
- `AWS_REGION`
- `SSH_PRIVATE_KEY` - private SSH key for EC2 connection

## ⚙️ Configuration

### Terraform Variables (variables.tf)

- `region` - AWS region (default: us-east-1)
- `instance_type` - instance type (default: t3.micro)
- `instance_ami` - AMI ID
- `ssh_key_name` - SSH key name in AWS

### Nginx

- Port: `8080`
- Configuration: `nginx/nginx.conf`
- HTML template: `nginx/index.html.template`

## 📝 Notes

- After deployment, server is available at `http://<public_ip>:8080`
- CI/CD automatically removes infrastructure after 15 minutes
- For a permanent server, remove the "Terraform Destroy" step from the workflow

