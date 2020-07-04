library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity extSIG is
    Port ( entrada : in STD_LOGIC_VECTOR (11 downto 0);
           salida : out STD_LOGIC_VECTOR (15 downto 0));
end extSIG;

architecture Behavioral of extSIG is
Constant Positivo : STD_LOGIC_VECTOR(3 downto 0) := "0000";
Constant Negativo : STD_LOGIC_VECTOR(3 downto 0) := "1111";
begin
    process(entrada)
        begin
        if entrada(11) = '0' then
            salida <= Positivo & entrada;
        else
            salida <= Negativo & entrada;
        end if;
    end process;
end Behavioral;
