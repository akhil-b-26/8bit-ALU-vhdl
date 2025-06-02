library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity ALU_8bit is
    Port (
        InputA  : in  STD_LOGIC_VECTOR(7 downto 0);
        InputB  : in  STD_LOGIC_VECTOR(7 downto 0);
        OpCode  : in  STD_LOGIC_VECTOR(2 downto 0);
        OutALU  : out STD_LOGIC_VECTOR(15 downto 0);
        COut    : out STD_LOGIC
    );
end ALU_8bit;

architecture Behavioral of ALU_8bit is
    signal result : unsigned(15 downto 0);
begin
    process(InputA, InputB, OpCode)
        variable A, B : unsigned(7 downto 0);
    begin
        A := unsigned(InputA);
        B := unsigned(InputB);
        result := (others => '0');
        COut <= '0';

        case OpCode is
            when "000" =>  -- Addition
                result := ("00000000" & A) + ("00000000" & B);
                if result > 255 then
                    COut <= '1';
                end if;
            when "001" =>  -- Subtraction
                result := ("00000000" & A) - ("00000000" & B);
                if A < B then
                    COut <= '1';
                end if;
            when "010" =>  -- Multiplication
                result := ("00000000" & A) * ("00000000" & B);
            when "011" =>  -- Left Shift A
                result := ("00000000" & A) sll 1;
            when "100" =>  -- Right Shift A
                result := ("00000000" & A) srl 1;
            when "101" =>  -- AND
                result := ("00000000" & (A and B));
            when "110" =>  -- OR
                result := ("00000000" & (A or B));
            when "111" =>  -- XOR
                result := ("00000000" & (A xor B));
            when others =>
                result := (others => '0');
        end case;

        OutALU <= std_logic_vector(result);
    end process;
end Behavioral;
