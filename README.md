# Interactive Quiz Engine

A containerized Flask-based Interactive Quiz Engine implemented with an end-to-end DevOps workflow using **Git, GitHub, Jenkins, Docker, Docker Hub, Terraform, AWS EC2, Ansible, and Kubernetes (K3s)**.

The project demonstrates how a simple web application can be packaged, tested, containerized, provisioned on cloud infrastructure, configured automatically, and deployed to a scalable Kubernetes cluster.

---

## 📌 Project Overview

The Interactive Quiz Engine is a web-based multiple-choice quiz application developed using **Python Flask**.

The application:

* Displays multiple-choice questions.
* Allows users to select answers.
* Automatically evaluates the submitted quiz.
* Calculates the user's score.
* Displays the total score and percentage.

The project was extended with a complete DevOps implementation to automate application testing, containerization, infrastructure provisioning, server configuration, and Kubernetes-based deployment.

### Application Workflow

```text
User
  ↓
Flask Web Application
  ↓
Quiz Questions
  ↓
User Selects Answers
  ↓
Quiz Submission
  ↓
Automatic Evaluation
  ↓
Score + Percentage
```

---

# 🎯 Objectives

The main objectives of the project are:

* Develop a functional web-based quiz application.
* Containerize the application using Docker.
* Automate build and testing using Jenkins.
* Store source code using GitHub.
* Store container images using Docker Hub.
* Provision AWS infrastructure using Terraform.
* Configure cloud servers using Ansible.
* Deploy the application using Kubernetes.
* Demonstrate Kubernetes scalability.
* Demonstrate self-healing of application Pods.
* Demonstrate rolling updates with zero planned downtime.
* Provide external HTTP access using Kubernetes Ingress.

---

# 🛠️ Technology Stack

| Technology        | Purpose                             |
| ----------------- | ----------------------------------- |
| Python            | Application programming             |
| Flask             | Web application framework           |
| HTML/CSS          | Frontend                            |
| JSON              | Quiz question storage               |
| Git               | Version control                     |
| GitHub            | Source code repository              |
| Jenkins           | CI automation                       |
| Docker            | Application containerization        |
| Docker Hub        | Container image registry            |
| Terraform         | Infrastructure as Code              |
| AWS EC2           | Cloud virtual machines              |
| Ansible           | Server configuration automation     |
| Kubernetes        | Container orchestration             |
| K3s               | Lightweight Kubernetes distribution |
| Traefik           | Kubernetes Ingress controller       |
| Amazon Linux 2023 | Server operating system             |

---

# 🏗️ System Architecture

```text
                         ┌──────────────────────┐
                         │       Developer      │
                         │   Source Code / Git  │
                         └──────────┬───────────┘
                                    │
                                    ▼
                         ┌──────────────────────┐
                         │       GitHub         │
                         │   Source Repository  │
                         └──────────┬───────────┘
                                    │
                                    ▼
                         ┌──────────────────────┐
                         │       Jenkins        │
                         │                      │
                         │  Checkout            │
                         │  Dependencies        │
                         │  Tests               │
                         │  Docker Build        │
                         │  Docker Push         │
                         └──────────┬───────────┘
                                    │
                                    ▼
                         ┌──────────────────────┐
                         │      Docker Hub      │
                         │   Container Image    │
                         └──────────┬───────────┘
                                    │
                                    ▼
              ┌────────────────────────────────────────┐
              │              AWS Cloud                 │
              │                                        │
              │  ┌──────────────────────────────────┐  │
              │  │             VPC                  │  │
              │  │                                  │  │
              │  │   ┌────────────┐  ┌───────────┐ │  │
              │  │   │ Control    │  │  Worker   │ │  │
              │  │   │ Plane      │  │  Node     │ │  │
              │  │   │            │  │           │ │  │
              │  │   │ K3s        │  │ K3s       │ │  │
              │  │   │            │  │           │ │  │
              │  │   │ Pods       │  │ Pods      │ │  │
              │  │   └────────────┘  └───────────┘ │  │
              │  │                                  │  │
              │  └──────────────────────────────────┘  │
              │                                        │
              └────────────────────────────────────────┘
                                    │
                                    ▼
                              Traefik Ingress
                                    │
                                    ▼
                           Kubernetes Service
                                    │
                                    ▼
                            Quiz Application
```

---

# 🔄 DevOps Workflow

The implemented workflow is:

```text
Plan
  ↓
Code
  ↓
Git
  ↓
GitHub
  ↓
Jenkins
  ↓
Install Dependencies
  ↓
Run Tests
  ↓
Docker Build
  ↓
Docker Push
  ↓
Docker Hub
  ↓
Terraform
  ↓
AWS EC2 Infrastructure
  ↓
Ansible
  ↓
K3s Configuration
  ↓
Kubernetes Deployment
  ↓
Service
  ↓
Traefik Ingress
  ↓
Application
```

