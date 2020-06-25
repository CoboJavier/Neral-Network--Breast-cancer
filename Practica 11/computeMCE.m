function F = computeMCE(y, yhat)
[m,n]=size(y);

cm=confusionmat(y, yhat);
x=diag(cm);
corr=sum(x);
total=sum(sum(cm));

F=(1/n)*(total-corr);

end

