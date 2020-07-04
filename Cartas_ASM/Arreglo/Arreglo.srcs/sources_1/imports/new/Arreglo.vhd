library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity Arreglo is
    Port ( CLK,CLR,LA,EA : in STD_LOGIC;
           DA : IN STD_LOGIC_VECTOR(8 DOWNTO 0);
           QA : INOUT STD_LOGIC_VECTOR(8 DOWNTO 0));
end Arreglo;
architecture Behavioral of Arreglo is
begin
    PROCESS(CLK,CLR,LA,EA,DA)
        BEGIN
            IF(CLR = '1') THEN
                QA <= "000000000";
            ELSIF(CLK'EVENT AND CLK = '1') THEN
                IF(LA = '0' AND EA = '0')THEN
                    QA <= QA;
                ELSIF(LA = '1' AND EA = '0') THEN
                    QA <= DA;
                ELSIF(LA = '0' AND EA = '1') THEN
                    QA <= '0' & QA(8 downto 1);
                END IF;
            END IF;
    END PROCESS;
end Behavioral;