---

# 📂 Project Structure

```text
Interactive-Quiz-Engine/
│
├── app.py
├── questions.json
├── requirements.txt
├── Dockerfile
├── Jenkinsfile
├── .dockerignore
├── .gitignore
├── README.md
│
├── templates/
│   ├── index.html
│   └── result.html
│
├── static/
│   └── style.css
│
├── tests/
│   └── ...
│
├── ansible/
│   ├── ansible.cfg
│   ├── inventory.ini
│   └── site.yml
│
├── jenkins/
│   └── Dockerfile
│
├── k8s/
│   ├── deployment.yaml
│   ├── service.yaml
│   └── ingress.yaml
│
└── terraform/
    ├── provider.tf
    ├── variables.tf
    ├── network.tf
    ├── security.tf
    ├── compute.tf
    ├── outputs.tf
    └── .terraform.lock.hcl
```

> Terraform state files and generated Terraform provider files are intentionally excluded from the repository.

---

# 💻 Application

The application is built using Flask.

The Flask application:

1. Loads quiz questions from `questions.json`.
2. Displays the questions through the web interface.
3. Accepts submitted answers.
4. Compares selected answers with the correct answers.
5. Calculates the score.
6. Calculates the percentage.
7. Displays the final result.

### Application Routes

| Route     | Method | Purpose                      |
| --------- | ------ | ---------------------------- |
| `/`       | GET    | Displays the quiz            |
| `/submit` | POST   | Evaluates the submitted quiz |

The application runs on:

```text
Port: 5000
```

---

# 🐳 Docker

Docker is used to containerize the Flask application.

## Dockerfile

The application uses a lightweight Python 3.12 image:

```text
python:3.12-slim
```

The container:

* Installs Python dependencies.
* Copies the application source code.
* Exposes port `5000`.
* Starts the Flask application.

## Build the Docker Image

```bash
docker build -t interactive-quiz-engine .
```

## Run the Container

```bash
docker run -p 5000:5000 interactive-quiz-engine
```

The application can then be accessed at:

```text
http://localhost:5000
```

---

# 🔧 Jenkins CI Pipeline

Jenkins is used to automate the Continuous Integration workflow.

The Jenkins pipeline performs the following stages:

```text
Checkout
   ↓
Install Dependencies
   ↓
Run Tests
   ↓
Docker Build
   ↓
Docker Push
```

## Jenkins Stages

### 1. Checkout

Jenkins checks out the project source code from GitHub.

### 2. Install Dependencies

A Python virtual environment is created and dependencies from `requirements.txt` are installed.

### 3. Run Tests

The application tests are executed using:

```bash
pytest -q
```

### 4. Docker Build

Jenkins builds the Docker image using the project `Dockerfile`.

The image is tagged using the Jenkins build number:

```text
kavinayaramesh13/interactive-quiz-engine:${BUILD_NUMBER}
```

### 5. Docker Push

The generated Docker image is pushed to Docker Hub using Jenkins credentials.

---

# 🐳 Docker Hub

Docker Hub is used as the container image registry.

Repository:

```text
kavinayaramesh13/interactive-quiz-engine
```

The Docker image is built and pushed by Jenkins.

Example:

```text
kavinayaramesh13/interactive-quiz-engine:4
```

Docker Hub acts as the bridge between the CI process and the Kubernetes deployment.

---

# ☁️ AWS Infrastructure

The cloud infrastructure is hosted on **Amazon Web Services (AWS)**.

The project uses **Amazon EC2** instances to create the Kubernetes environment.

## AWS Region

```text
ap-south-1
```

## EC2 Instance Type

```text
t3.small
```

## Operating System

```text
Amazon Linux 2023
```

The infrastructure consists of:

* VPC
* Public subnet
* Internet Gateway
* Route table
* Security group
* Control plane EC2 instance
* Worker EC2 instance

---

# 🏗️ Terraform — Infrastructure as Code

Terraform is used to provision the AWS infrastructure.

Instead of manually creating AWS resources through the console, infrastructure is defined using Terraform configuration files.

## Terraform Files

```text
terraform/
├── provider.tf
├── variables.tf
├── network.tf
├── security.tf
├── compute.tf
├── outputs.tf
└── .terraform.lock.hcl
```

### `provider.tf`

Defines the AWS provider and region.

### `variables.tf`

Defines configurable project variables such as:

* AWS region
* Project name
* EC2 instance type

### `network.tf`

Creates:

* VPC
* Subnet
* Internet Gateway
* Route table
* Route table association

### `security.tf`

Defines the security group and required network access.

### `compute.tf`

