## periodogram.py

#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Tue Jul  1 11:52:35 2025

@author: zainmobeen
"""

import numpy as np
import matplotlib.pyplot as plt

#data = np.genfromtxt('/Users/zainmobeen/Downloads/OGLE-BLG-CEP-024.dat.txt', delimiter='', usecols=(0,1,2), dtype=float, invalid_raise=False)
#data = np.genfromtxt('/Users/zainmobeen/Downloads/OGLE-LMC-ECL-32098.dat.txt', delimiter='', usecols=(0,1,2), dtype=float, invalid_raise=False)
data = np.genfromtxt('/Users/zainmobeen/Downloads/OGLE-LMC-CEP-1237.dat.txt', delimiter='', usecols=(0,1,2), dtype=float, invalid_raise=False)

MJD = data[:, 0]
mag = data[:, 1]
err=  data[:,2]
#period=10.3    #for CEP1237
#period=0.36     #for CEP24
from astropy.timeseries import LombScargle


#min_period = 0.1     # days
#max_period = 0.5    # days

min_period = 10     # days
max_period = 15    # days


min_frequency = 1 / max_period
max_frequency = 1 / min_period

# --- Compute Lomb-Scargle periodogram ---
ls = LombScargle(MJD, mag, err)
frequency, power = ls.autopower(minimum_frequency=min_frequency,
                                maximum_frequency=max_frequency)

# --- Convert frequency to period ---
period = 1 / frequency

# --- Plot ---
plt.figure(figsize=(10, 6))
plt.plot(period, power)
plt.xlabel("Period (days)")
plt.ylabel("Power")
plt.title("Lomb-Scargle Periodogram")
plt.grid(True)
plt.xlim(min_period, max_period)
plt.gca().invert_xaxis()  # Optional: short periods on right
plt.show()

# --- Best period ---
#best_period = period[np.argmax(power)]
#print(f"Best period: {best_period:.4f} days")
