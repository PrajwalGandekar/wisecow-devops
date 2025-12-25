# Wisecow

A fun web application that serves wisdom quotes using cowsay and fortune.

## Overview

This project deploys the wisecow application, which displays random fortune messages in a cow ASCII art format via a web server running on port 4499.

## Project Structure

- `wisecow/`: Application source code, Dockerfile, and Kubernetes manifests
  - `wisecow.sh`: Shell script to run the Python HTTP server
  - `Dockerfile`: Docker image definition
  - `k8s/`: Kubernetes deployment and service manifests
  - `README.md`: Detailed application documentation
  - `LICENSE`: Project license
- `.github/workflows/`: GitHub Actions CI/CD pipeline
  - `docker-build-push.yml`: Automated Docker build and push on master branch pushes

## Prerequisites

- Docker (for containerization)
- Kubernetes cluster (for deployment)
- GitHub repository with Docker Hub credentials configured as secrets

## Local Development

1. Install required packages:
   ```bash
   sudo apt install fortune-mod cowsay -y
   ```

2. Run the application:
   ```bash
   cd wisecow
   ./wisecow.sh
   ```

3. Open your browser and navigate to `http://localhost:4499`

## Docker Usage

### Build the Image
```bash
docker build -t wisecow ./wisecow
```

### Run the Container
```bash
docker run -p 4499:4499 wisecow
```

## Kubernetes Deployment

1. Apply the Kubernetes manifests:
   ```bash
   kubectl apply -f wisecow/k8s/
   ```

2. Access the application via NodePort at `http://<node-ip>:30007`

## CI/CD Pipeline

The GitHub Actions workflow automatically:
- Builds the Docker image on pushes to the master branch
- Pushes the image to Docker Hub as `prajwalgandekar/wisecow:latest`

## Expected Output

When you access the application, you'll see a cow displaying a random fortune message in ASCII art, similar to:

```
 ________________________________________
/ "The best way to predict the future is \
\ to create it." - Peter Drucker        /
 ----------------------------------------
        \   ^__^
         \  (oo)\_______
            (__)\       )\/\
                ||----w |
                ||     ||
```

## License

See [LICENSE](wisecow/LICENSE) for details.