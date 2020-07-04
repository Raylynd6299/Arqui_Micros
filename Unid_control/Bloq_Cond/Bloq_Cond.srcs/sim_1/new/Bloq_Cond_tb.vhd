library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Bloq_Cond_tb is
--  Port ( );
end Bloq_Cond_tb;

architecture Behavioral of Bloq_Cond_tb is
    component Bloq_Cond 
        Port ( Q : in STD_LOGIC_VECTOR (3 downto 0);
               EQ,NE,LT,LE,GT,GE : out STD_LOGIC);
    end component;
    
    --senal
    signal Q : STD_LOGIC_VECTOR (3 downto 0);
    signal EQ,NE,LT,LE,GT,GE :  STD_LOGIC;
    
begin
    Bloq_Cond_tb:Bloq_Cond port map(Q,EQ,NE,LT,LE,GT,GE);
    
    tb:process
        begin
            Q <= "0000";
            wait for 10 ns;
            Q <= "0001";
            wait for 10 ns;
            Q <= "0010";
            wait for 10 ns;
            Q <= "0011";
            wait for 10 ns;
            Q <= "0100";
            wait for 10 ns;
            Q <= "0101";
            wait for 10 ns;
            Q <= "0110";
            
            wait;
    end process;    

end Behavioral;
