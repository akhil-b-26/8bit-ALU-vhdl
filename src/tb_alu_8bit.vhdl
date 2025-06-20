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

    -- Instantiate the ALU Unit Under Test (UUT)
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

        OpCode <= "000"; wait for 10 ns;  -- ADD
        OpCode <= "001"; wait for 10 ns;  -- SUB
        OpCode <= "110"; wait for 10 ns;  -- OR
        OpCode <= "111"; wait for 10 ns;  -- XOR

        -- Test Case 2: A = 49, B = 10
        InputA <= std_logic_vector(to_unsigned(49, 8));
        InputB <= std_logic_vector(to_unsigned(10, 8));

        OpCode <= "010"; wait for 10 ns;  -- MUL
        OpCode <= "011"; wait for 10 ns;  -- SHL
        OpCode <= "100"; wait for 10 ns;  -- SHR
        OpCode <= "101"; wait for 10 ns;  -- AND

        -- Edge Case: A = 255, B = 1 (check carry)
        InputA <= std_logic_vector(to_unsigned(255, 8));
        InputB <= std_logic_vector(to_unsigned(1, 8));
        OpCode <= "000"; wait for 10 ns;  -- ADD with carry

        report "ALU Testbench complete." severity note;
        wait;
    end process;

end Behavioral;
