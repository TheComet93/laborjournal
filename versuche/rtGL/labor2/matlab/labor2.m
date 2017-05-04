close all, clear all;
s = tf('s');

% subroutines are located in this folder
addpath([pwd,'/system_identification']);

% Static Kennlinienaufnahme
% Measured by hand
voltage_static = [-13, -12, -10, -7, -5, -2, -1, -0.5, 0, 0.5, 1, 2, 5, 7, 10, 12, 13];
rpm_static = [-305, -290, -240, -166, -117, -46, -19.5, -7.5, 0, 6.4, 18.2, 43, 115, 167, 239, 289, 305];

% figure;
% plot(voltage_static, rpm_static, 'b'); hold on, grid on, grid minor
% scatter(voltage_static, rpm_static, 'p');
% set(gcf, 'Units', 'Inches', 'Position', [0, 0, 6, 6], 'PaperUnits', 'Inches', 'PaperSize', [6, 6]);
% axis square
% xlabel('\fontsize{14}Input Voltage (V)');
% ylabel('\fontsize{14}Measured Motor Settling Speed (rpm)');
% title('\fontsize{16}Static Characteristic Curve of Motor');

% Step response from 2V to 10V
time = [0.10836, 0.30878, 0.50909, 0.70948, 0.90974, 1.0098, 1.1101, 1.2102, 1.3104, 1.4106, 1.5107, 1.6108, 1.711, 1.8112, 1.9113, 2.0115, 2.1116, 2.2118, 2.3119, 2.4121, 2.5122, 2.6124, 2.7125, 2.8127, 2.9129, 3.013, 3.1131, 3.2134, 3.3135, 3.4137, 3.5138, 3.614, 3.7141, 3.8143, 3.9145, 4.0147, 4.1148, 4.215, 4.3152, 4.4154, 4.5155, 4.6157, 4.7158, 4.8159, 4.916, 5.0162, 5.1163, 5.2165, 5.3166, 5.4168, 5.5169, 5.617, 5.7172, 5.8173, 5.9175, 6.0176, 6.1178, 6.218, 6.3182, 6.4183, 6.5184, 6.6185, 6.7187, 6.8189, 6.9191, 7.0193, 7.1195, 7.2196, 7.3197, 7.4198, 7.5199, 7.6201, 7.7202, 7.8204, 7.9205, 8.0206, 8.1207, 8.2208, 8.321, 8.4212, 8.5214, 8.6215, 8.7217, 8.8218, 8.9219, 9.022, 9.1223, 9.2223, 9.3225, 9.4225, 9.5227, 9.6228, 9.7229, 9.8231, 9.9232, 10.023, 10.124, 10.224, 10.324, 10.424, 10.524, 10.624, 10.724, 10.824, 10.925, 11.025, 11.125, 11.225, 11.325, 11.425, 11.525, 11.626, 11.726, 11.826, 11.926, 12.026, 12.126, 12.226, 12.327, 12.427, 12.527, 12.627, 12.727, 12.827, 12.927, 13.028, 13.128, 13.228, 13.328, 13.428, 13.528, 13.628, 13.729, 13.829, 13.929, 14.029, 14.129, 14.229, 14.33, 14.43, 14.53, 14.63, 14.73, 14.83, 14.93, 15.031, 15.131, 15.231, 15.331, 15.431, 15.531, 15.631, 15.732, 15.832, 15.932, 16.032, 16.132, 16.232, 16.332, 16.433, 16.533, 16.633, 16.733, 16.833, 16.933, 17.033, 17.134, 17.234, 17.334, 17.434, 17.534, 17.634, 17.735, 17.835, 17.935, 18.035, 18.135, 18.235, 18.335, 18.436, 18.536, 18.636, 18.736, 18.836, 18.936, 19.036, 19.137, 19.237, 19.337, 19.437, 19.537, 19.637, 19.737, 19.837, 19.938, 20.038, 20.138, 20.238, 20.338, 20.438, 20.538, 20.639, 20.739, 20.839, 20.939, 21.039, 21.139, 21.24, 21.34, 21.44, 21.54, 21.64, 21.74, 21.84, 21.94, 22.041, 22.141, 22.241, 22.341, 22.441, 22.541, 22.641, 22.742, 22.842, 22.942, 23.042, 23.142, 23.242, 23.342, 23.443, 23.543, 23.643, 23.743, 23.843, 23.943, 24.043, 24.143, 24.244, 24.344, 24.444, 24.544, 24.644, 24.744, 24.845, 24.945, 25.045, 25.145, 25.245, 25.345, 25.446, 25.546, 25.646, 25.746, 25.846, 25.946, 26.046, 26.147, 26.247, 26.347, 26.447, 26.547, 26.647, 26.748, 26.848, 26.948, 27.048, 27.148, 27.248, 27.348, 27.448, 27.549, 27.649, 27.749, 27.849, 27.949, 28.049, 28.15, 28.25, 28.35, 28.45, 28.55, 28.65, 28.75, 28.851, 28.951, 29.051, 29.151, 29.251, 29.351, 29.452, 29.552, 29.652, 29.752, 29.852, 29.952, 30.052, 30.152, 30.253, 30.353, 30.453, 30.553, 30.653, 30.753, 30.854, 30.954, 31.054, 31.154, 31.254, 31.354, 31.454, 31.555, 31.655, 31.755, 31.855, 31.955, 32.055, 32.156, 32.256, 32.356, 32.456, 32.556, 32.656, 32.756, 32.857, 32.957, 33.057, 33.157, 33.257, 33.357, 33.457, 33.558, 33.658, 33.758, 33.858, 33.958, 34.058, 34.158, 34.259, 34.359, 34.459, 34.559, 34.659, 34.759, 34.859, 34.96, 35.06, 35.16, 35.26, 35.36, 35.46, 35.56, 35.661, 35.761, 35.861, 35.961, 36.061, 36.161, 36.261, 36.362, 36.462, 36.562, 36.662, 36.762, 36.862, 36.962, 37.062, 37.163, 37.263, 37.363, 37.463, 37.563, 37.663, 37.764, 37.864, 37.964, 38.064, 38.164, 38.264, 38.365, 38.465, 38.565, 38.665, 38.765, 38.865, 38.966, 39.066, 39.166, 39.266, 39.366, 39.466, 39.566, 39.667, 39.767, 39.867, 39.967, 40.067, 40.167, 40.267, 40.368, 40.468, 40.568, 40.668, 40.768, 40.868, 40.968, 41.069, 41.169, 41.269, 41.369, 41.469, 41.569, 41.669, 41.77, 41.87, 41.97, 42.07, 42.17, 42.27, 42.37, 42.471, 42.571, 42.671, 42.771, 42.871, 42.972, 43.072, 43.172, 43.272, 43.372, 43.472, 43.573, 43.673, 43.773, 43.873, 43.973, 44.073, 44.173, 44.274, 44.374, 44.474, 44.574, 44.674, 44.774, 44.874, 44.975, 45.075, 45.175, 45.275, 45.375, 45.475, 45.575, 45.675, 45.776, 45.876, 45.976, 46.076, 46.176, 46.277, 46.377, 46.477, 46.577, 46.677, 46.777, 46.877, 46.977, 47.078, 47.178, 47.278, 47.378, 47.478, 47.578, 47.679, 47.779, 47.879, 47.979, 48.079, 48.179, 48.279, 48.38, 48.48, 48.58, 48.68, 48.78, 48.881, 48.981, 49.081, 49.181, 49.281, 49.381, 49.481, 49.581, 49.682, 49.782, 49.882, 49.982, 50.082, 50.182, 50.283, 50.383, 50.483, 50.583, 50.683, 50.783, 50.884, 50.984, 51.084, 51.184, 51.284, 51.384, 51.485, 51.585, 51.685, 51.785, 51.885, 51.985, 52.086, 52.186, 52.286, 52.386, 52.486, 52.586, 52.687, 52.787, 52.887, 52.987, 53.087, 53.188, 53.288, 53.388, 53.488, 53.588, 53.688, 53.789, 53.889, 53.989, 54.089, 54.189, 54.289, 54.39, 54.49, 54.59, 54.69, 54.79, 54.89, 54.991, 55.091, 55.191, 55.291, 55.391, 55.491, 55.591, 55.691, 55.792, 55.892, 55.992, 56.092, 56.192, 56.292, 56.392, 56.492, 56.593, 56.693, 56.793, 56.893, 56.993, 57.093, 57.193, 57.294, 57.394, 57.494, 57.594, 57.694, 57.794, 57.894, 57.994, 58.095, 58.195, 58.295, 58.395, 58.495, 58.595, 58.695, 58.796, 58.896, 58.996, 59.096, 59.196, 59.296, 59.397, 59.497, 59.597, 59.697, 59.797, 59.897, 59.997, 60.097, 60.198, 60.298, 60.398, 60.498, 60.598, 60.698, 60.799, 60.899, 60.999, 61.099, 61.199, 61.299, 61.4, 61.5, 61.6, 61.7, 61.8, 61.9, 62, 62.101, 62.201, 62.301, 62.401, 62.501, 62.601, 62.702, 62.802, 62.902, 63.002, 63.102, 63.202, 63.303, 63.403, 63.503, 63.603, 63.703, 63.803, 63.903, 64.004, 64.104, 64.204, 64.304, 64.404, 64.504, 64.605, 64.705, 64.805, 64.905, 65.005, 65.106, 65.206, 65.306, 65.406, 65.506, 65.606, 65.707, 65.807, 65.907, 66.007, 66.107, 66.207, 66.308, 66.408, 66.508, 66.608, 66.708, 66.808, 66.909, 67.009, 67.109, 67.209, 67.309, 67.409, 67.51, 67.61, 67.71, 67.81, 67.91, 68.01, 68.111, 68.211, 68.311, 68.411, 68.511, 68.611, 68.711, 68.811, 68.912, 69.012, 69.112, 69.212, 69.312, 69.412, 69.512, 69.613, 69.713, 69.813, 69.913, 70.013, 70.113, 70.213, 70.313, 70.414, 70.514, 70.614, 70.714, 70.814, 70.914, 71.015, 71.115, 71.215, 71.315, 71.415, 71.515, 71.615, 71.716, 71.816, 71.916, 72.016, 72.116, 72.216, 72.317, 72.417, 72.517, 72.617, 72.717, 72.817, 72.917, 73.018, 73.118, 73.218, 73.318, 73.418, 73.518, 73.619, 73.719, 73.819, 73.919, 74.019, 74.119, 74.22, 74.32, 74.42, 74.52, 74.62, 74.72, 74.82, 74.921, 75.021, 75.121, 75.221, 75.321, 75.421, 75.521, 75.622, 75.722, 75.822, 75.922, 76.022, 76.122, 76.222, 76.323, 76.423, 76.523, 76.623, 76.723, 76.823, 76.923, 77.024, 77.124, 77.224, 77.324, 77.424, 77.524, 77.624, 77.725, 77.825, 77.925, 78.025, 78.125, 78.225, 78.325, 78.426, 78.526, 78.626, 78.726, 78.826, 78.926, 79.026, 79.127, 79.227, 79.327, 79.427, 79.527, 79.627, 79.727, 79.828, 79.928, 80.028, 80.128, 80.228, 80.328, 80.429, 80.529, 80.629, 80.729, 80.829, 80.929, 81.03, 81.13, 81.23, 81.33, 81.43, 81.53, 81.631, 81.731, 81.831, 81.931, 82.031, 82.131, 82.231, 82.332, 82.432, 82.532, 82.632, 82.732, 82.832, 82.933, 83.033, 83.133, 83.233, 83.333, 83.434, 83.534, 83.634, 83.734, 83.834, 83.934, 84.034, 84.135, 84.235, 84.335, 84.435, 84.535, 84.635, 84.736, 84.836, 84.936, 85.036, 85.136, 85.236, 85.336, 85.437, 85.537, 85.637, 85.737, 85.837, 85.937, 86.037, 86.138, 86.238, 86.338, 86.438, 86.538, 86.638, 86.739, 86.839, 86.939, 87.039, 87.139, 87.239, 87.34, 87.44, 87.54, 87.64, 87.74, 87.84, 87.94, 88.041, 88.141, 88.241, 88.341, 88.441, 88.541, 88.642, 88.742, 88.842, 88.942, 89.042, 89.142, 89.242, 89.342, 89.443, 89.543, 89.643, 89.743, 89.843, 89.944, 90.044, 90.144, 90.244, 90.344, 90.444, 90.545, 90.645, 90.745, 90.845, 90.945, 91.045, 91.145, 91.246, 91.346, 91.446, 91.546, 91.646, 91.747, 91.847, 91.947, 92.047, 92.147, 92.247, 92.348, 92.448, 92.548, 92.648, 92.748, 92.848, 92.949, 93.049, 93.149, 93.249, 93.349, 93.449, 93.55, 93.65, 93.75, 93.85, 93.95, 94.05, 94.151, 94.251, 94.351, 94.451, 94.551, 94.651, 94.752, 94.852, 94.952, 95.052, 95.152, 95.252, 95.353, 95.453, 95.553, 95.653, 95.753, 95.853, 95.954, 96.054, 96.154, 96.254, 96.354, 96.454, 96.555, 96.655, 96.755, 96.855, 96.955, 97.055, 97.156, 97.256, 97.356, 97.456, 97.556, 97.656, 97.757, 97.857, 97.957, 98.057, 98.157, 98.257, 98.357, 98.458, 98.558, 98.658, 98.758, 98.858, 98.958, 99.059, 99.159, 99.259, 99.359, 99.459, 99.559, 99.659, 99.76, 99.86, 99.96, 100.06, 100.16, 100.26, 100.36, 100.46, 100.56, 100.66, 100.76, 100.86, 100.96, 101.06, 101.16, 101.26, 101.36, 101.46, 101.56, 101.66, 101.76, 101.86, 101.96, 102.06, 102.16, 102.26, 102.36, 102.46, 102.56, 102.66, 102.76, 102.86, 102.96, 103.07, 103.17, 103.27, 103.37, 103.47, 103.57, 103.67, 103.77, 103.87, 103.97, 104.07, 104.17, 104.27, 104.37, 104.47, 104.57, 104.67, 104.77, 104.87, 104.97, 105.07, 105.17, 105.27, 105.37, 105.47, 105.57, 105.67, 105.77, 105.87, 105.97, 106.07, 106.17, 106.27, 106.37, 106.47, 106.57, 106.67, 106.77, 106.87, 106.97, 107.07, 107.17, 107.27, 107.37, 107.47, 107.57, 107.67, 107.77, 107.87, 107.97, 108.07, 108.17, 108.27, 108.37, 108.47, 108.57, 108.67, 108.77, 108.87, 108.97, 109.07, 109.18, 109.28, 109.38, 109.48, 109.58, 109.68, 109.78, 109.88, 109.98, 110.08, 110.18, 110.28, 110.38, 110.48, 110.58, 110.68, 110.78, 110.88, 110.98, 111.08, 111.18, 111.28, 111.38, 111.48, 111.58, 111.68, 111.78, 111.88, 111.98, 112.08, 112.18, 112.28, 112.38, 112.48, 112.58, 112.68, 112.78, 112.88, 112.98, 113.08, 113.18, 113.28, 113.38, 113.48, 113.58, 113.68, 113.78, 113.88, 113.98, 114.08, 114.18, 114.28, 114.38, 114.48, 114.58, 114.68, 114.78, 114.88, 114.98, 115.09, 115.19, 115.29, 115.39, 115.49, 115.59, 115.69, 115.79, 115.89, 115.99, 116.09, 116.19, 116.29, 116.39, 116.49, 116.59, 116.69, 116.79, 116.89, 116.99, 117.09, 117.19, 117.29, 117.39, 117.49, 117.59, 117.69, 117.79, 117.89, 117.99, 118.09, 118.19, 118.29, 118.39, 118.49, 118.59, 118.69, 118.79, 118.89, 118.99, 119.09, 119.19, 119.29, 119.39, 119.49, 119.59, 119.69, 119.79, 119.89, 119.99, 120.09, 120.19, 120.29, 120.39, 120.49, 120.59, 120.69, 120.79, 120.89, 120.99, 121.09];
voltage = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10];
rpm = [-0.23728, -0.50549, -0.63142, -0.71805, -0.71152, -0.74255, -0.76824, -0.78939, -0.78591, -0.73101, -0.71673, -0.69424, -0.69169, -0.69529, -0.63644, -0.66542, -0.7554, -0.74996, -0.66598, -0.681, -0.68898, -0.70304, -0.7197, -0.74453, -0.753, -0.77297, -0.73734, -0.79902, -0.79435, -0.74217, -0.71984, -0.68906, -0.67249, -0.71501, -0.95475, -0.80169, -0.73153, -0.87424, -0.084379, -0.29693, -0.32548, 0.072599, 1.0817, 2.1598, 3.1485, 4.0965, 4.9105, 3.8612, 5.5282, 4.5111, 6.642, 8.1225, 11.271, 11.383, 11.866, 12.328, 13.03, 13.499, 14.167, 14.686, 15.369, 15.936, 16.541, 17.085, 17.538, 18.19, 18.657, 19.292, 21.026, 20.848, 19.166, 20.281, 21.953, 22.386, 22.689, 23.033, 23.54, 23.935, 24.231, 24.796, 25.215, 25.433, 25.858, 26.242, 26.54, 26.751, 27.267, 27.656, 27.908, 28.135, 28.647, 28.956, 29.217, 29.31, 29.803, 30.128, 30.401, 30.516, 30.849, 31.402, 31.559, 31.842, 31.875, 32.03, 32.445, 32.735, 32.914, 33.092, 33.159, 33.318, 33.791, 34.097, 34.296, 34.423, 34.406, 34.51, 34.852, 35.231, 35.579, 35.694, 35.738, 35.843, 35.838, 35.964, 36.276, 36.627, 36.886, 37.068, 37.128, 37.15, 37.124, 37.143, 37.115, 37.539, 37.876, 38.181, 38.264, 38.349, 38.43, 38.448, 38.511, 38.446, 38.533, 38.536, 38.646, 38.944, 39.288, 39.476, 39.576, 39.684, 39.175, 41.163, 40.582, 40.252, 40.016, 39.911, 39.811, 39.796, 39.733, 39.848, 40.277, 40.521, 40.786, 40.926, 40.949, 40.941, 41.052, 41.042, 41.031, 41.032, 41.026, 41.071, 41.078, 41.109, 41.12, 41.144, 41.109, 41.144, 41.052, 41.038, 40.987, 41.311, 41.83, 42.075, 42.18, 42.276, 42.197, 42.025, 42.065, 42.267, 40.966, 41.561, 41.957, 41.955, 41.882, 41.825, 42.078, 42.281, 42.412, 42.501, 42.52, 42.316, 42.045, 41.952, 42.083, 42.21, 42.186, 42.393, 42.496, 42.526, 42.246, 42.089, 42.161, 42.323, 42.466, 42.495, 42.461, 42.306, 42.137, 42.308, 42.377, 42.333, 42.433, 42.827, 43.115, 43.259, 43.428, 43.437, 43.532, 43.61, 43.652, 43.646, 43.675, 43.666, 43.686, 43.675, 43.681, 43.673, 43.576, 43.557, 43.637, 43.553, 43.484, 43.495, 43.447, 43.617, 43.587, 43.597, 43.617, 43.636, 43.565, 43.655, 43.604, 43.549, 43.621, 43.525, 43.568, 43.585, 43.638, 43.629, 43.663, 43.562, 43.556, 43.557, 43.52, 43.612, 43.615, 43.638, 43.688, 43.625, 43.589, 43.625, 43.536, 43.543, 43.525, 43.78, 43.521, 43.557, 43.568, 43.466, 43.539, 43.533, 43.502, 43.578, 43.619, 43.525, 43.463, 43.542, 43.514, 43.656, 43.645, 43.433, 43.539, 43.581, 43.551, 43.569, 43.622, 43.509, 43.587, 43.66, 43.652, 43.612, 43.568, 43.552, 40.808, 41.925, 42.62, 43.917, 43.826, 43.705, 43.597, 43.437, 43.591, 43.512, 43.515, 43.597, 43.438, 43.593, 43.513, 43.523, 43.618, 43.602, 43.577, 43.517, 43.599, 43.553, 43.557, 43.585, 43.477, 43.565, 43.485, 43.525, 43.597, 43.589, 43.502, 43.531, 43.853, 45.367, 47.758, 50.681, 53.875, 57.437, 60.835, 64.296, 67.63, 71.601, 74.687, 78.056, 81.03, 84.494, 87.75, 93.033, 94.589, 97.647, 100.29, 102.96, 105.79, 108.32, 111.44, 114.29, 116.88, 118.67, 121.33, 123.65, 125.88, 128.15, 130.34, 133.09, 135.08, 137.46, 139.52, 141.84, 142.86, 144.55, 146.29, 149.32, 149.62, 154.16, 155.99, 156.7, 159.31, 160.34, 161.78, 163.31, 165.14, 166.7, 168.9, 169.93, 170.95, 172.14, 173.49, 174.64, 175.78, 177.84, 179.96, 180.41, 181.21, 182.65, 183.72, 184.48, 185.77, 186.97, 188.38, 189.58, 190.66, 191.65, 192.53, 193.44, 194.49, 195.4, 196.72, 197.66, 198.86, 199.38, 200.49, 201.96, 202.53, 203.25, 203.87, 203.06, 204.06, 204.87, 205.61, 206.24, 207.27, 208.13, 208.85, 209.85, 210.42, 211.38, 212.53, 213.55, 213.51, 213.88, 214.56, 214.91, 215.46, 215.75, 216.68, 216.94, 217.14, 218.02, 218.41, 218.5, 219.61, 219.01, 219.7, 219.86, 219.59, 220.99, 220.82, 220.15, 220.03, 219.96, 221.09, 221.73, 221.98, 221.85, 222.49, 224.68, 225.8, 225.99, 225.19, 226.65, 225.69, 226.21, 226.74, 227.15, 226.76, 227.48, 227.02, 227.66, 228.37, 228.77, 228.59, 229.01, 229.16, 231.24, 230.98, 230.6, 230.88, 230.56, 231.01, 231.15, 231.36, 231.78, 231.54, 231.32, 231.41, 231.94, 232.32, 232.94, 233.07, 232.93, 233.28, 233.61, 233.3, 232.89, 231.8, 232.2, 231.48, 231, 231.86, 232.73, 233.99, 234, 234.69, 234.85, 235.37, 235.39, 234.33, 234.93, 234.8, 235.5, 235.21, 235.61, 235.05, 235.61, 236.03, 236.4, 236.58, 236.43, 236.63, 238.89, 238.16, 237.82, 237.25, 237.44, 236.93, 237.11, 237.01, 236.74, 236.71, 237.1, 237.5, 237.51, 237.38, 238.05, 238.16, 238.48, 238.34, 238.14, 238.44, 238.56, 238.36, 238.04, 238, 238.03, 237.66, 237.45, 237.67, 237.97, 238.02, 238.13, 238.24, 238.56, 238.89, 239.76, 239.52, 239.59, 239.48, 239.56, 239.53, 239.53, 239.5, 239.8, 239.2, 239.41, 239.45, 239.45, 239.55, 239.21, 239.27, 238.93, 239, 239.11, 239.23, 239.56, 240.45, 239.94, 239.57, 239.5, 239.14, 239.04, 239.27, 239.26, 239.47, 239.17, 239.34, 239.2, 239.21, 238.82, 238.96, 239.11, 239.04, 239, 238.54, 238.45, 238.68, 239.25, 239.47, 239.58, 239.82, 240.27, 240.28, 240.25, 240.4, 240.68, 240.28, 238.59, 239.75, 239.97, 240.26, 240.46, 240.55, 240.4, 240.66, 240.8, 240.87, 240.87, 240.56, 240.42, 240.26, 240.15, 241.79, 240.6, 240.82, 240.58, 240.74, 240.82, 240.69, 240.09, 240.29, 242.71, 241.8, 241.26, 241.21, 241.01, 240.84, 240.6, 238.99, 239.35, 240.07, 240.03, 240.74, 240.45, 240.23, 240.29, 240.37, 240.34, 240.61, 240.65, 241.11, 240.83, 240.59, 240.46, 240.49, 240.3, 240.26, 240.68, 240.46, 240.35, 240.49, 240.14, 240.44, 241.21, 240.71, 240.67, 240.39, 240.3, 240.84, 240.66, 240.39, 240.35, 240.75, 240.33, 240.54, 240.41, 240.41, 239.63, 239.87, 239.39, 239.96, 239.65, 239.91, 240.39, 240.41, 240.91, 240.7, 240.74, 240.64, 241.8, 241.08, 238.74, 239.47, 239.88, 240.07, 240.03, 240.05, 240.55, 240.23, 240.8, 240.72, 240.38, 240.79, 240.89, 240.54, 240.4, 240.57, 240.52, 241.13, 241.18, 240.95, 240.85, 240.48, 240.64, 240.93, 241.02, 240.51, 240.82, 240.8, 240.8, 240.94, 240.74, 240.74, 240.66, 240.34, 240.25, 240.31, 239.66, 240.13, 240.62, 240.99, 240.7, 240.59, 240.86, 240.82, 240.54, 240.39, 240.48, 240.5, 240.43, 240.19, 240.53, 240.34, 240.26, 240.28, 240.38, 240.74, 240.5, 240.49, 240.61, 240.63, 240.46, 240.36, 240.64, 240.94, 240.9, 240.48, 240.76, 240.5, 240.43, 240.57, 240.72, 240.91, 240.52, 240.72, 240.55, 240.59, 240.59, 240.07, 240.06, 240.26, 240.44, 240.15, 240.21, 240.26, 240.41, 240.53, 240.58, 240.65, 240.76, 240.47, 240.38, 240.46, 240.35, 240.5, 240.55, 240.68, 240.69, 240.23, 240.59, 238.47, 239.08, 239.42, 239.79, 240.14, 240.29, 240.38, 240.66, 240.26, 240.26, 240.22, 240.64, 240.48, 240.43, 240.04, 240.35, 240.38, 240.49, 240.08, 240.16, 240.49, 240.24, 239.89, 239.86, 240.27, 240.31, 240.22, 240.28, 240.39, 240.29, 240.45, 240.63, 240.48, 240.39, 240.15, 240.14, 240.14, 240.46, 240.58, 240.33, 240.34, 242.23, 241.62, 241.97, 241.29, 240.75, 240.35, 240.66, 240.56, 240.57, 240.81, 240.63, 240.41, 240.35, 240.45, 240.6, 240.55, 240.75, 240.61, 240.88, 240.6, 240.5, 240.22, 240.18, 240.29, 240.41, 240.55, 240.54, 240.24, 240.49, 240.25, 240.53, 240.38, 240.48, 240.37, 240.19, 240.17, 240.57, 240.35, 240.4, 240.38, 240.74, 240.47, 239.48, 239.67, 240.3, 240.65, 240.37, 240.61, 240.75, 240.37, 240.05, 240.21, 240.4, 240.44, 240.17, 240.32, 240.76, 240.52, 240.42, 240.65, 240.66, 240.77, 240.6, 240.51, 240.49, 240.27, 240.47, 240.33, 240.52, 240.52, 240.74, 240.61, 240.61, 240.71, 240.73, 240.59, 240.57, 240.54, 240.51, 240.64, 240.17, 240.09, 240.08, 240.47, 240.2, 240.19, 240.37, 240.71, 240.37, 240.21, 240.52, 240.66, 240.5, 240.56, 240.9, 240.73, 240.62, 240.59, 240.65, 240.3, 239.78, 240.24, 240.2, 240.93, 241.14, 240.56, 240.41, 240.44, 240.41, 240.46, 240.49, 240.46, 240.54, 240.71, 240.42, 240.36, 240.2, 240.62, 240.67, 240.68, 240.72, 240.52, 240.09, 240.38, 240.76, 240.78, 240.4, 240.45, 240.37, 240.08, 239.95, 240.41, 240.51, 240.43, 240.41, 240.52, 240.42, 240.17, 240.1, 240.26, 240.59, 240.41, 240.31, 240.45, 240.86, 240.92, 240.55, 240.56, 240.78, 240.56, 240.44, 240.39, 240.51, 240.66, 240.61, 240.51, 240.83, 240.9, 240.23, 240.47, 240.48, 240.39, 240.25, 240.2, 240.28, 240.42, 240.42, 240.34, 240.48, 240.67, 240.47, 240.38, 240.41, 240.42, 240.33, 240.45, 238.74, 239.61, 239.52, 240, 240.31, 240.48, 240.29, 238.92, 239.67, 240.08, 240.11, 240.61, 240.72, 240.7, 240.43, 240.48, 240.36, 237.85, 238.67, 239.25, 239.76, 239.92, 240.12, 240.48, 240.43, 240.55, 240.4, 240.33, 240.54, 240.34, 240.22, 240.6, 240.38, 240.21, 240.31, 240.65, 242.66, 240.73, 240.67, 240.47, 240.38, 240.13, 240.24, 240.11, 240.41, 240.18, 240.26, 240.46, 240.49, 241.97, 241.52, 241.18, 240.89, 240.61, 240.77, 240.55, 240.63, 240.77, 240.21, 240.03, 239.89, 240.23, 240.67, 240.79, 240.45, 240.33, 240.48, 240.8, 240.18, 240.35, 240.78, 241.11, 240.71, 240.4, 240.92, 240.86, 240.63, 240.19, 240.46, 239.87, 239.81, 240.21, 240.72, 240.21, 241.77, 241.44, 241.03, 240.54, 240.58, 240.52, 240.6, 240.5, 240.47, 240.62, 240.73, 240.55, 240.21, 240.4, 240.52, 240.51, 240.69, 240.6, 240.72, 240.61, 240.52, 240.46, 240.27, 240.18, 240.63, 240.5, 240.3, 240.27, 240.41, 240.38, 240.28, 240.48, 240.72, 240.61, 240.21, 240.41, 240.56, 240.73, 240.41, 240.66, 240.62, 240.42, 240.67, 240.71, 239.29, 239.96, 240.2, 240.3, 240.45, 240.63, 240.52, 240.54, 240.36, 240.35, 240.41, 240.53, 240.48, 240.48, 240.7, 242.4, 241.64, 241.12, 241.21, 241.19, 240.85, 240.75, 240.83, 240.68, 240.7, 240.58, 240.49, 241.81, 241.13, 241.26, 241.05, 240.55, 240.58, 240.74, 240.37, 240.47, 240.69, 241.02, 240.73, 240.52, 240.36, 240.39, 240.31, 240.51, 240.64, 240.78, 240.49, 240.36, 240.33, 240.45, 240.2, 240.66, 240.72, 240.49, 240.42, 240.47, 240.79, 240.7, 240.54, 240.45, 240.52, 240.72, 240.39, 240.35, 240.59, 240.3, 240.21, 240.49];


