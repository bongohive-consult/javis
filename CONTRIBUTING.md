# Contributing to Javis

Welcome, and thank you for considering contributing to **Javis**! We are excited to collaborate with you. This guide will help you get started.

---

## 🛠️ How to Contribute

We welcome contributions in the form of:

- **Bug Reports**: Help us identify and resolve issues.
- **Feature Requests**: Suggest enhancements to make Javis even better.
- **Code Contributions**: Add new scripts, fix bugs, or improve existing functionality.
- **Documentation**: Improve or expand the documentation.

---

## 📝 Getting Started

1. **Fork the Repository**  
   Fork the Javis repository to your GitHub account:

   - Click the "Fork" button at the top-right of the repository page.

2. **Clone Your Fork**  
   Clone the forked repository to your local machine:

   ```bash
   git clone https://github.com/<your-username>/javis.git
   cd javis
   ```

3. **Set Upstream Repository**  
   Add the original repository as an upstream remote:

   ```bash
   git remote add upstream https://github.com/<original-org>/javis.git
   ```

4. **Create a Branch**  
   Create a new branch for your contribution:
   ```bash
   git checkout -b feature/<your-feature-name>
   ```

---

## 🛠️ Contribution Workflow

### Write Code or Documentation

- Follow the repository's structure and coding conventions.
- Add comments to your code for clarity.
- Update or create relevant documentation in the `docs/` folder.

### Test Your Changes

- Ensure scripts or tools run correctly without errors.
- If modifying critical components, add tests in the `tests/` folder.

### Commit Your Changes

Write a clear and concise commit message:

```bash
git commit -m "Add: Brief description of changes"
```

### Push Your Changes

Push your branch to your forked repository:

```bash
git push origin feature/<your-feature-name>
```

### Submit a Pull Request (PR)

- Go to the original repository and open a Pull Request.
- Include a description of the changes and the issue it addresses (if applicable).
- Link to the related issue using `#<issue-number>` (e.g., `#42`).

---

## 🔍 Code Guidelines

### Shell Scripts

- Use `#!/bin/bash` as the interpreter.
- Follow naming conventions (snake_case) for variables and functions.
- Include error handling with `set -e` where appropriate.
- Lint scripts using ShellCheck.

### Documentation

- Write clear and concise Markdown (.md) files.
- Use proper formatting for headers, lists, and code blocks.

### Testing

- Add test cases for new scripts in the `tests/` folder.
- Use tools like bats for Bash script testing (optional).

---

## 🚀 Suggestions for Contributions

Here are some ways to contribute:

- Add a new deployment script for a specific framework or tool.
- Improve the existing `nestjs-deploy.sh` script with additional features.
- Expand the documentation with more examples and guides.
- Optimize the structure and usability of the repository.

---

## 🤝 Code of Conduct

We expect all contributors to follow our Code of Conduct. Be respectful and collaborative.

---

## ❓ Need Help?

If you encounter any issues or need help:

- Check the issues page.
- Open a new issue with your question or problem.
- Reach out to the maintainers via email (if provided).

Thank you for your contributions! We look forward to collaborating with you.
