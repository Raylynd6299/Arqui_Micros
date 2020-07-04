library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity UC is
    Port ( CLK,CLR,INI,Z,A0 : in STD_LOGIC;
           LA,EA,EC,EB,LB : OUT STD_LOGIC);
end UC;

architecture Behavioral of UC is

type estados is (e0, e1, e2);
signal edo_act, edo_sig : estados;

begin

process(clk,clr)
begin
    if(clr = '1') then
        edo_act <= e0;
    elsif(rising_edge(clk)) then
        edo_act <= edo_sig;
    end if;
end process;

process(edo_act,INI,Z,A0,CLK)
begin
    LA <= '0';
    EA <= '0';
    EC <= '0';
    EB <= '0';
    LB <= '0';
    case edo_act is
        when e0 => 
            LB <= '1';
            if (INI = '1') then
                edo_sig <= e1;
            else 
                LA <= '1';
                edo_sig <= e0;
            end if;
         when e1 =>
            EA <= '1';
            if (Z = '1') then
                edo_sig <= e2;
            else
                if(A0 = '0') then
                    edo_sig <= e1;
                else
                    EB <= '1';
                    edo_sig <= e1;
                end if;
             end if;
         when e2 =>
            EC <= '1';
            if (INI = '1') then
                edo_sig <= e2;
            else 
                edo_sig <= e0;
            end if;
    end case;
    
end process;
end Behavioral;
