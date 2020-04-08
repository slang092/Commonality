%% shared variance betwen X1 and X3 (ie C2)
function [Cx1x3] = CX1X3(y,x1,x2,x3)

dataTable=table(y,x1,x2,x3, 'VariableNames',{'y', 'x1', 'x2', 'x3'});
mdl1 = fitlm(dataTable, 'y~x1+x2+x3');
TotR2 = mdl1.Rsquared.Ordinary;

    %common variance
mdl2 = fitlm(dataTable, 'y~x1+x2');
R2x1x2 = mdl2.Rsquared.Ordinary;

mdl3 = fitlm(dataTable, 'y~x2+x3');
R2x2x3 = mdl3.Rsquared.Ordinary;

mdl4 = fitlm(dataTable, 'y~x2');
R2x2 = mdl4.Rsquared.Ordinary;

Cx1x3 = -R2x2 + R2x1x2 + R2x2x3 - TotR2;
end 