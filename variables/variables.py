import yaml

def get_config():
    with open("variables/config.yaml") as f:
        return yaml.safe_load(f)