% Show measured step responses and compare them to the characteristic curve
% figure;
% subplot(121); grid on, grid minor, hold on
% plot(time, rpm);
% xlabel('\fontsize{14}Time (s)');
% ylabel('\fontsize{14}Measured Motor Speed (rpm)');
% ylim([-20, 250]);
% yyaxis right
% plot(time, voltage, '--');
% ylabel('\fontsize{14}Input Voltage (V)');
% ylim([-1, 12]);
% axis square
% 
% subplot(122); grid on, grid minor, hold on
% plot(rpm_static, voltage_static, 'b');
% scatter(rpm_static, voltage_static, 'p');
% plot([-50, 0], [0, 0], 'k--');     % dotted line to 0
% plot([-50, 43], [2, 2], 'k--');    % dotted line to 2
% plot([-50, 239], [10, 10], 'k--'); % dotted line to 10
% ylabel('\fontsize{14}Input Voltage (V)');
% xlabel('\fontsize{14}Measured Motor Settling Speed (rpm)');
% ylim([-1, 12]);
% axis square
% 
% suptitle('\fontsize{16}Step Responses and Comparison to Static Characteristics');
% set(gcf, 'Units', 'Inches', 'Position', [0, 0, 12, 6], 'PaperUnits', 'Inches', 'PaperSize', [12, 6]);

