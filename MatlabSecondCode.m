%% Import Data

Rahydro = readtable("Ra_hydro.csv");

%% create plot
figure; hold on;
errorbar(Rahydro.Distance,Rahydro.Ra_He,Rahydro.Ra_HeError,'o','Color','k');
scatter(Rahydro.Distance,Rahydro.Ra_He,100,'o','filled');

%% calcuate fit
[f gof] = fit(Rahydro.Distance,Rahydro.Ra_He,'exp1')
plot(f,Rahydro.Distance,Rahydro.Ra_He)

%% exlude some points
excluded = [8,9];
[f gof] = fit(Rahydro.Distance,Rahydro.Ra_He,'exp1','Exclude',excluded)
figure;
plot(f,Rahydro.Distance,Rahydro.Ra_He,excluded)

%% re-calc with error bar
W = 1./(Rahydro.Ra_HeError).^2;
excluded = [8,9];
[f gof] = fit(Rahydro.Distance,Rahydro.Ra_He,'exp1','Exclude',excluded)
figure;
plot(f,Rahydro.Distance,Rahydro.Ra_He,excluded)