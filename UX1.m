%% unique X1 
function [Ux1] = UX1(y,x1,x2,x3)

dataTable=table(y,x1,x2,x3, 'VariableNames',{'y', 'x1', 'x2', 'x3'});
mdl1 = fitlm(dataTable, 'y~x1+x2+x3');
TotR2 = mdl1.Rsquared.Ordinary;
% define unique variances 
    %x1
mdl2 = fitlm(dataTable, 'y~x2+x3');
Cx2x3 = mdl2.Rsquared.Ordinary;
Ux1 = TotR2 - Cx2x3;
end 
