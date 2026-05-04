load gyro_data.mat

[ay, tauy] = allanvar(gyro_data(2,:),'octave',20);

sigma_arw = 3.8e-4;
sigma_b1 = 4.0e-6;
sigma_b2 = 1.8e-6;

arw_noise = sigma_arw*randn(10*length(gyro_data),1);

b1_noise = zeros(10*length(gyro_data),1);
b2_noise = zeros(10*length(gyro_data),1);
for k = 1:(10*length(gyro_data)-1)
    b1_noise(k+1) = 0.993*b1_noise(k) + sigma_b1*randn();
    b2_noise(k+1) = 0.99993*b2_noise(k) + sigma_b2*randn();
end

noise = arw_noise+b2_noise+b1_noise;
[arw, taunrw] = allanvar(arw_noise,'octave',20);
[ab1, taunb1] = allanvar(b1_noise,'octave',20);
[ab2, taunb2] = allanvar(b2_noise,'octave',20);
[an, taun] = allanvar(noise,'octave',20);

figure(1)
loglog(tauy,sqrt(ay),'LineWidth',2)
hold on
loglog(taunrw,sqrt(arw),'LineWidth',2)
loglog(taunb1,sqrt(ab1),'LineWidth',2)
loglog(taunb2,sqrt(ab2),'LineWidth',2)
loglog(taun,sqrt(an),'LineWidth',2)