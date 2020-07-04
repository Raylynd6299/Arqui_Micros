library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity Arreglo_tb is
--  Port ( );
end Arreglo_tb;

architecture Behavioral of Arreglo_tb is
    component Arreglo 
        Port ( CLK,CLR,LA,EA : in STD_LOGIC;
               DA : IN STD_LOGIC_VECTOR(8 DOWNTO 0);
               QA : INOUT STD_LOGIC_VECTOR(8 DOWNTO 0));
    end component;
    --senales
    signal CLK,CLR,LA,EA :  STD_LOGIC;
    signal DA :  STD_LOGIC_VECTOR(8 DOWNTO 0);
    signal QA :  STD_LOGIC_VECTOR(8 DOWNTO 0);
    
    --clock period
    constant CLK_period : time := 10 ns;
begin
Arreglo_tb:Arreglo port map(
    CLK => CLK,
    CLR => CLR,
    LA => LA,
    EA => EA,
    DA => DA,
    QA => QA
);


CLK_process :process
    begin
        CLK <= '0';
    wait for CLK_period/2;
        CLK <= '1';
    wait for CLK_period/2;
end process;

practica12:process
begin
    CLR <= '1';
    wait for 10 ns;
    CLR <= '0';
    DA <= "101101001";
    LA <= '1';
    EA <= '0';
    wait for 10 ns;
    LA <= '0';
    EA <= '0';
    wait for 10 ns;
    LA <= '0';
    EA <= '1';
    wait for 10 ns;
    LA <= '0';
    EA <= '1';
    wait for 10 ns;
    LA <= '0';
    EA <= '0';
    wait for 10 ns;
    LA <= '0';
    EA <= '1';
    wait for 10 ns;
    LA <= '0';
    EA <= '1';
    wait for 10 ns;
    LA <= '0';
    EA <= '1';
    wait;
end process;
end Behavioral;
