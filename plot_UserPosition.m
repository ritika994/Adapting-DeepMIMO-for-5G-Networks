% File: plot_UserPositionVelocity.m
% Description: Plots the BS location, UE location, and UE velocity vector

% 1. Load dataset (adjust indices as needed)
bs_loc        = DeepMIMO_dataset{3}.loc;              % [x, y, z] of BS 3
ue_loc        = DeepMIMO_dataset{3}.user{1}.loc;      % [x, y, z] of UE 1
dir_angles    = DeepMIMO_dataset{3}.user{1}.path_params.travel_dir;  % [azimuth; elevation] in degrees
speed_kmh     = DeepMIMO_dataset{3}.user{1}.path_params.velocity;    % speed in km/h

% 2. Convert speed to m/s
speed_ms = speed_kmh / 3.6;   % 1 km/h = 1/3.6 m/s

% 3. Convert angles from degrees to radians
az_rad = deg2rad(dir_angles(1));   % azimuth in radians :contentReference[oaicite:0]{index=0}
el_rad = deg2rad(dir_angles(2));   % elevation in radians :contentReference[oaicite:1]{index=1}

% 4. Build unit‐direction vector in Cartesian coordinates
%    x = cos(el)*cos(az), y = cos(el)*sin(az), z = sin(el)
ux = cos(el_rad) * cos(az_rad);    % unit‐vector X component :contentReference[oaicite:2]{index=2}
uy = cos(el_rad) * sin(az_rad);    % unit‐vector Y component :contentReference[oaicite:3]{index=3}
uz = sin(el_rad);                  % unit‐vector Z component :contentReference[oaicite:4]{index=4}

% 5. Scale by speed to get velocity vector [vx; vy; vz]
v_xyz = speed_ms * [ux; uy; uz];

% 6. Plot BS, UE, and velocity arrow
figure;
scatter3(bs_loc(1), bs_loc(2), bs_loc(3), 100, 'bo', 'LineWidth', 1.5); 
hold on;
scatter3(ue_loc(1), ue_loc(2), ue_loc(3), 100, 'rx', 'LineWidth', 1.5);
% quiver3: arrows at (X,Y,Z) with components (U,V,W) :contentReference[oaicite:5]{index=5}
quiver3(ue_loc(1), ue_loc(2), ue_loc(3), ...
        v_xyz(1),  v_xyz(2),  v_xyz(3), ...
        1, 'k', 'LineWidth', 1.2, 'MaxHeadSize', 0.5);
grid on; axis equal;
xlabel('x (m)'); ylabel('y (m)'); zlabel('z (m)');
legend('BS location','UE location','UE velocity','Location','best');
title('BS & UE Positions with UE Velocity Vector');
