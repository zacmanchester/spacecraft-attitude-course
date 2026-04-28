load gyro_data.mat

[ax, taux] = allanvar(gyro_data(1,:),'octave',20);
[ay, tauy] = allanvar(gyro_data(2,:),'octave',20);
[az, tauz] = allanvar(gyro_data(3,:),'octave',20);

figure(1)
loglog(taux,sqrt(ax))
hold on
loglog(tauy,sqrt(ay))
loglog(tauz,sqrt(az))
legend('x', 'y', 'z')

sigma_arw = 4.3e-4;
sigma_rrw = 1.9e-6;

arw_noise = sigma_arw*randn(length(gyro_data),1);
brw_noise = cumsum(sigma_rrw*randn(length(gyro_data),1));
noise = arw_noise+brw_noise;
%[an, taun] = allanvar(arw_noise,'octave',20);
%[an, taun] = allanvar(brw_noise,'octave',20);
[an, taun] = allanvar(noise,'octave',20);

figure(2)
loglog(tauy,sqrt(ax))
hold on
loglog(taun,sqrt(an))
legend('x','noise fit')

figure(3)
loglog(tauy,sqrt(ay))
hold on
loglog(taun,sqrt(an))
legend('y','noise fit')

%figure(4)
%loglog(tauz,sqrt(az))
%hold on
%loglog(taun,sqrt(an))
%legend('z','noise fit')