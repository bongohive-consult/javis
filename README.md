# Javis

**Javis** is your all-in-one automation assistant designed to simplify repetitive tasks, manage deployments, and automate workflows. Whether you're setting up servers, deploying applications, or configuring services, Javis provides reusable and modular tools to make your life easier.

---

## 🚀 Features

- **Deployment Tools**: Automate the setup and deployment of applications like NestJS.
- **Reusable Scripts**: Modular shell scripts for various automation tasks.
- **Documentation**: Comprehensive guides for each tool and process.
- **Extensibility**: Easily add and customize tools for your needs.

---

## 📂 Folder Structure

The repository is organized into the following folders:

```
JAVIS/
├── docs/                   # Documentation for tools and scripts
│   ├── deploy/             # Deployment-related docs
│   │   └── nestjs-deploy.md # Guide for NestJS deployment
│   └── other-docs.md       # Placeholder for additional docs
├── scripts/                # Automation scripts
│   ├── deploy/             # Deployment scripts
│   │   └── nestjs-deploy.sh # Script for deploying a NestJS application
│   └── other-scripts.sh    # Placeholder for other scripts
├── CONTRIBUTING.md         # Guide for contributors
├── README.md               # Main repository overview
```

## 📖 Documentation

Find detailed documentation for specific tools and scripts in the `docs/` folder:

### NestJS Deployment

- **Script**: `scripts/deploy/nestjs-deploy.sh`
- **Documentation**: `docs/deploy/nestjs-deploy.md`

### Future Tools and Scripts

Documentation for additional tools will follow the same structure under the `docs/` folder.

---

## 🛠️ Usage

Clone the repository:

```bash
git clone https://github.com/bongohive-consult/javis.git
cd javis
```

Navigate to the relevant script:

```bash
cd scripts/deploy
```

Make the script executable and run it:

```bash
chmod +x nestjs-deploy.sh
./nestjs-deploy.sh
```

---

## 🤝 Contributing

We welcome contributions! Please check the `CONTRIBUTING.md` file for detailed guidelines on how to contribute to the project.
