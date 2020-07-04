library IEEE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity Conta_tb is
--  Port ( );
end Conta_tb;

architecture Behavioral of Conta_tb is
component Contador 
    Port ( CLK,CLR,LB,EB : in STD_LOGIC;
           QB : INOUT STD_LOGIC_VECTOR(3 DOWNTO 0));
end component;
--SENAL
    SIGNAL CLK,CLR,LB,EB : STD_LOGIC;
    SIGNAL QB :STD_LOGIC_VECTOR(3 DOWNTO 0);
--clock period
    constant CLK_period : time := 10 ns;
begin
    cont_tb:Contador port map(
        CLK => CLK,
        CLR => CLR,
        LB => LB,
        EB => EB,
        QB => QB
    );
    CLK_process :process
        begin
            CLK <= '0';
        wait for CLK_period/2;
            CLK <= '1';
        wait for CLK_period/2;
    end process;

Practica12:process
    begin
        clr <= '1';
        wait for 10 ns;
        clr <= '0';
        LB <= '1';
        EB <= '0';
        wait for 10 ns;
        LB <= '0';
        EB <= '1';
        wait for 10 ns;
        LB <= '0';
        EB <= '1';
        wait for 10 ns;
        LB <= '0';
        EB <= '1';
        wait for 10 ns;
        LB <= '0';
        EB <= '0';
        wait for 10 ns;
        LB <= '0';
        EB <= '1';
        wait for 10 ns;
        LB <= '0';
        EB <= '1';
        wait for 10 ns;
        LB <= '0';
        EB <= '1';    
        wait; 
end process;
end Behavioral;
