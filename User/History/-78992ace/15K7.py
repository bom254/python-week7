import matplotlib.pyplot as plt
from answer import df
import seaborn as sns

# Line chart: GRE Score vs Chance of Admit
plt.figure(figsize=(10, 5))
sns.lineplot(data=df, x='GRE Score', y='Chance of Admit', marker='o')
plt.title("GRE Score vs Chance of Admit")
plt.xlabel('GRE Score')
plt.ylabel('Chance of Admit')
plt.show()