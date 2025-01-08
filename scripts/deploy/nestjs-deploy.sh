#!/bin/bash

# Function to prompt for input with a default value
prompt() {
    local var_name=$1
    local prompt_message=$2
    local default_value=$3

    read -p "$prompt_message [$default_value]: " value
    if [ -z "$value" ]; then
        eval "$var_name=\"$default_value\""
    else
        eval "$var_name=\"$value\""
    fi
}

# Prompt user for required variables
echo "Please provide the following deployment variables:"
prompt NODE_VERSION "Node.js Version" "22.13.0"
prompt APP_DIR "Application Directory" "./nestjs-app"
prompt REPO_URL "Repository URL" "https://github.com/your-org/your-repo.git"
prompt DOMAIN "Domain Name" "yourdomain.com"
prompt EMAIL "Email for SSL Certbot" "itsupport@bongohive.co.zm"

# Display entered variables for confirmation
echo -e "\nYou have entered the following configurations:"
echo "Node.js Version: $NODE_VERSION"
echo "Application Directory: $APP_DIR"
echo "Repository URL: $REPO_URL"
echo "Domain Name: $DOMAIN"
echo "Email: $EMAIL"
echo ""

# Confirm the entered values
read -p "Are these values correct? (yes/no): " confirmation
if [[ "$confirmation" != "yes" ]]; then
    echo "Exiting. Please run the script again to re-enter values."
    exit 1
fi

# Start deployment process
echo -e "\nStarting deployment with the following settings..."
set -e  # Exit immediately if a command fails

# Update System and Install Dependencies
echo "Updating system packages..."
sudo apt update && sudo apt upgrade -y || { echo "Failed to update system packages."; exit 1; }

echo "Installing required packages..."
sudo apt install -y curl git build-essential nginx certbot python3-certbot-nginx || { echo "Failed to install required packages."; exit 1; }

# Install Node.js
echo "Installing Node.js LTS v$NODE_VERSION..."
curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash - || { echo "Failed to set up Node.js repository."; exit 1; }
sudo apt install -y nodejs || { echo "Failed to install Node.js."; exit 1; }

# Install Yarn
echo "Installing Yarn..."
npm install -g yarn || { echo "Failed to install Yarn."; exit 1; }

# Install PM2
echo "Installing PM2..."
npm install -g pm2 || { echo "Failed to install PM2."; exit 1; }

# Clone Repository
echo "Cloning repository from $REPO_URL..."
sudo mkdir -p $APP_DIR
sudo chown $USER:$USER $APP_DIR
git clone $REPO_URL $APP_DIR || { echo "Failed to clone repository."; exit 1; }
cd $APP_DIR

# Install dependencies
echo "Installing application dependencies..."
yarn install || { echo "Failed to install application dependencies."; exit 1; }

# Build application
echo "Building application..."
yarn build || { echo "Failed to build the application."; exit 1; }

# Start application with PM2
echo "Starting application with PM2..."
pm2 start dist/main.js --name "nestjs-app" || { echo "Failed to start application with PM2."; exit 1; }
pm2 save
pm2 startup || { echo "Failed to configure PM2 for startup."; exit 1; }

# Configure Nginx
echo "Configuring Nginx..."
sudo bash -c "cat > /etc/nginx/sites-available/$DOMAIN <<EOF
server {
    listen 80;
    server_name $DOMAIN www.$DOMAIN;

    location / {
        proxy_pass http://127.0.0.1:3000;
        proxy_http_version 1.1;
        proxy_set_header Upgrade \$http_upgrade;
        proxy_set_header Connection 'upgrade';
        proxy_set_header Host \$host;
        proxy_cache_bypass \$http_upgrade;
    }
}
EOF"
sudo ln -s /etc/nginx/sites-available/$DOMAIN /etc/nginx/sites-enabled/ || { echo "Failed to enable Nginx site."; exit 1; }
sudo systemctl restart nginx || { echo "Failed to restart Nginx."; exit 1; }

# Configure SSL with Certbot
echo "Setting up SSL with Certbot..."
sudo certbot --nginx -d $DOMAIN -d www.$DOMAIN --email $EMAIL --agree-tos --non-interactive || { echo "Failed to configure SSL with Certbot."; exit 1; }
sudo systemctl reload nginx || { echo "Failed to reload Nginx."; exit 1; }

echo -e "\nDeployment completed successfully!"