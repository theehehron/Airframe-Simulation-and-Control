function plot_airframe_states(simTime, simX, ylims)

% plot all 9 states
tiledlayout(3, 3)
for i = 1:9
    subplot(3, 3, i) % create 3x3 grid. ith grid is ith state
    plot(simTime, simX(:,i), "LineWidth", 2, "LineStyle", "-"); % plot ith state
    hold on;
    title(strcat("x_", num2str(i)))
    xlabel('Time (s)')
    % set y label with correct units for each state
    if i <4 % states 1:3 are velocities
        ylabel(strcat('x_', num2str(i), ' (m/s)'))
    elseif i < 7 % states 4:6 are angular rates
        ylabel(strcat('x_', num2str(i), ' (rad/s)'))
    else % states 7:9 are angles
        ylabel(strcat('x_', num2str(i), ' (rad)'))
    end
    
    if nargin == 3
        ylim(ylims(i, :))
    end
%     if i == 1
%         ylim([-50 150]);
%     elseif i == 3
%         ylim([-30,30])
%     elseif i == 7 || i ==9
%         ylim([-pi,pi])
%     elseif i == 8
%         ylim([-10 10])
%     end
end

end % plot_RCAM_states