% Cut away shit at beginning and end of the second step response (we're
% only interested in the second step response)
% These were determined by looking at the plot
begin_index = 336;
end_index = length(time) - 500;
rpm = rpm(begin_index:end_index);
time = time(begin_index:end_index);
time = time - time(1);

% ?? https://de.wikipedia.org/wiki/Faustformelverfahren_%28Automatisierungstechnik%29

% Determine plant transfer function in Laplace domain using P. Hudzovic's
% system identification technique.
iN = 10;
xdata = linspace(time(1), time(end), length(time));
ydata = filtfilt(ones(1, iN)/iN, 1, rpm);
[Tu, Tg] = characterise_curve(xdata, ydata);
[T, r, order] = hudzovic_lookup(Tu, Tg);
G = hudzovic_transfer_function(T, r, order);

% The plant's transfer function is normalised on the Y axis to 1. We need
% Ks and dV and the Y offset to calculate the correct step response
dV = 10 - 2; % 2V to 10V
Ks = (max(ydata) - min(ydata)) / dV;
yoffset = min(ydata);

% Plot measured data and compare it with the calculated step response
% g_plant = step(G * Ks * dV + yoffset, xdata);
% figure; hold on, grid on, grid minor
% plot(time, rpm, 'r.-');
% plot(xdata, g_plant, 'b');
% legend('\fontsize{14}Measured Data', '\fontsize{14}Hudzovic Transfer Function', 'Location', 'South');
% title('\fontsize{16}2V to 10V Step response');
% ylabel('\fontsize{14}Measured Motor Speed (rpm)');
% xlabel('\fontsize{14}Time (s)');
% xlim([-2, 40]);
% axis square
% set(gcf, 'Units', 'Inches', 'Position', [0, 0, 6, 6], 'PaperUnits', 'Inches', 'PaperSize', [6, 6]);

