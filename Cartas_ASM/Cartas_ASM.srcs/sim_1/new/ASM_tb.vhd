library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity ASM_tb is
--  Port ( );
end ASM_tb;

architecture Behavioral of ASM_tb is
    component ASM 
        Port ( INI,CLR,CLK : in STD_LOGIC;
               D : in STD_LOGIC_VECTOR (8 downto 0);
               SEG : out STD_LOGIC_VECTOR (7 downto 0);
               salida : out STD_LOGIC_VECTOR (8 downto 0));
    end component;
    --SENAL
    signal INI,CLR,CLK :  STD_LOGIC;
    signal D :  STD_LOGIC_VECTOR (8 downto 0);
    signal SEG :  STD_LOGIC_VECTOR (7 downto 0);
    signal salida :  STD_LOGIC_VECTOR (8 downto 0);
    
    --clock period
    constant CLK_period : time := 10 ns;
begin
    ASM_tb:ASM port map (
        INI => INI,
        CLR => CLR,
        CLK => CLK,
        D => D,
        SEG => SEG,
        salida => salida
    );
    CLK_process :process
        begin
            CLK <= '0';
        wait for CLK_period/2;
            CLK <= '1';
        wait for CLK_period/2;
    end process; 
    practica4:process
        begin
            CLR <= '1';
            wait for 10 ns;
            CLR <= '0';
            wait for 10 ns;
            INI <= '0';
            wait for 20 ns;
            D <= "111111111";
            wait for 20 ns;
            INI <= '1';
            wait for 60 ns;
            
            INI <= '0';
            wait for 60 ns;
            D <= "101101011";
            wait for 20 ns;
            INI <= '1';
            wait for 60 ns;
            
            INI <= '0';
            wait for 60 ns;
            D <= "000011101";
            wait for 20 ns;
            INI <= '1';
            wait for 60 ns;
            
            INI <= '0';
            wait for 60 ns;
            D <= "000010000";
            wait for 20 ns;
            INI <= '1';
            wait for 60 ns;
            
            INI <= '0';
            wait for 60 ns;
            D <= "100100000";
            wait for 20 ns;
            INI <= '1';
            wait for 60 ns;
            
            INI <= '0';
            wait for 60 ns;
            D <= "000000000";
            wait for 20 ns;
            INI <= '1';
            wait for 60 ns;
            
            wait;
    end process;
end Behavioral;
