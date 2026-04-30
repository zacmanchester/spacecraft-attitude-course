load imu_data.mat

N = length(mag_data);

mean_mag = zeros(3,1);
mean_acc = zeros(3,1);


mag_n = zeros(3,N);
acc_n = zeros(3,N);
for k = 1:N
    mag_n(:,k) = mag_data(:,k)/norm(mag_data(:,k));
    acc_n(:,k) = acc_data(:,k)/norm(acc_data(:,k));
end


for k = 1:N
    mean_mag = mean_mag + (1/N)*mag_n(:,k);
    mean_acc = mean_acc + (1/N)*acc_n(:,k);
end



W_mag = zeros(3,3);
W_acc = zeros(3,3);

for k = 1:N
    W_mag = W_mag + (1/(N-1))*(mag_n(:,k)-mean_mag)*(mag_n(:,k)-mean_mag)';
    W_acc = W_acc + (1/(N-1))*(acc_n(:,k)-mean_acc)*(acc_n(:,k)-mean_acc)';
end
