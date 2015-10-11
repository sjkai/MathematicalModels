function stop = saplotbestfx(options,optimvalues,flag)
%SAPLOTBESTF PlotFcn to plot best function value.
%   STOP = SAPLOTBESTF(OPTIONS,OPTIMVALUES,FLAG) where OPTIMVALUES is a
%   structure with the following fields:
%              x: current point
%           fval: function value at x
%          bestx: best point found so far
%       bestfval: function value at bestx
%    temperature: current temperature
%      iteration: current iteration
%      funccount: number of function evaluations
%             t0: start time
%              k: annealing parameter
%
%   OPTIONS: The options structure created by using SAOPTIMSET
%
%   FLAG: Current state in which PlotFcn is called. Possible values are:
%           init: initialization state
%           iter: iteration state
%           done: final state
%
%   STOP: A boolean to stop the algorithm.
%
%   Example:
%    Create an options structure that will use SAPLOTBESTF
%    as the plot function
%     options = saoptimset('PlotFcns',@saplotbestf);

%   Copyright 2006-2010 The MathWorks, Inc.


stop = false;
switch flag
    case 'init'
        plotBest = plot(optimvalues.iteration,optimvalues.bestfval);
        set(plotBest,'Tag','saplotbestf');
        xlabel('Iteration','interp','none');
        ylabel('Function value','interp','none')
        title(sprintf('Best Function Value: %g',optimvalues.bestfval),'interp','none');
    case 'iter'
        plotBest = findobj(get(gca,'Children'),'Tag','saplotbestf');
        newX = [get(plotBest,'Xdata') optimvalues.iteration];
        newY = [get(plotBest,'Ydata') optimvalues.bestfval];
        set(plotBest,'Xdata',newX, 'Ydata',newY);
        set(get(gca,'Title'),'String',sprintf('Best Function Value: %g',optimvalues.bestfval));
end
