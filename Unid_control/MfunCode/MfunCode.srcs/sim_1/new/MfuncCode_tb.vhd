library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MfuncCode_tb is
--  Port ( );
end MfuncCode_tb;

architecture Behavioral of MfuncCode_tb is
    component MfunCode 
        Port ( funCode : in STD_LOGIC_VECTOR (3 downto 0);
               Micro : out STD_LOGIC_VECTOR (19 downto 0));
    end component;
    
    --senal
    signal funCode : STD_LOGIC_VECTOR (3 downto 0);
    signal Micro : STD_LOGIC_VECTOR (19 downto 0);
begin
    MfunCode_tb:MfunCode port map(
        funCode => funCode,
        Micro   => Micro
    );
    
    tb:process
        begin
            funCode <= "0000";
            wait for 10 ns; 
            funCode <= "0001";
            wait for 10 ns;  
            funCode <= "0010";
            wait for 10 ns; 
            funCode <= "0011";
            wait for 10 ns;
            funCode <= "0100";
            wait for 10 ns;
            funCode <= "0101";
            wait for 10 ns;
            funCode <= "0110";
            wait for 10 ns;
            funCode <= "0111";
            wait for 10 ns;
            funCode <= "1000";
            wait for 10 ns;
            funCode <= "1001";
            wait for 10 ns;
            funCode <= "1010";
            wait for 10 ns;
            funCode <= "1011";
            wait for 10 ns;
            funCode <= "1100";
            wait for 10 ns;
            funCode <= "1101";
            wait for 10 ns;
            funCode <= "1110";
            wait for 10 ns;
            funCode <= "1111";
            wait;
                 
    end process;
end Behavioral;
