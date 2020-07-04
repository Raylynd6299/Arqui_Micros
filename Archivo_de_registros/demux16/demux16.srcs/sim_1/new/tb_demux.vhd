library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity tb_demux is
--  Port ( );
end tb_demux;

architecture Behavioral of tb_demux is
component demux_16 
    Port( salida:out std_logic_vector(15 downto 0);
        entrada:in  std_logic;
        selector:in std_logic_vector(3 downto 0)
        );
end component;
signal salida: std_logic_vector(15 downto 0);
signal entrada:  std_logic;
signal selector: std_logic_vector(3 downto 0);
begin
    tb:demux_16 port map(
        salida => salida,
        entrada => entrada,
        selector => selector
    );
    
    simulacion:process
    begin
        entrada <= '0';
        selector <= "0000";
        wait for 30 ns;
        entrada <= '0';
        selector <= "0100";
        wait for 30 ns;
        entrada <= '1';
        selector <= "0100";
        wait for 30 ns;
        entrada <= '1';
        selector <= "0101";
        wait for 30 ns;
        entrada <= '1';
        selector <= "1111";
        wait;
    
    end process;
    

end Behavioral;
