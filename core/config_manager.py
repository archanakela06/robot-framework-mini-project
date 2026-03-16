import yaml
import os


class ConfigManager:
    def __init__(self, env):
        project_root = os.path.dirname(os.path.dirname(__file__))

        config_path = os.path.join(
            project_root,
            "configs",
            "env",
            f"{env}.yaml"
        )

        if not os.path.exists(config_path):
            raise Exception(f'Environment file not found: {config_path}')

        with open(config_path, "r") as file:
            self.config = yaml.safe_load(file)
    

    def get(self, key, default=None):
        keys = key.split(".")
        value = self.config

        for k in keys:
            if isinstance(value, dict) and k in value:
                value = value[k]
            else:
                return default

        return value


# env = 'qa'

# config = ConfigManager(env)
# print(config.get("browser"))