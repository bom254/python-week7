import pandas as pd
from sklearn.datasets import load_iris

# Loading th Iris dataset
iris = load_iris()

# Creating a DataFrame
df = pd.DataFrame(data=iris.data, columns=iris.feature_names)
df['species'] = iris.target_names[iris.target]

# Displaying the first few rows of the dataset
print(df.head())