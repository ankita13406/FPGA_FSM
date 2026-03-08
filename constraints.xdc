//Maps FPGA pins to switches, LEDs, and the clock source on the FPGA board.

create_clock -period 10.000 -name gclk [get_ports clk]
set_property -dict {PACKAGE_PIN F14 IOSTANDARD LVCMOS33} [get_ports clk]

# switches
set_property -dict {PACKAGE_PIN V2 IOSTANDARD LVCMOS33} [get_ports rst]
set_property -dict {PACKAGE_PIN U2 IOSTANDARD LVCMOS33} [get_ports go]
set_property -dict {PACKAGE_PIN U1 IOSTANDARD LVCMOS33} [get_ports stop]
set_property -dict {PACKAGE_PIN T2 IOSTANDARD LVCMOS33} [get_ports mode]

# inputs
set_property -dict {PACKAGE_PIN T1 IOSTANDARD LVCMOS33} [get_ports a[0]]
set_property -dict {PACKAGE_PIN R2 IOSTANDARD LVCMOS33} [get_ports a[1]]
set_property -dict {PACKAGE_PIN R1 IOSTANDARD LVCMOS33} [get_ports a[2]]
set_property -dict {PACKAGE_PIN P2 IOSTANDARD LVCMOS33} [get_ports a[3]]

set_property -dict {PACKAGE_PIN P1 IOSTANDARD LVCMOS33} [get_ports b[0]]
set_property -dict {PACKAGE_PIN N2 IOSTANDARD LVCMOS33} [get_ports b[1]]
set_property -dict {PACKAGE_PIN N1 IOSTANDARD LVCMOS33} [get_ports b[2]]
set_property -dict {PACKAGE_PIN M2 IOSTANDARD LVCMOS33} [get_ports b[3]]

# LEDs
set_property -dict {PACKAGE_PIN G1 IOSTANDARD LVCMOS33} [get_ports y_reg[0]]
set_property -dict {PACKAGE_PIN G2 IOSTANDARD LVCMOS33} [get_ports y_reg[1]]
set_property -dict {PACKAGE_PIN F1 IOSTANDARD LVCMOS33} [get_ports y_reg[2]]
set_property -dict {PACKAGE_PIN F2 IOSTANDARD LVCMOS33} [get_ports y_reg[3]]
set_property -dict {PACKAGE_PIN E1 IOSTANDARD LVCMOS33} [get_ports y_reg[4]]
set_property -dict {PACKAGE_PIN E2 IOSTANDARD LVCMOS33} [get_ports y_reg[5]]
set_property -dict {PACKAGE_PIN E3 IOSTANDARD LVCMOS33} [get_ports y_reg[6]]
set_property -dict {PACKAGE_PIN E5 IOSTANDARD LVCMOS33} [get_ports y_reg[7]]

set_property -dict {PACKAGE_PIN E6 IOSTANDARD LVCMOS33} [get_ports idle]
set_property -dict {PACKAGE_PIN C3 IOSTANDARD LVCMOS33} [get_ports active]
set_property -dict {PACKAGE_PIN B2 IOSTANDARD LVCMOS33} [get_ports invalid]
