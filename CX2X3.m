%% shared variance betwen X2 and X3 (ie C3)
function [Cx2x3] = CX2X3(y,x1,x2,x3)

dataTable=table(y,x1,x2,x3, 'VariableNames',{'y', 'x1', 'x2', 'x3'});

mdl1 = fitlm(dataTable, 'y~x1+x2+x3');
TotR2 = mdl1.Rsquared.Ordinary;

% common variance
mdl2 = fitlm(dataTable, 'y~x1+x2');
R2x1x2 = mdl2.Rsquared.Ordinary;

mdl3 = fitlm(dataTable, 'y~x1+x3');
R2x1x3 = mdl3.Rsquared.Ordinary;

mdl4 = fitlm(dataTable, 'y~x1');
R2x1 = mdl4.Rsquared.Ordinary;

Cx2x3 = -R2x1 + R2x1x2 + R2x1x3 - TotR2;
end 