# DP Wizard Enhanced

[![pypi](https://img.shields.io/pypi/v/dp_wizard)](https://pypi.org/project/dp_wizard/)

An enhanced version of DP Wizard that makes it easier to get started with Differential Privacy.

![DP Wizard Enhanced Demo](assets/DP-Demo.gif)

## What is DP Wizard?

DP Wizard guides you through the application of differential privacy. After selecting a local CSV, you're prompted to describe the analysis you need. The tool generates:

- **Jupyter notebooks** demonstrating how to use [OpenDP](https://docs.opendp.org/)
- **Plain Python scripts** ready to run
- **Text and CSV reports** with your differentially private results

Building on what we've learned from [DP Creator](https://github.com/opendp/dpcreator), DP Wizard Enhanced offers:

- ✅ Easy installation with `pip install dp_wizard[app]`
- ✅ Simplified single-user application design
- ✅ Streamlined workflow that doesn't assume familiarity with differential privacy
- ✅ Interactive visualization of privacy budget choices
- ✅ Modern UI built with Python [Shiny](https://shiny.posit.co/py/)

## Quick Start

### Installation

DP Wizard requires **Python 3.10 or later**. Check your version:

```bash
python --version
```

If you need to upgrade, the process depends on your operating system. Once you have Python 3.10+, install DP Wizard:

```bash
pip install dp_wizard[app]
```

> **Note**: The `[app]` extra ensures all dependencies are pinned for reliable application use. If you're using `dp_wizard` as a library, you can install without it: `pip install dp_wizard`

### Running the Application

#### Option 1: Try the Demo (Recommended for First-Time Users)

Run DP Wizard with sample data to see how it works:

```bash
dp-wizard --demo
```

Your browser will automatically open to `http://localhost:8000` where you can explore the application with pre-loaded sample data.

#### Option 2: Use Your Own Data

Run DP Wizard and upload your CSV file:

```bash
dp-wizard
```

Then upload your CSV file through the web interface.

#### Option 3: Manual Column Entry (No File Upload)

If you prefer to enter column names manually:

```bash
dp-wizard --no_uploads
```

### Understanding CSV Options

DP Wizard supports different CSV configurations depending on your use case:

- **Public CSV**: If you have a public dataset and want to see how DP can be applied. Preview visualizations will use your public data.

- **Private CSV**: If you only have a private dataset and want to make a release from it. Preview visualizations will use simulated data, and the private CSV is not read until the actual release.

- **Both Public and Private**: If you have two CSVs with the same structure (e.g., the public CSV is older and no longer sensitive). Preview visualizations use the public data, but the release is made with private data.

## Usage

### Command Line Options

```
usage: dp-wizard [-h] [--demo | --no_uploads]

DP Wizard makes it easier to get started with Differential Privacy.

options:
  -h, --help    show this help message and exit
  --demo        Use generated fake CSV for a quick demo
  --no_uploads  Prompt for column names instead of CSV upload
```

### Workflow

1. **Start the application** using one of the methods above
2. **Upload or specify your data** (CSV file or column names)
3. **Configure your analysis** by selecting:
   - Column(s) to analyze
   - Analysis type (count, mean, median, histogram, etc.)
   - Privacy parameters (epsilon, bounds, etc.)
4. **Generate outputs**:
   - Download Jupyter notebook with OpenDP code
   - Download Python script
   - View text and CSV reports

## Documentation

### For Users

- **Getting Started**: Follow the [Quick Start](#quick-start) guide above
- **Understanding Differential Privacy**: Check out the [OpenDP documentation](https://docs.opendp.org/)
- **Troubleshooting**: [File an issue](https://github.com/opendp/dp-wizard/issues/new/choose) if you encounter problems

### For Developers

If you want to contribute or modify DP Wizard Enhanced:

#### Development Setup

1. **Clone the repository:**
   ```bash
   git clone https://github.com/ilund3/dp-wizard-enhanced.git
   cd dp-wizard-enhanced
   ```

2. **Set up a virtual environment** (recommended):
   ```bash
   python3.10 -m venv .venv
   source .venv/bin/activate  # On Windows: .venv\Scripts\activate
   ```

3. **Install development dependencies:**
   ```bash
   pip install -r requirements-dev.txt
   pre-commit install
   playwright install
   ```

4. **Install the package in editable mode:**
   ```bash
   pip install --editable .
   ```

5. **Run the application:**
   ```bash
   dp-wizard --demo
   ```

#### Testing

Run the test suite:

```bash
./ci.sh
```

We use [Playwright](https://playwright.dev/python/) for end-to-end tests. You can:

- **Generate test code** by interacting with the app:
  ```bash
  dp-wizard  # Keep this running
  playwright codegen http://127.0.0.1:8000/  # In another terminal
  ```

- **Debug tests** step-by-step:
  ```bash
  PWDEBUG=1 pytest -k test_app
  ```

#### Project Structure

- `dp_wizard/app/` - Main application code (Shiny UI and server)
- `dp_wizard/utils/` - Utility functions and code generators
- `tests/` - Test suite
- `requirements*.txt` - Python dependencies

#### Development Guidelines

- **Branch naming**: Use format `NNNN-short-description` where `NNNN` is the issue number
- **Dependencies**: 
  - Add developer-only dependencies in `requirements-dev.in`
  - Add other dependencies in `requirements.in`
  - Run `dependencies.py` after editing either file to update `pyproject.toml`
- **Code style**: Pre-commit hooks are installed to enforce code quality

## Contributing

We welcome contributions! Here are several ways to help:

1. **Feedback**: If DP Wizard is useful, [let us know](https://docs.google.com/forms/d/e/1FAIpQLScaGdKS-vj-RrM7SCV_lAwZmxQ2bOqFrAkyDp4djxTqkTkinA/viewform)
2. **Report Issues**: Found a bug? [File an issue](https://github.com/opendp/dp-wizard/issues/new/choose)
3. **Feature Requests**: Have an idea? [Submit a feature request](https://github.com/opendp/dp-wizard/issues/new/choose)
4. **Pull Requests**: We welcome PRs! See [Development](#for-developers) above for setup instructions

### Contribution Guidelines

Before contributing, please note our project vision:

- **No algorithms in DP Wizard**: This project is a thin wrapper around the [OpenDP library](https://github.com/opendp/opendp/). New algorithms should be added to OpenDP, not here.
- **Keep it simple**: The OpenDP library is rich, but DP Wizard exposes only a fraction to avoid overwhelming users.
- **Model correct DP application**: We focus on demonstrating proper differential privacy practices.

### Getting Help

- **Office Hours**: Chat with us at our [online office hour](https://harvard.zoom.us/j/98058847683), usually Tuesdays and Thursdays at 11am Eastern
- **Issues**: [Browse existing issues](https://github.com/opendp/dp-wizard/issues) or [create a new one](https://github.com/opendp/dp-wizard/issues/new/choose)

## Deployment

DP Wizard Enhanced is a Python Shiny web application that requires a server to run. It **cannot** be deployed on GitHub Pages (which only hosts static sites).

For deployment options, see:
- [Render Deployment Guide](README-RENDER.md) - Free tier available
- [Railway Deployment Guide](README-RAILWAY.md) - $5/month credit
- [Fly.io Deployment Guide](README-FLY.md) - Free tier available
- [General Deployment Guide](DEPLOYMENT.md) - Overview of all options

## Resources

- **2025-04-11**: [Slides for 5 minute mini-talk on v0.3.0](https://docs.google.com/presentation/d/1g1c5ksG9sN8A_qWW9nFmFFZ6dSCkUAmL6_cUahi3VPA/edit#slide=id.g34c5f4bdc6a_0_0)
- **2024-12-13**: [Blog post for initial release](https://opendp.org/blog/dp-wizard-easy-way-get-started-differential-privacy-and-opendp)
- **OpenDP Documentation**: https://docs.opendp.org/
- **Shiny for Python**: https://shiny.posit.co/py/

## License

See [LICENSE](LICENSE) file for details.

## Acknowledgments

DP Wizard Enhanced is built on the original [DP Wizard](https://github.com/opendp/dp-wizard) project by the OpenDP team, which builds on learnings from [DP Creator](https://github.com/opendp/dpcreator).
