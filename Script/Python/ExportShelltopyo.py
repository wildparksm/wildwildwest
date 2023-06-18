import pandas as pd

# Read data from a.xls
df = pd.read_excel("C:\\Users\\50210003\\OneDrive\\Dev\\GIT\\wildwildwest-2\\Script\\Python\\a.xlsx", header=None)

# Create a new DataFrame with the desired columns
new_df = pd.DataFrame(columns=['공유', '경로', '설명', '사용'])

# Iterate over the rows of the original DataFrame and extract the desired data
for i in range(0, len(df), 9):
    공유 = df.iloc[i, 2]
    경로 = df.iloc[i+1, 1]
    설명 = df.iloc[i+2, 0]
    사용 = df.iloc[i+7, 1]
    row_df = pd.DataFrame({'공유': [공유], '경로': [경로], '설명': [설명], '사용': [사용]})
    new_df = pd.concat([new_df, row_df], ignore_index=True)

# Save the new DataFrame to ab.xls
new_df.to_excel("C:\\Users\\50210003\\OneDrive\\Dev\\GIT\\wildwildwest-2\\Script\\Python\\ab.xlsx", index=False)