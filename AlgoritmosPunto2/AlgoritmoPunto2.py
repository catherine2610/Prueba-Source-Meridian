from itertools import combinations

def addEvenNumb(N):
    """Descripción de la función
    A partir de un entero positivo N, esta función devuelve la combinación de mayor longitud, 
    sumarlos dan como resultado el número N.
    Parameters
    ----------
    N : tipo de dato int
    Es un número entero positivo, es el resultado de la suma 
    de la combinación de mayor longitud, de todas las posibles combinaciones.
   
    Returns
    -------
    tipo
    Esta función no devuelve valores
    """
   
    finalList=[]
    if (N%2!=0):
            emptyList= []
            print(N,emptyList)
    else:
        for n in range(N+1):
            if N==0:
                break
        
            combination = list(combinations(range(2,N+1,2),n))

            for i in combination:

                if sum(i) == N:
                    finalList= [i]
        print(N, finalList)
    
addEvenNumb(22)


            