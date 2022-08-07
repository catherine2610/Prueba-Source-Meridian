import pandas as pd 
from statistics import mean
import os

path = os.path.join(os.getcwd(),'PythonPunto1', 'DatosQueryPunto3In.xlsx')
dfConceptDeceased = pd.read_excel(path, sheet_name=0, header=1) 
print(dfConceptDeceased.head())

listCantDeceased = []
for i in range(len(dfConceptDeceased)):
    listCantDeceased.append(dfConceptDeceased.iloc[i]['cant_deceased'])
mean = mean(listCantDeceased)
print(mean)

dfConceptDeceasedNew = dfConceptDeceased['cant_deceased'] > mean
dfConceptDeceasedNew = dfConceptDeceased[dfConceptDeceasedNew]
print(dfConceptDeceasedNew)

worksheet = pd.ExcelWriter('DatosPythonPunto2_Out.xlsx')
# escribir el DataFrame en excel
dfConceptDeceasedNew.to_excel(worksheet)
# guardar el excel
worksheet.save()
print('El DataFrame se ha escrito con éxito en el archivo de Excel.')