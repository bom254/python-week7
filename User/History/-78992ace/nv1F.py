import matplotlib.pyplot as plt
from answer import df

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
sns.barplot(data=df, x='Reserch', y='Chance of Admit ')
plt.title('Research Experience vs Average Chance of Admit')
plt.xlabel('Research Experience (0= No, 1=Yes)')
plt.ylabel('Average Chance of Admit')
plt.show()