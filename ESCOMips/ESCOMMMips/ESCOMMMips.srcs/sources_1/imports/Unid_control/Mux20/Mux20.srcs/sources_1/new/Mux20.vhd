library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Mux20 is
    Port ( Mfun,Mopcode : in STD_LOGIC_VECTOR (19 downto 0);
            sel : in STD_LOGIC;
           Microis : out STD_LOGIC_VECTOR (19 downto 0));
end Mux20;

architecture Behavioral of Mux20 is

begin
    process(sel,Mfun,Mopcode)
    begin
        if (sel = '1') then
            Microis <= Mopcode;
        else 
            Microis <= Mfun;
        end if;
    end process;

end Behavioral;
