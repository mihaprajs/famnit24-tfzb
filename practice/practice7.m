%% Practice 7

f = @(x) x.^2;

fplot(f,[-10 10],'color','b','LineWidth',2);

X = 1:1:100;
Y = X.^2;
figure
scatter(X,Y,10,'red','filled')
ax = gca;
ax.XAxis.FontSize=16;
ax.YAxis.FontSize=16;

%% random nums generator
rand
rand(10,1)
rand(10,2)

% random nums on interval [0,1]


%% Montecarlo approach
N = 0;
niter = 1000;
XYin = NaN(niter,2);
XYout = NaN(niter,2);
XYall = NaN(niter,2);

S = NaN(niter,2);
RE = NaN(niter,2);
disp('    Iter    Surface     Error(%)');

for n = 1:niter
    x = rand;
    y = rand;
    XYall(n,1) = x;
    XYall(n,2) = y;
    if y <= (x^2)
        XYin(n,1) = x;
        XYin(n,2) = y;
        N = N + 1;
    else
        XYout(n,1) = x;
        XYout(n,2) = y;
    end
    S(n) = N/n;
    RE(n) = (S(n) / (1/3) - 1) * 100;
end