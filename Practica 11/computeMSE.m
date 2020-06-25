function F = computeMSE( y,yhat )
[m,n]=size(y);

resta=y-yhat;
cua=resta.^2;
suma=sum(cua);
F=(1/m)*suma;
end

