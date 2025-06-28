# 🤖 Robot Framework API Automation – Go REST + GitHub + JSONPlaceholder

[![Robot Tests](https://github.com/<your-username>/gorest-api-framework/actions/workflows/api-tests.yml/badge.svg)](https://github.com/<your-username>/gorest-api-framework/actions)
[![License: MIT](https://img.shields.io/badge/license-MIT-green.svg)](LICENSE)

This repository demonstrates an API automation framework built using Robot Framework for public APIs like:
- ✅ Go REST (https://gorest.co.in)
- ✅ GitHub API (https://api.github.com)
- ✅ JSONPlaceholder (https://jsonplaceholder.typicode.com)

## 📦 Features

- ✅ Full CRUD coverage: GET, POST, PUT, DELETE
- ✅ Bearer token auth (Go REST, GitHub)
- ✅ Modular & reusable keywords
- ✅ YAML-based data-driven testing
- ✅ GitHub Actions CI integration
- ✅ Allure Report generation and upload
- ✅ Rate limit & header validation tests

---

## 🚀 Quick Start

### 🔧 1. Clone the Repo & Install Dependencies
```bash
git clone https://github.com/<your-username>/gorest-api-framework.git
cd gorest-api-framework
pip install -r requirements.txt
```

### 🔐 2. Export Environment Variable (Go REST Token)
```bash
export GOREST_TOKEN=<your_token_here>
```

### ▶️ 3. Run the Tests Locally
```bash
robot -d results tests/gorest
```

---

## ⚙️ GitHub Actions CI/CD

Included GitHub Actions workflow (`.github/workflows/api-tests.yml`) will:

- Install dependencies
- Run Robot tests
- Generate Allure results
- Upload test results as an artifact

**To Enable It:**
1. Push to a GitHub repo
2. Go to **Settings > Secrets > Actions**, add `GOREST_TOKEN`

---

## 📊 Allure Reporting

Allure output is saved in `allure-results/`. To generate the HTML report locally:
```bash
pip install allure-pytest
allure serve allure-results
```

Or use [Allure GitHub Actions](https://github.com/marketplace/actions/allure-report-action) to publish to GitHub Pages.

---

## 🔌 Upcoming Integrations

The framework is structured to support new APIs easily:

- [x] Go REST – Full CRUD
- [x] GitHub API – Auth + Repo Queries
- [x] JSONPlaceholder – Read-only resources

You can add more suites to `tests/github/` or `tests/jsonplaceholder/`.

---

## 🧪 Sample Structure

```
gorest-api-framework/
├── resources/
├── tests/
│   └── gorest/
│   └── github/           ← Add GitHub tests here
│   └── jsonplaceholder/  ← Add JSONPlaceholder tests here
├── data/
├── .github/workflows/
└── requirements.txt
```

---

## 📬 Feedback or Contributions?
PRs are welcome to add more APIs, reporting options, or even DB integration.

---

MIT License © 2025 YourName