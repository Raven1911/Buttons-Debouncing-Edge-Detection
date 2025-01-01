# Buttons-Debouncing-Edge-Detection
# System Clock up to 200 MHZ (Depended on LUTs technology of Arty z7)
* Dealing with Buttons in Verilog Debouncing &amp; Edge Detection

![alt text](Image/Dealing%20with%20Buttons.png)


* Debouncer_FSM (MORE FSM)

![alt text](Image/debouncer_fsm.png)


* Edge_Detection_FSM (MEARLY FSM)

![alt text](Image/Edge_Detection_FSM.png)

# Implementation

Hierarchy module:

debouncer_delayed
> debouncer_delayed_fsm FSM0
> edge_detector EDGE_DE
> timer_parameter #(.COUNTER_VALUE(999_999)) T0 // COUNTER_VALUE = 999_999(De10 nano 50Mhz) or 1_999_999(Arty z7 100Mhz)