import pandas as pd
df = pd.read_csv ('ambient.csv')
df.date = pd.to_datetime(df.date)
df1=df.resample(rule='15Min', on='date', label='right', closed='right').mean()
df1.to_csv('ambient_15min.csv', sep=',')

df = pd.read_csv ('system.csv')
df.date = pd.to_datetime(df.date)
df2=df.resample(rule='15Min', on='date', label='right', closed='right').mean()
df2.to_csv('system_15min.csv', sep=',')

df1 = pd.read_csv ('ambient_15min.csv')
df2 = pd.read_csv ('system_15min.csv')
df3 = pd.read_csv ('atmos_15min.csv')
df4 = pd.merge(df2, df3, on='date', how='inner')
df = pd.merge(df1, df4, on='date', how='inner').set_index('date')
df.to_csv('combined_15min.csv', sep=',')

#on average, it seems the difference is a constant + noise