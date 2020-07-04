library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Barrel_tb is
--  Port ( );
end Barrel_tb;

architecture Behavioral of Barrel_tb is
component Barrel is
    Port ( dato : in STD_LOGIC_VECTOR (15 downto 0);
           res : out STD_LOGIC_VECTOR (15 downto 0);
           dir : std_logic;
           s : in STD_LOGIC_VECTOR (3 downto 0));
end component;

signal dato : STD_LOGIC_VECTOR (15 downto 0);
signal res :  STD_LOGIC_VECTOR (15 downto 0);
signal dir: std_logic;
signal s :  STD_LOGIC_VECTOR (3 downto 0);

begin


u1 : Barrel 
    Port map ( 
        dato => dato,
        res  => res,
        dir =>dir,
        s => s
        );
        
 simulacion : process
 begin
    dato <= "0000000010010111";
    s <= "0011";
    dir <='0';
    wait for 30 ns;
    dato <= "0000110010010111";
    s <= "1011";
    dir <='0';
    wait for 30 ns;
    dato <= "1111111110011111";
    s <= "0011";
    dir <='1';
    wait for 30 ns;
    dato <= "1001011110011111";
    s <= "1011";
    dir <='1';
    wait;
 
 end process;
        

end Behavioral;
