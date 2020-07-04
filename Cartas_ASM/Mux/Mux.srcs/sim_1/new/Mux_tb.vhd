library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity Mux_tb is
--  Port ( );
end Mux_tb;
architecture Behavioral of Mux_tb is
component Mux 
    Port ( bus_in : in STD_LOGIC_VECTOR(7 downto 0);
              sel : in STD_LOGIC;
           bus_out: out STD_LOGIC_VECTOR(7 downto 0));
end component;
--SENALES AUXILIARES
    SIGNAL bus_in_AUX :STD_LOGIC_VECTOR ( 7 DOWNTO 0);
    SIGNAL bus_out_AUX :STD_LOGIC_VECTOR (7 DOWNTO 0);
    SIGNAL sel_AUX :STD_LOGIC;  
begin
    Mux_tb:Mux port map(
        bus_in => bus_in_AUX,
        bus_out => bus_out_AUX,
        sel => sel_AUX
    );
    practica12:process
        begin
            bus_in_AUX <= "10101010";
            SEL_AUX <= '1';
            wait for 10 ns;
            bus_in_AUX <= "10101010";
            SEL_AUX <= '0';
            wait;
    end process;
end Behavioral;
