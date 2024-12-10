import matplotlib.pyplot as plt
from answer import *

# Line chart: GRE Score vs Chance of Admit
plt.figure(figsize=(10, 5))
plt.plot(df['GRE Score'], df['Chance of Admit '], marker='o', linestyle='-', alpha=0.7)
plt.title("GRE Score vs Chance of Admit", fontsize=12)
plt.xlabel('GRE Score', fontsize=12)
plt.ylabel('Chance of Admit', fontsize=12)
plt.grid(True, linestyle='--', alpha=0.5)
plt.show()

# Bar chart: Research vs Average Chance of Admit
plt.figure(figsize=(10, 5))
plt.bar(mean_admit_chance.index, mean_admit_chance.values, color=['orange', 'green'], alpha=0.7)
plt.title('Research Experience vs Average Chance of Admit')
plt.xlabel('Research Experience (0= No, 1=Yes)')
plt.ylabel('Average Chance of Admit')
plt.xticks([0, 1], ['No Research', 'Research'])
plt.grid(axis='y', linestyle='--', alpha=0.5)
plt.show()

# Histogram: Distribution of CGPA
plt.figure(figsize=(10, 5))
plt.hist(df['CGPA'], bins=10, color='purple', alpha=0.7, edgecolor='black')
plt.title('Distribution of CGPA', fontsize=14)
plt.xlabel('CGPA', fontsize=12)
plt.ylabel('Frequency', fontsize=12)
plt.grid(axis='y', linestyle='--', alpha=0.5)
plt.show()

# Scatter plot: GRE Score vs CGPA
plt.figure(figsize=(10, 5))
plt.scatter(df['GRE Score'], df['CGPA'], c=df['Research'], cmap='coolwarm', alpha=0.7, edgecolor='k')
plt.title('GRE Score vs CGPA (Colored by Research Expreience)', fontsize=14)
plt.xlabel('GRE Score', fontsize=12)
plt.ylabel('CGPA', fontsize=12)
plt.colorbar(label='Research (0=No, 1=Yes)')
plt.grid(True, linestyle='--', alpha=0.5)
plt.show()