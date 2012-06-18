function [C, sigma] = dataset3Params(X, y, Xval, yval)
%EX6PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = EX6PARAMS(X, y, Xval, yval) returns your choice of C and 
%   sigma. You should complete this function to return the optimal C and 
%   sigma based on a cross-validation set.
%

% You need to return the following variables correctly.
C = 1;
sigma = 0.3;

% ====================== YOUR CODE HERE ======================
% Instructions: Fill in this function to return the optimal C and sigma
%               learning parameters found using the cross validation set.
%               You can use svmPredict to predict the labels on the cross
%               validation set. For example, 
%                   predictions = svmPredict(model, Xval);
%               will return the predictions on the cross validation set.
%
%  Note: You can compute the prediction error using 
%        mean(double(predictions ~= yval))
%

VALUES_TO_TRY = [0.01,0.03,0.1,0.3,1,3,10,30]

best_error = 10;

for try_c = VALUES_TO_TRY
    for try_sigma = VALUES_TO_TRY
        model = svmTrain(X, y, try_c, @(x1,x2) gaussianKernel(x1,x2,try_sigma));
        predictions = svmPredict(model, Xval);
        if mean(double(predictions ~= yval)) < best_error
            best_error = mean(double(predictions ~= yval));
            C = try_c;
            sigma = try_sigma;
        endif
    endfor
endfor

C
sigma





% =========================================================================

end
