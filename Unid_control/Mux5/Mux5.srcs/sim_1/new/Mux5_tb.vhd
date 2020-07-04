library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Mux5_tb is
--  Port ( );
end Mux5_tb;

architecture Behavioral of Mux5_tb is
    component Mux5 
        Port ( sel : in STD_LOGIC;
               opcd : in STD_LOGIC_VECTOR (4 downto 0);
               salida : out STD_LOGIC_VECTOR (4 downto 0));
    end component;
    
    --senal
    signal sel : STD_LOGIC;
    signal opcd : STD_LOGIC_VECTOR (4 downto 0);
    signal salida : STD_LOGIC_VECTOR (4 downto 0);
begin
    Mux5_tb:Mux5 port map(
        sel => sel,
        opcd => opcd,
        salida => salida
    );
    tb:process
        begin
            sel <= '0';
            wait for 10 ns;
            opcd <= "10101";
            sel <= '1';
            wait ;
    end process;
end Behavioral;
