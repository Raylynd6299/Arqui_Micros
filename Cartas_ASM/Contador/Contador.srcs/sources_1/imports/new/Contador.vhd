library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE ieee.std_logic_UNSIGNED.ALL;
entity Contador is
    Port ( CLK,CLR,LB,EB : in STD_LOGIC;
           QB : INOUT STD_LOGIC_VECTOR(3 DOWNTO 0));
end Contador;
architecture Behavioral of Contador is
    signal DB : STD_LOGIC_VECTOR(3 DOWNTO 0) := "0000";
begin 
    PROCESS (CLK,CLR,LB,EB)
        BEGIN
            IF(CLR = '1')THEN 
                QB <= "0000";
            ELSIF(CLK'EVENT AND CLK = '1') THEN
                IF (LB = '1' AND EB = '0' ) THEN
                    QB <= DB;
                ELSIF (LB = '0' AND EB = '0' ) THEN
                    QB <= QB;
                ELSIF (LB = '0' AND EB = '1' ) THEN
                    QB <= QB + 1;
                END IF;
            END IF;
    END PROCESS;
end Behavioral;