%common to all three predictors (C4)

function [Cx1x2x3] = CX1X2X3(y,x1,x2,x3)

dataTable=table(y,x1,x2,x3, 'VariableNames',{'y', 'x1', 'x2', 'x3'});

mdl1 = fitlm(dataTable, 'y~x1+x2+x3');
TotR2 = mdl1.Rsquared.Ordinary;
%perform APS and define variances 

    %
mdl2 = fitlm(dataTable, 'y~x2+x3');
R2x2x3 = mdl2.Rsquared.Ordinary;

    %
mdl3 = fitlm(dataTable, 'y~x1+x3');
R2x1x3 = mdl3.Rsquared.Ordinary;

    %
mdl4 = fitlm(dataTable, 'y~x1+x2');
R2x1x2 = mdl4.Rsquared.Ordinary;

 %
mdl5 = fitlm(dataTable, 'y~x1');
R2x1 = mdl5.Rsquared.Ordinary;

 %
mdl6 = fitlm(dataTable, 'y~x2');
R2x2 = mdl6.Rsquared.Ordinary;

 %
mdl7 = fitlm(dataTable, 'y~x3');
R2x3 = mdl7.Rsquared.Ordinary;


% define common variance 
Cx1x2x3 = (R2x1 + R2x2 + R2x3 - R2x1x2 -R2x1x3 - R2x2x3 + TotR2);

end 