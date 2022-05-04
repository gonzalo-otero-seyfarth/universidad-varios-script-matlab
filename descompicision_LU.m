%problema 5
%donde es una matriz de Ax=B
function [Xi]=problema5(A,b) %Los Argumentos de Entrada son la Matríz A y la b, las cuales conforman Ax=b
[m,n]=size(A); %Dónde m y n son el tamaño de la matríz
C=[A,b]; %C es la matríz Ampliada de A y b, de ésta forma se podrá trabajar con ella restando o intercambiandose
if n==m %compara el numero de columnas y filas, para observar si son iguales     
    for k=1:(n-1) 
        may=0; %Con ésta variable 'Mayor' sirve para buscar el número mayor de la fila correspondiente
        filam=k;
         for p=k:n 
             if may<abs(C(p,k)) %se busca el numero mayor en la fila K;                 
                 may=abs(C(p,k));%cambio de mayor                 
                 filam=p; %cambio de fila             
             end
         end
         if may==0
             C=[]; %Aquí se ve que si hay un número igual a cero se corta, porque daría una división por 0
             error('Se a encontrado una división por cero') %Dando un mensaje de error
             break 
             %se interrumpe el programa así no se tiene una division por
             %cero
         end
          if filam ~= k 
              for j=1:(n+1)
                  aux=C(k,j); %para poder intercambiar las filas, utilizamos una                             
                  %variable auxiliar                 
                  C(k,j)=C(filam,j);                 
                  C(filam,j)=aux;             
              end
          end
    end
     for i=(k+1):n
         m(i,k)=C(i,k)/C(k,k); %formula multiplicadores             
            for j=k:(n+1)                 
                C(i,j)=C(i,j)-m(i,k)*C(k,j);%formula nueva fila           
            end
     end
        for i=n:-1:1 
        suma=0;
            for p=(i+1):n                 
                suma=suma+C(i,p)*X(p);
            end
        X(i)=(C(i,n+1)-suma)/C(i,i);           
        %formula de la susticion regresiva y solucion de las variables          
    end
else
    C=[];
    error('No se ha podido realizar el cálculo')
end
for i=1:n     
    Xi(i)=X(1,i);      
end 
Xi=Xi';
