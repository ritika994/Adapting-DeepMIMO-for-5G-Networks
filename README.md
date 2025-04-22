# Adapting DeepMIMO Framework for Ray‑Tracing Based Beam Prediction in 5G Networks

The DeepMIMO 5GNR implements a parameterized dataset generation framework for millimeter‑wave and massive MIMO channel modeling. Leveraging accurate ray‑tracing data from Remcom Wireless InSite, it produces realistic channel matrices and user‑location information for deep learning–based beam prediction research.

## Features
- **Ray‑Tracing Scenario:** Uses the ‘O1’ outdoor ray‑tracing scenario with detailed environmental geometry and material properties
- **Parameterizable Dataset:** Customize BS antenna arrays, antenna spacing, system bandwidth, OFDM subcarriers, and number of channel paths.  
- **Efficient Channel Generation:** MATLAB scripts automate channel matrix computation across subcarriers and strongest paths.  
- **Structured Output:** Stores data in a `.mat` file with easy indexing: `DeepMIMO_dataset{b}.user{u}.channel` and `.loc`.

## Installation

### Prerequisites
- MATLAB R2019a or later  
- Remcom Wireless InSite ray‑tracing data  
- DeepMIMO framework files

### Steps
```bash
git clone https://github.com/ritika994/Adapting-DeepMIMO-for-5G-Networks.git
cd DeepMIMO-5G-Beam-Prediction
# Place Remcom scenario files in ./ray_tracing/O1
# Place DeepMIMO toolkit in ./DeepMIMO
```
## Contributors

- Ritika  202211074

- Aninda Paul 202211002

- Ayush Kumar 202211008

- Ved Prakash Meena 202211096

## Acknowledgments

- We thank the original DeepMIMO authors for their open dataset framework and Remcom for Wireless InSite. We also acknowledge the guidance of Dr. Bhupendra Kumar for his invaluable guidance and support throughout this project

