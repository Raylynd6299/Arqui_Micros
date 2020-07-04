library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Bloq_Nivel_tb is
--  Port ( );
end Bloq_Nivel_tb;

architecture Behavioral of Bloq_Nivel_tb is
    component Bloq_Nivel 
        Port ( CLR,CLK : in STD_LOGIC;
               NA : out STD_LOGIC);
    end component;
    --senal
    signal NA,CLR,CLK :STD_LOGIC;
    --clock period
    constant CLK_period : time := 10 ns;
begin
    Bloq_Nivel_tb:Bloq_Nivel port map(
        CLR => CLR,
        CLK => CLK,
        NA  => NA
    );
    CLK_process :process
        begin
            CLK <= '0';
        wait for CLK_period/2;
            CLK <= '1';
        wait for CLK_period/2;
    end process;
    
    tb:process
        begin
            CLR <= '1';
            wait for 10 ns;
            CLR <= '0';
            wait for 10 ns;
            wait;
    end process;

end Behavioral;
