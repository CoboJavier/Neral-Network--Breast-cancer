clear; close all; clc;

dataC=xlsread('cancerData.xlsx');

%% 5
%LOAD DATA IN X MATRIX EXCEPT 'BARE NUCLEI'

X=dataC(:,(2:10));
X(:,6) = [];

%% 6
%REPLACE VALUES OF Y VECTOR(2=1, 4=2) MORE DETAILS IN https://archive.ics.uci.edu/ml/datasets/breast+cancer+wisconsin+(original)
Y=dataC(:,11);
Y2=Y;
Y2(Y2==2)=1;
Y2(Y2==4)=2;
Y=Y2;

%% 7

%CALCULE DIMENSIONS OF MATRIX: 70% TRAIN, 15% VALIDATION, 15% TEST 
[m,n]=size(X);
[m2,n2]=size(Y);

Xx=round((70/100)*(m));
Xy=round((70/100)*(m2));

Yx=round((15/100)*(m));
Yy=round((15/100)*(m2));

%CREATION OF MATRIX: XTRAIN, YTRAIN
XTr=X((1:Xx),:);
YTr=Y((1:Xy),:);
%CREATION OF MATRIX: XVALIDATION, YVALIDATION
XV=X((Xx:(Xx+Yx)),:);
YV=Y((Xy:(Xy+Yy)),:);
%CREATION OF MATRIX: XTEST, YTEST
XT=X(((m-Yx):m),:);
YT=Y(((m-Yy):m2),:);

%% 9

%CREATION OF TABLE: HIDDEN LAYER SIZE, LAMBDA, MAX_ITERATIONS, ERROR
%VALIDATION

lambda=[0.5;1;1.5];
[fil, col]=size(lambda);

cont=1;
conta=0;

max_iter=20;
hidden_size=5;
num_class=2;

Table=zeros(1,1);

while cont <= fil
    for i=1:hidden_size
        for j=1:max_iter
            conta=conta+1;
            %Ws=nnLearning(XTr,YTr,2,i,lambda(cont,1),j);
            
            %SAFE W1, W2 VECTOR IN A CELL MATRIX
            B=nnLearning(XTr,YTr,num_class,i,lambda(cont,1),j);
            Ws(conta,:)=nnLearning(XTr,YTr,2,i,lambda(cont,1),j);
            W1 = cell2mat(B(1,1));
            W2 = cell2mat(B(1,2));
            
            %COMPUTE YHAT 
            yhat=nnOutput(XV,W1,W2);
            
            %ADD TO MATRIX NAMED TABLE
            Table(conta,1)=i;
            Table(conta,2)=lambda(cont,1);
            Table(conta,3)=j;
            Table(conta,4)=computeMSE(YV, yhat');
            
                                 
        end
        
    end
    cont=cont+1;
end

%% 10

%OBTAIN FILE OF MINIMUM VALIDATION ERROR
[M,I] = min(Table(:,4));

hidd_opt=Table(I,1);
lambda_opt=Table(I,2);
maxIter_opt=Table(I,3);

%% 11

Wopt=Ws(I,:);
W1opt = cell2mat(Wopt(1,1));
W2opt = cell2mat(Wopt(1,2));

%% 12

%FINAL TEST OF THE NEURAL NETWORK

ytest_hat=nnOutput(XT,W1opt,W2opt);

disp('Error Test');
computeMSE(YT,ytest_hat')

disp('Confussion Matrix');
cM=confusionmat(YT,ytest_hat')

computeCPM(cM,2)







