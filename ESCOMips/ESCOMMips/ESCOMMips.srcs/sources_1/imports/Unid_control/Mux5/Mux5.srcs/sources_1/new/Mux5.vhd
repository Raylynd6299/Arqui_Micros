library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Mux5 is
    Port ( sel : in STD_LOGIC;
           opcd : in STD_LOGIC_VECTOR (4 downto 0);
           salida : out STD_LOGIC_VECTOR (4 downto 0));
end Mux5;

architecture Behavioral of Mux5 is

begin
    process(sel,opcd)
    begin
        if (sel = '1') then
            salida <= opcd;
        else 
            salida <= "00000";
        end if;
    end process;

end Behavioral;

