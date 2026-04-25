%% ========================================================================
%  ANN–GWO MPPT Optimization for PV Systems
%  Author: Mustafa A. Kamoona
%  Description:
%  This script performs ANN weight optimization using Grey Wolf Optimizer
%  for Maximum Power Point Tracking (MPPT) in PV systems.
%
%  Requirements:
%  - MATLAB R2022b or newer
%  - Simulink model: 'pv_model.slx' (rename accordingly)
%
% ========================================================================

clear; clc;

%% -------------------- USER SETTINGS -------------------------------------
GW  = 50;      % Number of Grey Wolves
S   = 400;     % Max iterations
dim = 36;      % ANN weights

lb = -10 * ones(1, dim);   % Lower bounds
ub = 100 * ones(1, dim);   % Upper bounds

simulink_model = 'pv_model.slx';   % <-- CHANGE THIS NAME

%% -------------------- RUN OPTIMIZATION ----------------------------------
fprintf('Starting ANN-GWO optimization...\n');

[Best_score, best_weights, curve] = GWO(GW, S, lb, ub, dim, ...
    @(x) obj(x, simulink_model));

fprintf('\nOptimization Completed!\n');

%% -------------------- SAVE RESULTS --------------------------------------
assignin('base', 'ANN_weights', best_weights);

disp('Best Weights:')
disp(best_weights)

disp('Best Objective Value:')
disp(Best_score)

% Save results
save('ANN_GWO_results.mat', 'best_weights', 'Best_score', 'curve');

%% -------------------- PLOT CONVERGENCE ----------------------------------
figure;
plot(curve, 'LineWidth', 2);
xlabel('Iteration');
ylabel('Best Cost');
title('GWO Convergence Curve');
grid on;

%% ========================================================================
%  OBJECTIVE FUNCTION
% ========================================================================
function Err = obj(x, model_name)

    % Send weights as a vector (clean way)
    assignin('base', 'ANN_weights', x);

    % Run Simulink model
    try
        simOut = sim(model_name, 'StopTime', '1');
    catch
        error('Simulink model not found or failed to run.');
    end

    % ---------------------------------------------------------------------
    % IMPORTANT:
    % You MUST define these signals inside your Simulink model:
    %   - power_error  (tracking error)
    %   - voltage_error (voltage deviation)
    %
    % Use "To Workspace" blocks with same names.
    % ---------------------------------------------------------------------

    try
        e  = simOut.power_error;
        ep = simOut.voltage_error;
    catch
        error('Required signals (power_error, voltage_error) not found.');
    end

    % Compute cost
    e1  = sum(abs(e));
    ep2 = sum(abs(ep));

    % Weighted objective
    Err = 0.2 * e1 + 0.5 * ep2;

end
