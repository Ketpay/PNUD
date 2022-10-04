import numpy as np
import pandas as pd
import csv


df=pd.read_csv('scores.csv', sep=',')
# -----------------------------------------Score
region=0
filtered_df = df.loc[(df['region_id'] == region)]
print(filtered_df)
filtered_df = filtered_df.loc[(df['dimension'] == 'score')]

goal=list(filtered_df["goal"])
ind=goal.index("Index")
goal.pop(ind)
score=list(filtered_df["score"])
score.pop(ind)
dic={
	"goal":goal,
	"score":score ,
}
print(len(goal))
# ------------------------------------------ detalle
print("Score: ",dic)

valor_buscado="AO"
filtered_df = df.loc[(df['region_id'] == region)]
filtered_df = filtered_df.loc[(df['goal'] == valor_buscado)]
dimension=list(filtered_df["dimension"])
ind=dimension.index("score")
dimension.pop(ind)
score=list(filtered_df["score"])
score.pop(ind)
 
dic={
	"dimension":dimension,
	"score":score ,
}
print("Score: ",dic)