%% Design various P controllers
%Kpcrit = Tg / (Tu * Ks);
Kpcrit = 40;  % Starts to overshoot
Tcrit = 0.265 - 0.148; % Empirically determined
Kp(1) = Kpcrit; %* 0.5;
Kp(2) = Kpcrit * 0.2;
Kp(3) = Kpcrit * 4;
Kp(4) = Kpcrit * 2.5; % (Playing around, this seems to be perfect)

%figure; hold on, grid on, grid minor
for n = 1:1
    H = Kp(n);
    T = G*H/(1 + G*H);
    step(T);
end
title('P Controllers')
%legend('Kp=0.5', 'Kp=0.2', 'Kp=4', 'Kp=2.2');

return;

% Design various PI controllers
Kp(1) = Kpcrit * 0.45;
Kp(2) = Kpcrit * 0.2;
Kp(3) = Kpcrit * 4;
Ti(1) = 0.85*Tcrit;
Ti(2) = 0.2*Tcrit;
Ti(3) = 4*Tcrit;

subplot(223); hold on, grid on, grid minor
for n = 1:3
    H = Kp(n) * (1 + 1/(s*Ti(n)));
    T = G*H/(1 + G*H);
    step(T * Ks * dV + yoffset, linspace(0, 15, 1000));
end
title('PI Controllers')
legend('Kp=0.45, Ti=0.85', 'Kp=0.2, Ti=0.2', 'Kp=4, Ti=4');

% Design PID controller
Kp(1) = Kpcrit * 0.6;
Ti(1) = Tu * 0.5;
Td(1) = Tu * 0.12;

Kp(2) = Kpcrit * 0.6 * Tg/Tu / Ks;
Ti(2) = Tg;
Td(2) = 0.5 * Tu;

Kp(3) = Kpcrit * 0.6 * Tg/Tu / Ks;
Ti(3) = Tg;
Td(3) = 0.5 * Tu;

subplot(224); hold on, grid on, grid minor
for n = 1:2
    H = Kp(n) * (1 + 1/(s*Ti(n)) + s*Td(n));
    T = G*H/(1 + G*H);
    step(T * Ks * dV + yoffset, linspace(0, 400, 1000));
end
title('PID Controllers')
legend('Ziegler-Nichols', 'Chien-Hrones-Reswick');

