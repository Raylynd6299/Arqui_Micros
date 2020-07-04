library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MopCode_tb is
--  Port ( );
end MopCode_tb;

architecture Behavioral of MopCode_tb is
    component MopCode is
        Port ( opCode : in STD_LOGIC_VECTOR (4 downto 0);
               Micro : out STD_LOGIC_VECTOR (19 downto 0));
    end component;
    
    --senal
    signal opCode : STD_LOGIC_VECTOR (4 downto 0);
    signal Micro : STD_LOGIC_VECTOR (19 downto 0);
    
begin
    MopCode_tb:MopCode port map(
        opCode => opCode,
        Micro   => Micro
    );
    
    tb:process
        begin
            opCode <= "00000";
            wait for 10 ns; 
            opCode <= "00001";
            wait for 10 ns;  
            opCode <= "00010";
            wait for 10 ns; 
            opCode <= "00011";
            wait for 10 ns;
            opCode <= "00100";
            wait for 10 ns;
            opCode <= "00101";
            wait for 10 ns;
            opCode <= "00110";
            wait for 10 ns;
            opCode <= "00111";
            wait for 10 ns;
            opCode <= "01000";
            wait for 10 ns;
            opCode <= "01001";
            wait for 10 ns;
            opCode <= "01010";
            wait for 10 ns;
            opCode <= "01011";
            wait for 10 ns;
            opCode <= "01100";
            wait for 10 ns;
            opCode <= "01101";
            wait for 10 ns;
            opCode <= "01110";
            wait for 10 ns;
            opCode <= "01111";
            wait;
    end process;

end Behavioral;
