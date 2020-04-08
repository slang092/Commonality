%% unique x 3
function [Ux3] = UX3(y,x1,x2,x3)

dataTable=table(y,x1,x2,x3, 'VariableNames',{'y', 'x1', 'x2', 'x3'});

mdl1 = fitlm(dataTable, 'y~x1+x2+x3');
TotR2 = mdl1.Rsquared.Ordinary;
    %x3
mdl4 = fitlm(dataTable, 'y~x1+x2');
Cx1x2 = mdl4.Rsquared.Ordinary;
Ux3 = TotR2 - Cx1x2;

end 