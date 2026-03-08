FPGA Calculator using FSM (Verilog)



Overview

This project implements a simple calculator system on an FPGA using Verilog HDL. The calculator performs addition or multiplication on two 4-bit input numbers depending on the selected operation mode. The design is based on a Finite State Machine (FSM) which controls the sequence of operations in the system. The inputs are provided through switches on the FPGA board and the result of the calculation is displayed using the onboard LEDs.

The project demonstrates important digital design concepts such as sequential logic, finite state machine design, datapath and control unit separation, clock division, and modular hardware design. All modules are written in Verilog and integrated together in a top level module for FPGA implementation.

System Description

The system consists of a controller, datapath components, and a clock divider. The controller is implemented as a Finite State Machine that manages the operation of the entire system. The datapath consists of registers for storing input values, an arithmetic calculator module, and a register to store the final result.

The FPGA board runs at a clock frequency of 100 MHz, which is too fast to visually observe the system behavior. Therefore, a slow clock generator is used to divide the clock frequency so that state transitions and operations can be observed more easily on the LEDs.

Inputs

The system receives a clock signal from the FPGA board which operates at 100 MHz. A reset signal is used to bring the system back to its initial state. A control signal called go is used to start the operation of the calculator. Another signal called stop is used to stop the operation and trigger the countdown phase. A mode input determines the arithmetic operation where mode equal to zero selects addition and mode equal to one selects multiplication. Two four bit inputs named a and b represent the operands used in the calculation.

Outputs

The output of the system is an eight bit result stored in a result register. This value is displayed using the eight LEDs available on the FPGA board. Additional LED indicators show the current state of the system. The idle signal indicates that the system is waiting for the start command. The active signal indicates that the calculation stage is currently running. The invalid signal indicates that the system is in the countdown or termination phase.

Working Principle

The system initially starts in the idle state. In this state the system waits for the go signal from the user. Once the go signal is activated, the system transitions to a counting state where a counter begins incrementing. When the counter reaches a predefined value, the system moves to the active state where the input values are loaded into registers. The calculator module then performs the selected operation which may be addition or multiplication. The result is stored in an eight bit register and displayed on the LEDs.

When the stop signal is activated, the system enters a countdown state where the counter begins decrementing. Once the counter reaches zero, the system returns to the idle state and waits for the next operation.

Module Description

The slow clock module generates a slower clock signal from the 100 MHz FPGA clock so that system operations can be observed more clearly. The controller module implements the finite state machine that controls the sequence of operations and generates control signals for the other modules. The counter module is a four bit up and down counter that controls timing and state transitions. The reg_4bit module stores the input operands provided by the user. The calculator module performs either addition or multiplication depending on the selected mode. The reg_8bit module stores the final calculation result before sending it to the LED outputs. The top module integrates all of these components and connects them together to form the complete system.

Tools Used

The design is implemented using Verilog Hardware Description Language. The project is synthesized and implemented using Xilinx Vivado. The system is tested on an FPGA development board using onboard switches and LEDs.

Conclusion

This project demonstrates the design and implementation of a sequential digital system using Verilog. It shows how a finite state machine can be used to control a datapath consisting of registers, counters, and arithmetic modules. The modular structure of the design makes the system easy to understand, modify, and expand for more complex operations in the future.

