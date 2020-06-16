a=0
b=1
count=0;
#get user sequence value
num=int(input("Enter how many terms you want to display?: "))
#base
if num <=0:
 print("Plese enter a posive number:")
elif num==1:
 print ("Fibonacci sequence for",num,"terms are: ")
 print (a)
else:
 print('Fibonacci sequences are:')
 while count<num:
  print(a)
  nth=a+b
   #now update a and b
  a=b
  b=nth
  count+=1