Creates the EC2 instances used for the Kubernetes cluster.

### `outputs.tf`

Displays useful infrastructure outputs after Terraform deployment.

---

# 🚀 Terraform Commands

Initialize Terraform:

```bash
terraform init
```

Validate the configuration:

```bash
terraform validate
```

Create an execution plan:

```bash
terraform plan
```

Provision the infrastructure:

```bash
terraform apply
```

To remove the infrastructure when it is no longer required:

```bash
terraform destroy
```

> `terraform.tfstate` is intentionally not stored in GitHub because Terraform state can contain infrastructure and environment information.

---

# ⚙️ Ansible

Ansible is used for server configuration and automation after the AWS infrastructure is provisioned.

Terraform answers:

> "What infrastructure should exist?"

Ansible answers:

> "How should those servers be configured?"

## Ansible Structure

```text
ansible/
├── ansible.cfg
├── inventory.ini
└── site.yml
```

### Inventory

The inventory defines the Kubernetes control plane and worker node.

```text
[control_plane]
control

[workers]
worker
```

### Configuration

The Ansible playbook automates the setup of the Kubernetes environment on the EC2 instances.

Example execution:

```bash
ansible-playbook site.yml
```

The configuration was successfully applied to both the control plane and worker node.

---

# ☸️ Kubernetes

Kubernetes is used to orchestrate the containerized Flask application.

The project uses **K3s**, a lightweight Kubernetes distribution.

## Cluster Architecture

```text
                 K3s Cluster
                     │
          ┌──────────┴──────────┐
          │                     │
          ▼                     ▼
   Control Plane             Worker
          │                     │
      Kubernetes             Kubernetes
      Control                Workloads
          │                     │
          └──────────┬──────────┘
                     │
                  Pods
                     │
              Flask Containers
```

---

# 📦 Kubernetes Deployment

The application is deployed using a Kubernetes `Deployment`.

The deployment is configured with:

```text
Replicas: 5
```

This means Kubernetes maintains five application Pods.

The application container listens on:

```text
5000
```

The deployment also includes:

* Readiness probe
* Liveness probe
* CPU requests
* Memory requests
* CPU limits
* Memory limits
* Rolling update strategy

---

# 🔄 Rolling Update

The Kubernetes deployment uses a `RollingUpdate` strategy.

Configuration:

```yaml
strategy:
  type: RollingUpdate
  rollingUpdate:
    maxUnavailable: 0
    maxSurge: 1
```

This allows Kubernetes to gradually replace old Pods with new Pods.

The application image was updated from an earlier image version to:

```text
kavinayaramesh13/interactive-quiz-engine:4
```

The rollout was verified using:

```bash
sudo k3s kubectl rollout status deployment/interactive-quiz
```

Result:

```text
deployment "interactive-quiz" successfully rolled out
```

---

# ⚖️ Kubernetes Service

A Kubernetes `ClusterIP` Service provides a stable internal endpoint for the application Pods.

```text
User Request
     ↓
Ingress
     ↓
Service
     ↓
One of the available Pods
```

The Service targets the application container running on port `5000`.

---

# 🌐 Kubernetes Ingress

Traefik is used as the Kubernetes Ingress controller.

The Ingress routes HTTP traffic to the application Service.

```text
External HTTP Request
          ↓
       Traefik
          ↓
   Kubernetes Service
          ↓
   Interactive Quiz Pods
```

This provides a controlled HTTP entry point into the application.

---

# 📈 Scalability

The application was configured with five replicas.

The deployment was scaled using:

```bash
sudo k3s kubectl scale deployment interactive-quiz --replicas=5
```

The deployment was then verified using:

```bash
sudo k3s kubectl get deployment
```

The final deployment achieved:

```text
5/5 Pods Running
```

---

# ❤️ Self-Healing

Kubernetes continuously maintains the desired state defined by the Deployment.

To demonstrate self-healing, an application Pod was manually deleted.

Kubernetes automatically created a replacement Pod.

The deployment returned to:

```text
5/5 Pods Running
```

This demonstrates Kubernetes' ability to automatically recover from Pod failure.

---

# 🧪 Testing and Validation

The application and infrastructure were validated at multiple stages.

## Application Testing

Jenkins executes:

```bash
pytest -q
```

before creating the Docker image.

This prevents a failed test build from proceeding to the Docker image stage.

## Kubernetes Deployment Verification

The following command was used:

```bash
sudo k3s kubectl get pods -o wide
```

The final cluster showed five application Pods in the `Running` state.

## Endpoint Validation

The control plane endpoint was tested using:

```bash
curl -I http://<control-plane-private-ip>/
```

The worker endpoint was tested using:

```bash
curl -I http://<worker-private-ip>/
```

Both endpoints returned:

