%% shared variance betwen X1 and X2 (ie C1)
function [Cx1x2] = CX1X2(y,x1,x2,x3)

dataTable=table(y,x1,x2,x3, 'VariableNames',{'y', 'x1', 'x2', 'x3'});
mdl1 = fitlm(dataTable, 'y~x1+x2+x3');
TotR2 = mdl1.Rsquared.Ordinary;

 %common variance
mdl2 = fitlm(dataTable, 'y~x1+x3');
R2x1x3 = mdl2.Rsquared.Ordinary;

mdl3 = fitlm(dataTable, 'y~x2+x3');
R2x2x3 = mdl3.Rsquared.Ordinary;

mdl4 = fitlm(dataTable, 'y~x3');
R2x3 = mdl4.Rsquared.Ordinary;

Cx1x2 = -R2x3 + R2x1x3 + R2x2x3 - TotR2;
end 