library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity SEXT is
    Port ( Dato0,Dato1 : in STD_LOGIC_VECTOR (15 downto 0);
           sel : in STD_LOGIC;
           DATOout : out  STD_LOGIC_VECTOR(15 downto 0));
end SEXT;

architecture Behavioral of SEXT is

begin
    process(sel,Dato0,Dato1)
        begin
        if sel = '0' then
            DATOout <= Dato0;
        else
            DATOout <= Dato1;
        end if;
    end process;
end Behavioral;