```text
HTTP 200 OK
```

---

# 📊 Final Results

The project successfully demonstrated:

* ✅ Flask-based interactive quiz application
* ✅ Git-based source control
* ✅ GitHub repository management
* ✅ Automated Jenkins CI pipeline
* ✅ Automated dependency installation
* ✅ Automated testing
* ✅ Docker image creation
* ✅ Docker Hub image publishing
* ✅ AWS infrastructure provisioning using Terraform
* ✅ EC2-based Kubernetes infrastructure
* ✅ Server configuration using Ansible
* ✅ K3s Kubernetes cluster
* ✅ Five application replicas
* ✅ Kubernetes Service
* ✅ Traefik Ingress
* ✅ Pod self-healing
* ✅ Rolling updates
* ✅ Successful application endpoint validation
* ✅ HTTP 200 OK response

---

# 🔐 Security Considerations

The following sensitive information should **never be committed to the repository**:

* AWS access keys
* AWS secret keys
* AWS account credentials
* SSH private keys
* Docker Hub access tokens
* Jenkins passwords
* API keys
* `.env` files
* Terraform state files containing sensitive infrastructure information

The project `.gitignore` excludes generated and sensitive files such as:

```text
.terraform/
*.tfstate
*.tfstate.*
.venv/
venv/
.env
jenkins_home/
```

---

# 📝 Important DevOps Distinction

The current implementation provides:

```text
GitHub
   ↓
Jenkins
   ↓
Testing
   ↓
Docker Build
   ↓
Docker Hub
```

The Kubernetes deployment was performed separately using the Kubernetes environment provisioned and configured through Terraform and Ansible.

Therefore, the current project demonstrates a **DevOps CI pipeline and Kubernetes deployment**, rather than a completely automated Jenkins-to-Kubernetes Continuous Deployment pipeline.

---

# 🚀 Future Enhancements

Possible future improvements include:

* Automated deployment from Jenkins directly to the Kubernetes cluster.
* Automated Kubernetes image updates after every successful Jenkins build.
* HTTPS/TLS configuration for the Ingress.
* Kubernetes Secrets for sensitive configuration.
* Horizontal Pod Autoscaler (HPA).
* Prometheus and Grafana monitoring.
* Centralized logging.
* Automated rollback on failed deployments.
* GitHub webhook-triggered Jenkins builds.
* Separate development, staging, and production environments.
* Persistent database-backed quiz questions and user results.

---

# 📚 Key DevOps Concepts Demonstrated

| Concept                  | Implementation        |
| ------------------------ | --------------------- |
| Version Control          | Git                   |
| Code Hosting             | GitHub                |
| Continuous Integration   | Jenkins               |
| Containerization         | Docker                |
| Image Registry           | Docker Hub            |
| Infrastructure as Code   | Terraform             |
| Cloud Infrastructure     | AWS EC2               |
| Configuration Management | Ansible               |
| Container Orchestration  | Kubernetes            |
| Lightweight Kubernetes   | K3s                   |
| Reverse Proxy / Ingress  | Traefik               |
| Scalability              | 5 Kubernetes replicas |
| Self-Healing             | Pod replacement       |
| Rolling Updates          | Kubernetes Deployment |
| Application Validation   | HTTP 200 responses    |

---

# 🎓 Learning Outcomes

This project provided practical experience with:

* Software version control.
* CI pipeline design.
* Automated application testing.
* Docker image creation and management.
* Container registries.
* Infrastructure as Code.
* AWS cloud infrastructure.
* Linux server configuration.
* Ansible automation.
* Kubernetes architecture.
* Kubernetes deployments and services.
* Ingress configuration.
* Application scalability.
* Self-healing infrastructure.
* Rolling application updates.
* End-to-end DevOps workflow implementation.

---

# 👩‍💻 Author

**Kavinaya R**

B.E. Computer Science and Engineering

Rathinam Technical Campus

---

# 📌 Project Repository

**GitHub:**
https://github.com/kavinayaramesh13/Interactive-Quiz-Engine

**Docker Hub:**
https://hub.docker.com/r/kavinayaramesh13/interactive-quiz-engine

---

# ⭐ Project Summary

The Interactive Quiz Engine demonstrates how a Flask web application can be transformed into a cloud-deployed, containerized application using modern DevOps practices.

The project integrates **GitHub, Jenkins, Docker, Docker Hub, Terraform, AWS, Ansible, and Kubernetes** into a practical workflow covering source control, automated testing, containerization, infrastructure provisioning, server configuration, scalable deployment, self-healing, rolling updates, and application validation.

The final Kubernetes deployment successfully maintained **five running application replicas**, supported self-healing after Pod failure, completed a rolling image update, and returned **HTTP 200 OK** during endpoint validation.
