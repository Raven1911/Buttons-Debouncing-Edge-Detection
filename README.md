# Buttons-Debouncing-Edge-Detection
# System Clock up to 200 MHz (Depended on LUTs technology of Arty z7)
* Dealing with Buttons in Verilog Debouncing &amp; Edge Detection

> ![alt text](Image/Dealing%20with%20Buttons.png)


* Debouncer_FSM (MORE FSM)

> ![alt text](Image/debouncer_fsm.png)


* Edge_Detection_FSM (MEALY FSM)

> ![alt text](Image/Edge_Detection_FSM.png)

# Implementation

* Hierarchy module:
    * debouncer_delayed
        * debouncer_delayed_fsm FSM0
        * edge_detector EDGE_DE
        * timer_parameter #(.COUNTER_VALUE(999_999)) T0 // COUNTER_VALUE = 999_999(De10 nano 50MHz) or 1_999_999(Arty z7 100MHz)

        > ![alt text](Image/RTL_ANALYSIS.png)

* Performance (implementation on Arty z7)
> ![alt text](Image/performance1.png)
> ![alt text](Image/performance2.png)
> ![alt text](Image/performance3.png)
> ![alt text](Image/performance4.png)


* Simulation
    * Behavioral Simulation
    > ![alt text](Image/sim1.png)
    > ![alt text](Image/sim2.png)

    * Post-Synthesis Timing Simulation
    > ![alt text](Image/sim3.png)

* Demo on the De10 Nano board
    * Pin Planner
    > ![alt text](Image/pin.png)

    * Test
    > ![alt text](Image/test.png)
