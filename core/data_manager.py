import os
import yaml


class DataManager:

    def __init__(self):

        self.project_root = os.path.dirname(os.path.dirname(__file__))
        self.cache = {}

    def get_test_data(self, test_file, scenario):

        feature = test_file.replace("_test", "")

        data_path = os.path.join(
            self.project_root,
            "testData",
            feature,
            f"{feature}.yaml"
        )

        print("Loading test data from:", data_path)

        if feature not in self.cache:

            with open(data_path, "r") as file:
                self.cache[feature] = yaml.safe_load(file)

        data = self.cache[feature]

        if scenario not in data:
            raise Exception(f"Scenario '{scenario}' not found in {feature}.yaml")

        return data[scenario]

# if __name__ == "__main__":

#     dm = DataManager()

#     data = dm.get_test_data("login", "valid_login")

#     print(data)