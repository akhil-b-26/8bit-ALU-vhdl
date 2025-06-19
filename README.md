# 8-bit ALU Design in Verilog

## 📌 Project Overview
This repository contains the Verilog implementation of an **8-bit Arithmetic Logic Unit (ALU)**. The ALU is a fundamental component in digital circuits and processors, capable of performing various arithmetic and logical operations based on a 3-bit opcode.

## 🚀 Features & Functionality
The ALU supports the following operations:

| Opcode  | Operation       |
|---------|---------------|
| `000`   | Addition       |
| `001`   | Subtraction    |
| `010`   | Multiplication |
| `011`   | Left Shift     |
| `100`   | Right Shift    |
| `101`   | Logical AND    |
| `110`   | Logical OR     |
| `111`   | Logical XOR    |

### **Inputs & Outputs**
- **Inputs:**  
  - `OpCode [2:0]` → Selects the operation  
  - `InputA [7:0]` → First operand  
  - `InputB [7:0]` → Second operand  

- **Outputs:**  
  - `OutALU [15:0]` → Result of the operation  
  - `COut` → Carry-out (for arithmetic operations)  

## 🛠 Implementation Details
- **Written in VHDL**
- **Testbench included** for simulation and verification
- Synthesizable with **Xilinx Vivado / ModelSim / Quartus**

## 📂 Project Structure
```
📦 8-bit-ALU-vhdl
 ├── src
 │   ├── alu_8bit.vhdl        # ALU Verilog Module
 │   ├── alu_testbench.vhdl   # Testbench for Verification
 ├── docs
 │   ├── alu_block_diagram.png
 ├── simulations
 │   ├── alu_waveform.png     # Simulation results
 ├── LICENSE
 ├── README.md         # Project Documentation
```

## 🏗 How to Run the Simulation
1. **Clone the repository**  
   ```sh
   git clone https://github.com/akhil-b-26/8-bit-ALU-vhdl.git
   cd 8-bit-ALU-vhdl
   ```
2. **Open ModelSim/Xilinx Vivado/Quartus**  
3. **Compile the VHDL files**  
4. **Run the testbench simulation**  
5. **Verify the outputs in the waveform viewer**  

## 🎯 Future Improvements
- Implement a **4-bit Carry Lookahead Adder (CLA)** for faster addition
- Extend the design to **16-bit ALU**
- Add additional operations like **division and modulo**

## 📜 License
This project is licensed under the **MIT License**. See the [LICENSE](LICENSE) file for details.

## 💡 Contributing
Contributions are welcome! If you find a bug or want to enhance the functionality, feel free to fork the repository and submit a pull request.

## 📧 Contact
For any inquiries or discussions, feel free to reach out via **GitHub Issues**.
