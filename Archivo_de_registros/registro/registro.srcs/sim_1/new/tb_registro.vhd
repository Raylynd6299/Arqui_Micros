library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity tb_registro is
--  Port ( );
end tb_registro;

architecture Behavioral of tb_registro is
component registro1 
    Port ( d : in STD_LOGIC_VECTOR (15 downto 0);
           q : out STD_LOGIC_VECTOR (15 downto 0);
           clr,clk,l : in STD_LOGIC);
end component;
signal d :  STD_LOGIC_VECTOR (15 downto 0);
signal q :  STD_LOGIC_VECTOR (15 downto 0);
signal clr,clk,l :  STD_LOGIC;
constant periodo : time := 10 ns;
begin
    tb:registro1 port map(
     d => d,
     q => q,
     clr => clr,
     clk => clk,
     l => l
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
            --probando clr en cualquier tiempo de reloj
            clr <= '1';
            l <= '0';
            d <= "0001110011110000";
            wait for 40 ns;
            --probando guardar en el registro
            clr <= '0';
            l <= '1';
            d <= "0001110011110000";
            wait for 40 ns;
            --probando retencion
            clr <= '0';
            l <= '0';
            d <= "0000010011110000";
            wait for 40 ns;
            clr <= '0';
            l <= '1';
            d <= "1111111111111111";
            wait for 40 ns;
            clr <= '1';
            l <= '0';
            d <= "0001110011110000";
            
            wait;
    end process;


end Behavioral;
