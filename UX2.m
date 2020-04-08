%% unique X2
function [Ux2] = UX2(y,x1,x2,x3)

dataTable=table(y,x1,x2,x3, 'VariableNames',{'y', 'x1', 'x2', 'x3'});
mdl1 = fitlm(dataTable, 'y~x1+x2+x3');
TotR2 = mdl1.Rsquared.Ordinary;
    %x2
mdl3 = fitlm(dataTable, 'y~x1+x3');
Cx1x3 = mdl3.Rsquared.Ordinary;
Ux2 = TotR2 - Cx1x3;
end 