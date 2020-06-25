function F = computeCPM(cM,index)

str1 = ['FOR CLASS INDEX AS ', num2str(index) ,' POSITIVE":-------------'];
disp(str1)

if isequal(index,1)

str2 = ['True positives ', num2str(cM(1,1))];
disp(str2)
str3 = ['False positives ', num2str(cM(2,1))];
disp(str3)
str4 = ['False negatives ', num2str(cM(1,2))];
disp(str4)
str5 = ['True negatives ', num2str(cM(2,2))];
disp(str5)
str5 = ['Sensitivity ', num2str(cM(1,1)/(cM(1,1)+cM(1,2)))];
disp(str5)
str6 = ['Specificity ', num2str(cM(2,2)/(cM(2,2)+cM(2,1)))];
disp(str6)
    
    
elseif isequal(index,2)

str2 = ['True positives ', num2str(cM(2,2))];
disp(str2)
str3 = ['False positives ', num2str(cM(1,2))];
disp(str3)
str4 = ['False negatives ', num2str(cM(2,1))];
disp(str4)
str5 = ['True negatives ', num2str(cM(1,1))];
disp(str5)
str5 = ['Sensitivity ', num2str(cM(2,2)/(cM(2,2)+cM(2,1)))];
disp(str5)
str6 = ['Specificity ', num2str(cM(1,1)/(cM(1,1)+cM(1,2)))];
disp(str6)




end


end

