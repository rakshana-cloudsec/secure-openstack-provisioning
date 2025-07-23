import os
import logging
from dotenv import load_dotenv

# Load environment variables from .env file (if present)
load_dotenv()

# Set up logging
def setup_logger(name='openstack_provisioning', level=logging.INFO):
    logger = logging.getLogger(name)
    if not logger.handlers:
        handler = logging.StreamHandler()
        formatter = logging.Formatter('[%(asctime)s] [%(levelname)s] %(message)s')
        handler.setFormatter(formatter)
        logger.addHandler(handler)
        logger.setLevel(level)
    return logger

# Fetch OpenStack credentials from environment
def get_openstack_credentials():
    return {
        'auth_url': os.getenv('OS_AUTH_URL'),
        'username': os.getenv('OS_USERNAME'),
        'password': os.getenv('OS_PASSWORD'),
        'project_name': os.getenv('OS_PROJECT_NAME'),
        'user_domain_name': os.getenv('OS_USER_DOMAIN_NAME', 'Default'),
        'project_domain_name': os.getenv('OS_PROJECT_DOMAIN_NAME', 'Default'),
    }

# Validate required environment variables
def validate_credentials(creds):
    missing = [key for key, value in creds.items() if not value]
    if missing:
        raise ValueError(f"Missing required OpenStack environment variables: {', '.join(missing)}")
