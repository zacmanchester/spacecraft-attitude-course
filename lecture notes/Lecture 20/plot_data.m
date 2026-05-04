load gyro_data.mat

figure(1)
plot(gyro_data(1,:))
hold on
plot(gyro_data(2,:))
plot(gyro_data(3,:))
legend('x', 'y', 'z')