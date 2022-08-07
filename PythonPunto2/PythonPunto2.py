import pandas as pd 
from statistics import mean
import os

path1 = os.path.join(os.getcwd(),'PythonPunto2', 'DatosQueryPunto3In.xlsx')
dfConceptDeceased = pd.read_excel(path1, sheet_name=0, header=1) 
print(dfConceptDeceased.head())

listCantDeceased = []
for i in range(len(dfConceptDeceased)):
    listCantDeceased.append(dfConceptDeceased.iloc[i]['cant_deceased'])
mean = mean(listCantDeceased)
print(mean)

dfConceptDeceasedNew = dfConceptDeceased['cant_deceased'] > mean
dfConceptDeceasedNew = dfConceptDeceased[dfConceptDeceasedNew]
print(dfConceptDeceasedNew)
path2 = os.path.join(os.getcwd(),'PythonPunto2', 'DatosPythonPunto2_Out.xlsx')
worksheet = pd.ExcelWriter(path2)
# escribir el DataFrame en excel
dfConceptDeceasedNew.to_excel(worksheet)
# guardar el excel

worksheet.save()
print('El DataFrame se ha escrito con éxito en el archivo de Excel.')