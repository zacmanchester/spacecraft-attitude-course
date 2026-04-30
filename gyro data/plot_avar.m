load gyro_data.mat

[ay, tauy] = allanvar(gyro_data(2,:),'octave',20);

sigma_arw = 1.0e-3; %3.8e-4;
arw_noise = sigma_arw*randn(10*length(gyro_data),1);
[an, taun] = allanvar(arw_noise,'octave',20);

%sigma_brw = 1.0e-5 %1.8e-6;
%brw_noise = cumsum(sigma_brw*randn(10*length(gyro_data),1));
%brw_noise = zeros(10*length(gyro_data),1);
%for k = 1:(10*length(gyro_data) - 1)
%    brw_noise(k+1) = brw_noise(k) + sigma_brw*randn();
%end
%[an, tau] = allanvar(brw_noise,'octave',20);

%noise = arw_noise + brw_noise;
%[an, tau] = allanvar(noise,'octave',20);

figure(1)
loglog(tauy,sqrt(ay),'LineWidth',2)
hold on
loglog(taun,sqrt(an),'LineWidth',2)
