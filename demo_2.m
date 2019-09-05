%%%%%%%%%%      Gaussian Process Regression (GPR)               %%%%%%%%%
% Demo: prediction using GPR
% ---------------------------------------------------------------------%

clc
close all
clear all
addpath(genpath(pwd))

% load data
%{
x :   training inputs
y :   training targets
xt:   testing inputs
yt:   testing targets
%}

% multiple input-multiple output
load('./data/data_2.mat')


% Set the mean function, covariance function and likelihood function
% Take meanConst, covRQiso and likGauss as examples
meanfunc = @meanConst;
covfunc = @covRQiso; 
likfunc = @likGauss; 

% Initialization of hyperparameters
hyp = struct('mean', 3, 'cov', [2 2 2], 'lik', -1);



% meanfunc = [];
% covfunc = @covSEiso; 
% likfunc = @likGauss; 
% 
% hyp = struct('mean', [], 'cov', [0 0], 'lik', -1);


% Optimization of hyperparameters
hyp2 = minimize(hyp, @gp, -5, @infGaussLik, meanfunc, covfunc, likfunc,x, y);

% Regression using GPR
% yfit is the predicted mean, and ys is the predicted variance
[yfit ys] = gp(hyp2, @infGaussLik, meanfunc, covfunc, likfunc,x, y, xt);

% Visualization of prediction results
% First output
plotResult(yt(:,1), yfit(:,1))
% Second output
plotResult(yt(:,2), yfit(:,2))