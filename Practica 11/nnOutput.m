function F = nnOutput(X,W1,W2)

[m,n]=size(X);
Xaum=[ones(m,1),X];
S2=Xaum*W1';

A2=1./(1+(exp(-S2)));

[m,n]=size(A2);
Aaum=[ones(m,1),A2];
S3=Aaum*W2';

A3=1./(1+(exp(-S3)));

[M,I] = max(A3');
F=I;


end

