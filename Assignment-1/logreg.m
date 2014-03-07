%% BITS Pilani Goa Campus Test 1 Machine Learning 2014: Logistic Regression

%% Initialization
clear ; close all; clc

%% Load Data
%  The first two columns contains the exam scores and the third column
%  contains the label.

data = load('schooldata.txt');
X = vertcat(data(1:100), data(101,200));
y = data(201:300);

%% ==================== Part 1: Plotting ====================
%  We start the exercise by first plotting the data to understand the problem we are working with.

fprintf('Now this code plots data with [+] signifying (y = 1) examples and [o] indicating (y = 0) examples.\n');

plotData(X, y);
%%%%______ q3. Run code till here. You need not write code here. What do the four lines of code in plotData.m do? (2 mark)

% Put some labels 
hold on;
% Labels and Legend
xlabel('Exam 1 score')
ylabel('Exam 2 score')

% Specified in plot order
legend('Admitted', 'Not admitted')
hold off;

fprintf('\nProgram paused. Press enter to continue.\n');
pause;


%% ============ Part 2: Compute Cost and Gradient ============
%  In this part of the exercise, you will calculate the cost and gradient for logistic regression.

%  Setup the data matrix appropriately, and add ones for the intercept term

m = 100;
n = 2;
a =[];
a(1:100) = 1;
X.vercat(a);
% Initialize fitting parameters.
initial_theta = zeros(n + 1, 1);

% Compute and display initial cost and gradient
[cost, grad] = costFunction(initial_theta, X, y); 
%%%%______ q6 and q7 inside function costFunction

fprintf('Cost at initial theta (zeros): %f\n', cost);
fprintf('Gradient at initial theta (zeros): \n');
fprintf(' %f \n', grad);

fprintf('\nProgram paused. Press enter to continue.\n');
pause;


%% ============= Part 3: Optimizing using fminunc  =============

%  Set options for fminunc
options = optimset('GradObj', 'on', 'MaxIter', 400);

%  Run fminunc to obtain the optimal theta
%  This function will return theta and the cost 
[theta, cost] = ...
	fminunc(@(t)(costFunction(t, X, y)), initial_theta, options);

% Print theta to screen
fprintf('Cost at theta found by fminunc: %f\n', cost);
fprintf('theta: \n');
fprintf(' %f \n', theta);
%%%%______ q8. Run code till here. You need not write code here. What are the inputs to the fminunc function?  
%%%%______     Why has the GradObj been set to on? What does @(t) signify? Is this method better than Gradient Descent(4 mark)
% Plot Boundary
plotDecisionBoundary(theta, X, y);

% Put some labels 
hold on;
% Labels and Legend
xlabel('Exam 1 score')
ylabel('Exam 2 score')

% Specified in plot order
legend('Admitted', 'Not admitted')
hold off;

fprintf('\nProgram paused. Press enter to continue.\n');
pause;

%% ============== Part 4: Predict and Accuracies ==============
%  After learning the parameters, you'll like to use it to predict the outcomes
%  on unseen data. In this part, you will use the logistic regression model
%  to predict the probability that a student with score 45 on exam 1 and 
%  score 85 on exam 2 will be admitted.
%
%  Furthermore, you will compute the training and test set accuracies of 
%  our model.
%
%  Predict probability for a student with score 45 on exam 1 
%  and score 85 on exam 2 

prob = sigmoid([1 45 85] * theta);
fprintf(['For a student with scores 45 and 85, we predict an admission ' ...
         'probability of %f\n\n'], prob);

% Compute accuracy on our training set
p = predict(theta, X);

fprintf('Train Accuracy: %f\n', mean(double(p == y)) * 100);

fprintf('\nProgram paused. Press enter to continue.\n');
pause;

%% BITS Pilani Goa Campus Test 1 Machine Learning: Logistic Regression