# ☀️ ANN–GWO for Intelligent MPPT in PV Systems

**An Advanced ANN–Grey Wolf Optimizer (ANN–GWO) Framework for Maximum Power Point Tracking**

📄 **Paper:**  
👉 https://ieeexplore.ieee.org/document/10582686  

---

## 📌 Overview

This repository provides the **complete MATLAB/Simulink implementation** of the proposed:

> **Artificial Neural Network optimized by Grey Wolf Optimizer (ANN–GWO)**

for **Maximum Power Point Tracking (MPPT)** in photovoltaic (PV) systems.

The method is developed for a **400 kW PV power plant** and aims to:

- ⚡ Track the maximum power point dynamically  
- 🌤️ Adapt to irradiance and temperature variations  
- 📈 Improve efficiency over conventional MPPT methods  

The ANN–GWO integrates **machine learning + metaheuristic optimization** to ensure robust and accurate MPPT under nonlinear and time-varying conditions.

---

## 🧠 Key Idea: ANN–GWO

Traditional MPPT methods (e.g., P&O, PID) suffer from:

🔴 Slow tracking under rapid environmental changes  
🔴 Oscillations around the maximum power point  
🔴 Reduced efficiency in nonlinear PV systems  

🟢 **ANN–GWO Solution:**

- ANN learns nonlinear PV characteristics  
- GWO optimizes ANN weights **online**  
- Multi-objective optimization:
  - Maximize output power  
  - Maintain output voltage  
  - Minimize voltage ripple  

👉 Result: **Adaptive, intelligent, high-efficiency MPPT**

---

## ⚙️ System Description

The implemented system includes:

- ☀️ **PV Array** (SunPower SPR-445J-WHT-D model)  
- 🔼 **DC–DC Boost Converter** (PWM controlled)  
- 🧠 **Artificial Neural Network (ANN)**
  - Inputs: `Vpv`, `Ipv`  
  - 4 hidden layers (10 neurons each)  
  - Output: duty cycle (PWM)  
- 🐺 **Grey Wolf Optimizer (GWO)**
  - Optimizes ANN weights (47 parameters)  
  - Population: 50 wolves  
  - Iterations: 400  

---

## 🧪 Simulation Details

- **Platform:** MATLAB / Simulink (R2022b)  
- **PV System Size:** 400 kW  
- **Control Target:** MPPT via duty-cycle regulation  
- **Operating Conditions:**
  - Irradiance: 400–1200 W/m²  
  - Temperature: 10–35 °C  

---

## 📊 Benchmarks

The repository includes comparison with:

| Method | Type |
|------|------|
| P&O | Conventional MPPT |
| PID | Classical control |
| ANN–GWO | Proposed method |

---

## 📈 Results Summary

Key results from the paper:

- ✅ **MPPT Efficiency**
  - ANN–GWO: **≈ 99.5%**
  - P&O: ≈ 97–98%
  - PID: ≈ 82–91%

- ⚡ **Voltage Regulation**
  - ANN–GWO: **598–599 V (near 600 V target)**
  - P&O: ~593–594 V  
  - PID: ~579–581 V  

- 🚀 **Performance**
  - Faster convergence  
  - Reduced oscillations  
  - High stability under dynamic conditions  

---

## 🔬 Features

✔ Hybrid **ANN + optimization-based MPPT**  
✔ Robust to **rapid environmental variations**  
✔ Near-optimal **power extraction efficiency (~99%)**  
✔ Improved **voltage stability**  
✔ Scalable to different PV sizes (100 kW – 400 kW)  
✔ Fully implemented in **MATLAB/Simulink**

---

## 🧩 Implementation Highlights

- Online ANN weight tuning using GWO  
- Multi-objective fitness optimization  
- PWM-based duty cycle control  
- Comparative evaluation framework (P&O, PID, ANN–GWO)  
- Designed for **large-scale PV systems**

---

## 🚀 How to Use

1. Open MATLAB (R2022b or newer)  
2. Load the provided `.m` script or Simulink model  
3. Integrate with your PV system  
4. Run simulations under different conditions  
5. Evaluate MPPT performance  

---

## ⭐ Final Note

This repository provides a **complete research-grade implementation** combining:

**Artificial Intelligence ☀️ Optimization ⚡ Power Electronics**

for advanced photovoltaic energy systems.

---

---

## ⚠️ Important Note on Simulink Model

This repository provides the **ANN–GWO optimization framework** and MATLAB implementation only.

📌 The Simulink model used in the paper is **not included**.

---

## 🧩 How to Reproduce the Results

To use this code, you need to build your own PV system model in Simulink.

### Minimum Required System

Your model should include:

- ☀️ PV array model  
- 🔼 DC–DC boost converter  
- 🎯 PWM control (duty cycle driven by ANN output)  
- 📉 MPPT evaluation signals  

---

## 🔗 MATLAB–Simulink Interface

The optimization process exchanges data via MATLAB workspace variables.

### 🔹 Input to Simulink

- `ANN_weights`  
  → Vector of ANN parameters optimized by GWO  
  → Must be used inside your ANN controller to generate the duty cycle  

---

### 🔹 Outputs from Simulink (using *To Workspace*)

You must export the following signals:

| Signal | Description |
|------|------------|
| `power_error` | MPPT tracking error (e.g., difference from maximum achievable power) |
| `voltage_error` | Deviation from desired DC output voltage (e.g., 600 V) |

---

## ⚙️ Simulation Requirements

Your Simulink model must:

- Run automatically using:
```matlab
sim('your_model_name.slx')

---


## 📚 Citation

If you use this work, please cite:

```bibtex
@inproceedings{kamoona2024anngwo,
  title={Advanced MPPT Strategy for PV Solar Energy Systems Using ANN-GWO},
  author={Kamoona, Mustafa A. and Mauricio, Juan Manuel and Saleh, Ameer L. and Számel, László},
  booktitle={2024 6th Global Power, Energy and Communication Conference (GPECOM)},
  pages={439--444},
  year={2024},
  doi={10.1109/GPECOM61896.2024.10582686}
}
