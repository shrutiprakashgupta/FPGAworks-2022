### Installing Docker Lab Edition
Go to `https://www.xilinx.com/support/download/index.html/content/xilinx/en/downloadNav/vivado-design-tools/2020-3.html`
Download `Xilinx Unified Installer 2020.3: Linux Self Extracting Web Installer`
You might need to create a Xilinx account if you don't already have one
Change the permissions of the bin file and install
```
sudo apt-get update
apt-get install build-essential libftdi-dev libusb-dev python vim usbutils libavahi-common3 libavahi-client3 libxext6 libfontconfig1 libxrender1 libxtst6 libxi6 libgconf-2-4
chmod +x Xilinx_Unified_2020.3_0407_2214_Lin64.bin
sudo ./Xilinx_Unified_2020.3_0407_2214_Lin64.bin
```
Continue with the same version
Enter your Email id and Password
Choose `Lab Edition`
Proceed with the default settings
Agree to the terms and proceed with the installation 

### Installing cable drivers
```
cd /tools/Xilinx/Vivado_Lab/2020.3/data/xicom/cable_drivers/lin64/install_script/install_drivers
sudo ./install_drivers
```

### Launching Vivado Lab
Move to the directory where you want to keep the log files and others created by vivado lab
```
source /tools/Xilinx/Vivado_Lab/2020.3/settings64.sh
vivado_lab -nojournal -nolog &
```
