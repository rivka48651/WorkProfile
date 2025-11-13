WorkProfile – CI/CD Pipeline & 3-Tier Deployment

WorkProfile is a Flask-based web application demonstrating a complete CI/CD workflow and multi-tier containerized deployment.
It showcases automated build, testing, and delivery processes using GitHub Actions, Docker, Nginx, MySQL, and Kubernetes.

🚀 Highlights

✅ Full CI/CD pipeline with GitHub Actions

🐳 3-tier Docker Compose stack (Nginx → Flask → MySQL)

☸️ Kubernetes StatefulSet tested in Killercoda

🔍 Automated endpoint & database validation using curl

💾 Persistent MySQL storage with health checks

📸 Screenshots & diagrams included for verification

🗂️ Repository Structure
.github/workflows/ci-cd-pipeline.yml   # GitHub Actions workflow
docker-compose/docker-compose.yml      # 3-tier stack configuration
docker-compose/nginx.conf              # Nginx reverse proxy config
src/                                   # Application source code
Dockerfile                             # Docker image build instructions
requirements.txt                       # Python dependencies
README.md                              # Project documentation (this file)

⚙️ CI/CD Pipeline (GitHub Actions)

The workflow is divided into six stages:

1. Validation

Verifies required files exist: Dockerfile, requirements.txt, app.py.

Validates Python dependencies (Flask, mysql-connector-python).

2. Build & Single-Container Test

Builds the Docker image.

Runs the WorkProfile container.

Tests / and /health endpoints via curl.

Pushes the image to GitHub Container Registry.

3. 3-Tier Docker Compose Test

Launches full stack: Nginx → WorkProfile → MySQL.

Waits for MySQL readiness.

Tests endpoints through Nginx proxy.

Validates database connectivity.

Shuts down the stack after successful tests.

4. Publish

Pushes Docker image to the registry with versioned tags.

5. Kubernetes Deployment Testing (Manual)

Performed in Killercoda:

Deploys StatefulSet with persistent storage.

Verifies CRUD operations and NodePort access.

Confirms data persistence after pod restarts.

6. Reflection & Documentation

Includes screenshots and diagrams:

✅ Successful GitHub Actions run

🌐 App running via Nginx

🗄️ CRUD operations in MySQL

☸️ StatefulSet & PVC status in Kubernetes

🧩 Workflow and architecture diagrams

🐳 Docker Compose Setup

Architecture:

Nginx – Reverse proxy / load balancer (port 8081)

WorkProfile – Flask app (port 5000)

MySQL – Database with persistent volume

Environment Variables:

DB_HOST=mysql
DB_USER=flaskapp
DB_PASS=flaskapp
DB_NAME=exampleDb


MySQL data is stored in a named Docker volume (mysql-data), and a healthcheck ensures MySQL is ready before the app starts.

💻 Run Locally with Docker Compose
cd docker-compose
docker-compose up -d
sleep 60
curl http://localhost:8081/
curl http://localhost:8081/health


Shutdown:

docker-compose down -v

☸️ Killercoda (Manual Kubernetes Testing)

MySQL deployed as StatefulSet with persistent volume.

Flask app exposed via NodePort.

Full CRUD functionality verified.

Data remains intact after pod restarts.

🧠 Reflection

This project demonstrates an end-to-end DevOps workflow — from source code validation and Dockerization to multi-container orchestration and Kubernetes deployment testing.
It provides a hands-on example of modern CI/CD automation and containerized infrastructure in action.
