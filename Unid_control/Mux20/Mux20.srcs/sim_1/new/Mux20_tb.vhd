library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Mux20_tb is
--  Port ( );
end Mux20_tb;

architecture Behavioral of Mux20_tb is
    component Mux20 
        Port ( Mfun,Mopcode : in STD_LOGIC_VECTOR (19 downto 0);
                sel : in STD_LOGIC;
               Microis : out STD_LOGIC_VECTOR (19 downto 0));
    end component;
    signal sel : STD_LOGIC;
    signal Mfun,Mopcode,Microis : STD_LOGIC_VECTOR (19 downto 0);
begin
    Mux20_tb:Mux20 port map(
        sel => sel,
        Mfun => Mfun,
        Mopcode => Mopcode,
        Microis => Microis
    );
    
    tb:process
        begin
            Mfun <= "10101010101010101010";
            Mopcode <= not "10101010101010101010";
            sel <= '0';
            wait for 10 ns;
            sel <= '1';
            wait ;
    end process;


end Behavioral;
