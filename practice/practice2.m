% Practice 2

%% For loop examples
disp('--- loop with 1 step ---');
for i=1:10 % step 1
<<<<<<< Updated upstream
	fprintf('%2i\n',i)
=======
        fprintf('%2i\n',i)
>>>>>>> Stashed changes
end

disp('--- loop with 10 steps ---')
for i=10:10:100
    fprintf('%2i\n',i)
end

disp('--- loop with -2 steps ---')
for i=100:-2:80
<<<<<<< Updated upstream
	fprintf('%2i\n',i)
=======
        fprintf('%2i\n',i)
>>>>>>> Stashed changes
end

%% Plot, axes, labels, font size
F1=@(x)cos(x)
F2=@(x)-sin(x)
F3=@(x)-cos(x)

fplot(F1,[0 2*pi],'color','b','LineWidth',2); % b defines color blue
hold on % uses this to plot over the previous plot
fplot(F2,[0 2*pi],'color','r','LineWidth',2); % r defines color red
fplot(F3,[0 2*pi],'color','k','LineWidth',2); % k defines color black
hold off

ax=gca; % get handle to current axis
ylim([-1.2 1.2]); % limits Y-axis
ax.XAxis.FontSize=16;
ax.YAxis.FontSize=16;
ytickformat('%2f');
ylabel('Y','FontSize',18);
xlabel('alpha \alpha','FontSize',18);

saveas(gcf, 'sin_cos_example.png')

%% Find the extremes of the function
% define function
syms x
f = @(x) x.^3 - x.^2 - 2*x + 1;

% dofferemtiation, x is variable
df=diff(f,x);

% find roots >> df(x)=0
sf=solve(df==0)

% evaluate
xs=eval(sf)

% y value of original function
ys=f(xs)

%% Plot function and roots
% use xs and ys, scatter plot
close all
fplot(f,[-2 2.5],'LineWidth',2)
xlabel('X','FontSize',18)
ylabel('Y','FontSize',18)
hold on
scatter(xs,ys,5,'color','r','filled');
scatter(xs,ys,5,'red','filled');
grid on;
hold off;
ax=gca;
%xlim([0.0 5.1])
%ylim([80 200])
ax.XAxis.FontSize=16;
ax.YAxis.FontSize=16;

saveas(gcf,'function_root.png')