from string import ascii_lowercase
import operator
from collections import Counter 
import string
texto = open('d.txt','r')
msj= texto.read()
msjMin = msj.lower()
a=[' ',',','.','1','2','3','4','5','6','7','8','9','0','/n']
length=len(msj)
print(length)
for c in a:
	length = length - msj.count(c)	
Alphabet = ascii_lowercase
FrecT= []
Frec = [['e',16.78,100],['a',11.96,100],['o',8.69,100],['l',8.37,100],['s',7.88,100],['n',7.01,100],['d',6.87,100],['r',4.94,100],['u',4.80,100],['i',4.15,100],['t',3.31,100],['c',2.92,100],['p',2.776,100],['m',2.12,100],['y',1.54,100],['q',1.53,100],['b',0.92,100],['h',0.89,100],['g',0.73,100],['f',0.52,100],['v',0.39,100],['j',0.30,100],['ñ',0.29,100],['z',0.15,100],['x',0.06,100],['k',0,100],['w',0,100]]
usados=[]
for letra in Alphabet:
	i = msjMin.count(letra)
	por = [letra,(i/length)*100]
	FrecT.append(por)
FrecT.sort(key=operator.itemgetter(1),reverse=True)
print(length)	
i=0

for letra in Frec:
	for letraB in FrecT: 
		if letraB[0] not in usados:
			print (letraB[0],abs(letra[1]-letraB[1]))
			if letra[2]> abs(letra[1]-letraB[1]):
				cambio = letraB[0]
				letra[2]= abs(letra[1]-letraB[1])
				print (cambio)		
	msjMin= msjMin.replace(cambio,letra[0].upper())
	usados.append(cambio)
	print (cambio, letra[0])	

msjMin = msjMin.replace('P','s')
msjMin = msjMin.replace('T','m')
msjMin = msjMin.replace('K','r')
msjMin = msjMin.replace('S','n')
msjMin = msjMin.replace('N','l')
msjMin = msjMin.replace('C','p')
msjMin = msjMin.replace('B','q')
msjMin = msjMin.replace('H','j')	
msjMin = msjMin.replace('V','x')
msjMin = msjMin.replace('Y','b')
msjMin = msjMin.replace('R','c')
msjMin = msjMin.replace('I','t')
msjMin = msjMin.replace('L','i')
msjMin = msjMin.replace('M','f')

msjMin = msjMin.replace('J','z')
msjMin = msjMin.replace('F','h')
	
print (msjMin)	



	
	
	
	

	 	
