library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity tb_ALU_8bit is
end tb_ALU_8bit;

architecture Behavioral of tb_ALU_8bit is

    signal InputA  : STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
    signal InputB  : STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
    signal OpCode  : STD_LOGIC_VECTOR(2 downto 0) := (others => '0');
    signal OutALU  : STD_LOGIC_VECTOR(15 downto 0);
    signal COut    : STD_LOGIC;

begin

    -- Instantiate ALU Unit Under Test (UUT)
    uut: entity work.ALU_8bit
        port map (
            InputA => InputA,
            InputB => InputB,
            OpCode => OpCode,
            OutALU => OutALU,
            COut   => COut
        );

    -- Stimulus process
    stim_proc: process
    begin
        report "Starting ALU Testbench..." severity note;

        -- Test Case 1: A = 45, B = 38
        InputA <= std_logic_vector(to_unsigned(45, 8));
        InputB <= std_logic_vector(to_unsigned(38, 8));

        -- Addition
        OpCode <= "000"; wait for 10 ns;

        -- Subtraction
        OpCode <= "001"; wait for 10 ns;

        -- OR
        OpCode <= "110"; wait for 10 ns;

        -- XOR
        OpCode <= "111"; wait for 10 ns;

        -- Test Case 2: A = 49, B = 10
        InputA <= std_logic_vector(to_unsigned(49, 8));
        InputB <= std_logic_vector(to_unsigned(10, 8));

        -- Multiplication
        OpCode <= "010"; wait for 10 ns;

        -- Left Shift
        OpCode <= "011"; wait for 10 ns;

        -- Right Shift
        OpCode <= "100"; wait for 10 ns;

        -- AND
        OpCode <= "101"; wait for 10 ns;

        report "ALU Testbench complete." severity note;

        wait;
    end process;

end Behavioral;
