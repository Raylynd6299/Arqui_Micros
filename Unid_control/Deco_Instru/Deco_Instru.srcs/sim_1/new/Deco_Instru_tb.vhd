library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Deco_Instru_tb is
--  Port ( );
end Deco_Instru_tb;

architecture Behavioral of Deco_Instru_tb is
    component Deco_Instru 
        Port ( opCode : in STD_LOGIC_VECTOR (4 downto 0);
               TIPOR,BEQI,BNEQI,BLTI,BLETI,BGTI,BGETI : out STD_LOGIC);
    end component;
    --senal
    signal opCode : STD_LOGIC_VECTOR (4 downto 0);
    signal TIPOR,BEQI,BNEQI,BLTI,BLETI,BGTI,BGETI : STD_LOGIC;
begin
    Deco_Instru_tb:Deco_Instru port map(opCode,TIPOR,BEQI,BNEQI,BLTI,BLETI,BGTI,BGETI);
     tb:process
        begin
            opCode <= "00000";
            wait for 10 ns;
            opCode <= "01101";
            wait for 10 ns;
            opCode <= "01110";
            wait for 10 ns;
            opCode <= "01111";
            wait for 10 ns;
            opCode <= "10000";
            wait for 10 ns;
            opCode <= "10001";
            wait for 10 ns;
            opCode <= "10010";
            wait;
     end process;

end Behavioral;
