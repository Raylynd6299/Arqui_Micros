library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Bloq_Nivel is
    Port ( CLR,CLK : in STD_LOGIC;
           NA : out STD_LOGIC);
end Bloq_Nivel;

architecture Behavioral of Bloq_Nivel is
    signal pclk1,nclk1: std_logic;
begin
    process(CLK,CLR)
	begin
		if (CLR='1') then
			pclk1<='1';
		elsif (rising_edge(CLK)) then
			pclk1<=(not pclk1);
		end if;
	end process;
	
	process(CLK,CLR)
	begin
		if (CLR='1') then
			nclk1<='0';
		elsif (falling_edge(CLK)) then
			nclk1<=(not nclk1);
		end if;
	end process;
	NA <= (pclk1 xor nclk1);
end Behavioral;
