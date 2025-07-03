## lightcurves.py
#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Mon Jun 23 14:04:12 2025

@author: zainmobeen
"""

import numpy as np
import matplotlib.pyplot as plt

# Use genfromtxt to allow for non-numeric data
data = np.genfromtxt('/Users/zainmobeen/Downloads/OGLE-LMC-CEP-1237.dat.txt', delimiter='', usecols=(0,1,2), dtype=float, invalid_raise=False)
#data = np.genfromtxt('/Users/zainmobeen/Downloads/OGLE-BLG-CEP-024.dat.txt', delimiter='', usecols=(0,1,2), dtype=float, invalid_raise=False)


# Remove rows with NaN values (caused by strings in 'mag' column)
#data = data[~np.isnan(data[:, 1])]

MJD = data[:, 0]
mag = data[:, 1]
period=12.0    #for CEP1237
#period=0.36     #for CEP24

phase = ((MJD - MJD[0]) % period) / period

sorted_indices = np.argsort(phase)
phase_sorted = phase[sorted_indices]
mag_sorted = mag[sorted_indices]


def moving_average(x, y, window_size):
    smoothed_x = []
    smoothed_y = []
    half_window = window_size // 2

    for i in range(half_window, len(y) - half_window):
        window_x = x[i]
        window_y = y[i - half_window : i + half_window + 1]
        smoothed_x.append(window_x)
        smoothed_y.append(np.mean(window_y))

    return np.array(smoothed_x), np.array(smoothed_y)


window_size = 50  # Try 10–50 to see different smoothness
phase_ma, mag_ma = moving_average(phase_sorted, mag_sorted, window_size)


phase_double = np.concatenate([phase_sorted, phase_sorted + 1])
mag_double = np.concatenate([mag_sorted, mag_sorted])
phase_mad, mag_mad = moving_average(phase_double, mag_double, window_size)


#plt.plot(phase_sorted, mag_sorted, 'b.')
#plt.plot(phase_ma, mag_ma, 'b.')
plt.plot(phase_mad,mag_mad, 'b.')
plt.xlabel('MJD')
plt.ylabel('Magnitude')
plt.gca().invert_yaxis()  # optional for astronomy
plt.title('Magnitude vs MJD')
plt.show()

