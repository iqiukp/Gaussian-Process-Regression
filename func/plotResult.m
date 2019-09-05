function plotResult(yt,yfit)
%{ 
DESCRIPTION
Plot the results 

   plotResult(yt,yfit)

INPUT
  yt           testing targets
  yfit         prediction

Created on 4th September 2019, by Kepeng Qiu.
-------------------------------------------------------------%
%} 

figure 
plot(yt,'ok:','LineWidth',1,'MarkerSize',8, ... 
    'MarkerEdgeColor', 'k', 'MarkerFaceColor', [254, 67, 101]/255)
hold on
plot(yfit,'ok:','LineWidth',1,'MarkerSize',8, ... 
    'MarkerEdgeColor', 'k', 'MarkerFaceColor', [29, 191, 151]/255)
legend('Real value','Predicted value')
xlabel('Observation');
ylabel('Prediction');

figure
stem(yfit-yt,'ok-.','LineWidth',1,'MarkerSize',8, ...
    'MarkerEdgeColor', 'k', 'MarkerFaceColor', [254, 67, 101]/255)
xlabel('Observation');
ylabel('Residual');