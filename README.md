# 🤖 Robot Framework API Automation

[![Robot Tests](https://github.com/<your-username>/gorest-api-framework/actions/workflows/api-tests.yml/badge.svg)](https://github.com/<your-username>/gorest-api-framework/actions)
[![License: MIT](https://img.shields.io/badge/license-MIT-green.svg)](LICENSE)

This repository demonstrates a scalable API automation framework built using Robot Framework for public APIs such as:
- ✅ Salesforce Sandbox Account object (https://login.salesforce.com)
- ✅ Go REST (https://gorest.co.in)

---

## 📦 Features

- ✅ Full CRUD coverage: GET, POST, PUT, DELETE
- ✅ Bearer token authentication (Go REST, GitHub)
- ✅ Modular & reusable keywords (in `resources/`)
- ✅ Data-driven testing using JSON files (`data/`)
- ✅ Matrix-based parallel execution by test group (Create, Delete, Get, Update)
- ✅ Selective test execution via workflow inputs (manual trigger)
- ✅ Automatic rerun of failed tests and result merging
- ✅ GitHub Actions CI/CD integration
- ✅ Allure Report generation and auto-publish to GitHub Pages
- ✅ Rate limit & header validation tests
- ✅ Easy onboarding with detailed documentation

---

## 🚀 Quick Start

### 1. Prerequisites

- **Python 3.11+**  
  [Download Python](https://www.python.org/downloads/)
- **Git**  
  [Download Git](https://git-scm.com/downloads)
- **Recommended IDE:**  
  [Visual Studio Code](https://code.visualstudio.com/)  
  Install extensions:
  - Python (by Microsoft)
  - Robot Framework Language Server

### 2. Clone the Repo & Install Dependencies

```bash
git clone https://github.com/<your-username>/gorest-api-framework.git
cd gorest-api-framework
pip install -r requirements.txt
```

### 3. Export Environment Variable (Go REST Token)

```bash
export GOREST_TOKEN=<your_token_here>
```

### 4. Run the Tests Locally

- **All tests:**  
  `robot -d results tests/Sandbox_Account/`
- **Specific group:**  
  `robot -d results tests/Sandbox_Account/Create/`
- **Specific file:**  
  `robot -d results tests/Sandbox_Account/Create/Create_New_User.robot`
- **With tags:**  
  `robot --include smoke -d results tests/Sandbox_Account/`

---

## ⚙️ GitHub Actions CI/CD

The included workflow (`.github/workflows/api-tests.yml`) will:

- Install dependencies
- Run Robot tests for each group in parallel (Create, Delete, Get, Update)
- Filter and skip groups based on manual input (when triggered via Actions UI)
- Rerun failed tests and merge results
- Generate and upload Allure results as artifacts
- Publish Allure HTML report to GitHub Pages

**To Enable CI/CD:**
1. Push to a GitHub repo
2. Go to **Settings > Secrets and variables > Actions**, add `GOREST_TOKEN`
3. Optionally, trigger tests manually and specify test files/tags

---

## 📊 Allure Reporting

- Allure results are saved in `allure-results-<Group>/` for each group.
- Reports are merged and published to the `gh-pages` branch automatically.
- **View the latest report:**  
  `https://<your-username>.github.io/gorest-api-framework/`

- **To view locally:**
  ```bash
  pip install allure-pytest
  allure serve allure-results-Create/
  ```

---

## 🧪 Project Structure

```
gorest-api-framework/
├── resources/                  # Reusable keywords and variables
├── tests/
│   └── Sandbox_Account/        # Main test suites (Create, Delete, Get, Update)
│       ├── Create/
│       ├── Delete/
│       ├── Get/
│       └── Update/
├── data/                       # Test data (JSON, CSV)
├── results/                    # Robot output files (created after test runs)
├── allure-results-*/           # Allure results per group
├── .github/workflows/          # CI/CD workflow files
├── requirements.txt
└── README.md
```

---

## 📝 Coding Standards

- **Test files:** Place under `tests/Sandbox_Account/<Group>/`
- **Naming:** Use descriptive names for test cases and keywords
- **Tags:** Use for grouping and selective execution (`smoke`, `regression`, etc.)
- **Variables:** Store in resource files or data files
- **Data:** Use JSON files in `/data` for test data
- **Comments:** Use `#` for clarity and maintainability

---

## 👩‍💻 Onboarding New Contributors

1. Install Python, Git, and VS Code (with recommended extensions)
2. Clone the repo and install dependencies
3. Review the folder structure, especially `tests/Sandbox_Account/`
4. Run tests locally to verify setup
5. Check Allure reports for results and familiarize yourself with reporting
6. Follow coding standards for all new contributions
7. For questions, refer to this README or contact maintainers

---

## 📬 Feedback or Contributions?

PRs are welcome to add more APIs, reporting options, or enhancements.  
Please follow the coding and folder structure standards.

---

MIT License © 2025 YourName