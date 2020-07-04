library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity Deco_tb is
--  Port ( );
end Deco_tb;
architecture Behavioral of Deco_tb is
component Decodificador 
    Port ( bus_in : in STD_LOGIC_VECTOR(3 downto 0);
           bus_out: out STD_LOGIC_VECTOR(7 downto 0));
end component;
--SIGNAL
    SIGNAL bus_in_AUX :STD_LOGIC_VECTOR(3 downto 0);
    SIGNAL bus_out_AUX :STD_LOGIC_VECTOR(7 downto 0);
begin
Deco_tb:Decodificador port map(
    bus_in => bus_in_AUX,
    bus_out => bus_out_AUX
);
practica4:process
begin
    bus_in_AUX <= "0000";
    wait for 10 ns;
    bus_in_AUX <= "0001";
    wait for 10 ns;
    bus_in_AUX <= "0010";
    wait for 10 ns;
    bus_in_AUX <= "0011";
    wait for 10 ns;
    bus_in_AUX <= "0100";
    wait for 10 ns;
    bus_in_AUX <= "0101";
    wait for 10 ns;
    bus_in_AUX <= "0110";
    wait for 10 ns;
    bus_in_AUX <= "0111";
    wait for 10 ns;
    bus_in_AUX <= "1000";
    wait for 10 ns;
    bus_in_AUX <= "1001";
    wait;
end process;
end Behavioral;
