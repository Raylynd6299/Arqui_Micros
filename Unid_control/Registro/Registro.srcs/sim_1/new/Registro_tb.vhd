library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Registro_tb is
--  Port ( );
end Registro_tb;

architecture Behavioral of Registro_tb is
    component Registro 
        Port ( D : in STD_LOGIC_VECTOR (3 downto 0);
               Q : out STD_LOGIC_VECTOR (3 downto 0);
               CLR,CLK,L : in STD_LOGIC);
    end component;
    
    signal D :  STD_LOGIC_VECTOR (3 downto 0);
    signal Q :  STD_LOGIC_VECTOR (3 downto 0);
    signal clr,clk,l :  STD_LOGIC;
    constant periodo : time := 10 ns;
begin

    tb:Registro port map(
        D => D,
        Q => Q,
        CLR => CLR,
        CLK => CLK,
        L => L
    );
    reloj : process
        begin
            clk <= '0';
            wait for 5 ns;
            clk <= '1';
            wait for 5 ns;
    end process;

    simulacion:process
        begin
            clr <= '1';
            l <= '0';
            d <= "0001";
            wait for 40 ns;
            
            clr <= '0';
            l <= '1';
            d <= "0001";
            wait for 40 ns;
            clr <= '0';
            l <= '0';
            d <= "0111";
            
            wait ;
    end process;
end Behavioral;
