----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 23.02.2020 10:27:02
-- Design Name: 
-- Module Name: simSumaAca - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity simSumaAca is
--  Port ( );
end simSumaAca;

architecture Behavioral of simSumaAca is
component Sum_acarreo is
    Port ( a,b : in STD_LOGIC_VECTOR (7 downto 0);
           s : out STD_LOGIC_VECTOR (7 downto 0);
           cin : in STD_LOGIC;
           cout : out STD_LOGIC);
end component;
signal a : std_logic_vector(7 downto 0):= x"00";
signal b : std_logic_vector(7 downto 0):= x"00";
signal s : std_logic_vector(7 downto 0);
signal cin : std_logic := '0';
signal cout : std_logic;
begin
Sumant: Sum_acarreo Port map(
        a => a,
        b => b,
        cin => cin,
        s => s,
        cout => cout
    );
P3 : process
    begin  
        cin <= '0';
        a <= x"05";
        b <= x"05";
        wait for 10 ns;
        a <= x"0c";
        b <= x"07";
        wait for 10 ns;
        a <= x"09";
        b <= x"05";
        wait for 10 ns;
        a <= x"0e";
        b <= x"09";
        wait for 10 ns;
        a <= x"04";
        b <= x"02";
        wait for 10 ns;
        a <= x"07";
        b <= x"07";
        wait for 10 ns;
        a <= x"0f";
        b <= x"05";
        wait for 10 ns;
        a <= x"0b";
        b <= x"08";
        wait for 10 ns;
        a <= x"01";
        b <= x"04";
        wait ;
end process;

end Behavioral;
