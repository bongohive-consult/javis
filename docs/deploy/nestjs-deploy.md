## Deployment Tools

### NestJS Deployment Script

The `nestjs-deploy.sh` script automates the deployment of a NestJS application. It performs the following:

- Installs required dependencies (Node.js, Yarn, PM2, Nginx, Certbot).
- Sets up the application and configures the server.
- Enables SSL using Certbot.

**Prerequisites**
To ensure a successful deployment, the following requirements must be met:

**Private Repository Access**

The Linux server (e.g., droplet) must have access to the private repository. Ensure that:

- An SSH key is configured on the server and added to the repository’s deploy keys or GitHub account.
- The repository URL uses SSH format, e.g., `git@github.com:your-org/your-repo.git`.

**Domain Configuration**

The domain must be correctly configured to point to the server's IP address (A or CNAME record).

- Certbot requires the domain to resolve to the server for SSL certificate issuance.

**Linux Server**

The server must have `sudo` privileges to install dependencies and configure services.

- A Linux server with `sudo` privileges.
- Domain pointing to the server's IP.
- Access to the NestJS application's repository.

**Usage**:

Before running the script, make it executable:

```bash
chmod +x ./scripts/deploy/nestjs-deploy.sh
```

You can now run the script

```bash
./scripts/deploy/nestjs-deploy.sh
```

**Configuration**:
The script will prompt you to provide:

- Node.js version
- Application directory
- Repository URL
- Domain name
- Email for SSL configuration
- _Confirm the entered values, and the deployment process will begin._

### What It Does

- Updates the system and installs required dependencies (Node.js, Yarn, PM2, Nginx, Certbot).
- Clones the application repository and sets up the application.
- Configures PM2 for process management.
- Sets up Nginx as a reverse proxy for the application.
- Configures SSL using Certbot for HTTPS.

### Troubleshooting

If any step fails, the script will display an error message and exit. Common issues include:

- Missing domain DNS configuration.
- Repository URL requiring authentication.

### Logs

For detailed logs, check:

- Nginx: `/var/log/nginx/`
- PM2: `pm2 logs`

### Customization

To customize the script, edit the following sections:

- Application directory and repository URL defaults.
- Nginx configuration template.
