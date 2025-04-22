channel = DeepMIMO_dataset{3}.user{1}.channel;

channel_plot = abs(squeeze(channel(:, 1, 1, :)));
subcarriers = 1:dataset_params.OFDM_sampling_factor:dataset_params.OFDM_limit;
OFDM_symbols = 1:1:(14*dataset_params.CDL_5G.num_slots);

figure;

subplot(2 ,1, 1);
surf(OFDM_symbols, subcarriers, channel_plot');
shading('flat');
xlabel('OFDM Symbols');
ylabel('Subcarriers');
zlabel('|H|');
title('Channel Magnitude Response');
view(-75, 35)


subplot(2,1,2);
imagesc(OFDM_symbols, subcarriers, channel_plot');
set(gca,'YDir','normal') % Invert Y axis (subcarriers)
shading('flat');
xlabel('OFDM Symbols');
ylabel('Subcarriers');
zlabel('|H|');
title('Channel Magnitude Response');
view(0, 90)
