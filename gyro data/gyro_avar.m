load gyro_data.mat

[ax, taux] = allanvar(gyro_data(1,:),'octave',20);
[ay, tauy] = allanvar(gyro_data(2,:),'octave',20);
[az, tauz] = allanvar(gyro_data(3,:),'octave',20);

figure(1)
loglog(taux,sqrt(ax),'LineWidth',2)
hold on
loglog(tauy,sqrt(ay),'LineWidth',2)
loglog(tauz,sqrt(az),'LineWidth',2)
legend('x', 'y', 'z')