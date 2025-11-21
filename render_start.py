#!/usr/bin/env python3
"""
Startup script for Render deployment.
This directly starts the Shiny app in demo mode.
"""
import sys
import os

# Add the current directory to Python path
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))

# Set environment variables if not already set
# Note: PORT is set by Render automatically
os.environ.setdefault("HOST", "0.0.0.0")
os.environ.setdefault("LAUNCH_BROWSER", "false")
os.environ.setdefault("RELOAD", "false")

# Mock sys.argv to include --demo flag
sys.argv = ["dp-wizard", "--demo"]

# Import and run the app
from dp_wizard import main

if __name__ == "__main__":
    main()

