load gyro_data.mat

[ax, taux] = allanvar(gyro_data(1,:),'octave',20);
[ay, tauy] = allanvar(gyro_data(2,:),'octave',20);
[az, tauz] = allanvar(gyro_data(3,:),'octave',20);

figure(1)
loglog(taux,ax)
hold on
loglog(tauy,ay)
loglog(tauz,az)
legend('x', 'y', 'z')

sigma_arw = 4.4e-4;
sigma_rrw = 1.8e-6;

arw_noise = sigma_arw*randn(length(gyro_data),1);
rrw_noise = cumsum(sigma_rrw*randn(length(gyro_data),1));
noise = arw_noise+rrw_noise;
%[an, taun] = allanvar(arw_noise,'octave',20);
%[an, taun] = allanvar(rrw_noise,'octave',20);
[an, taun] = allanvar(noise,'octave',20);

figure(2)
loglog(tauy,ay)
hold on
loglog(taun,an)
legend('y','noise')