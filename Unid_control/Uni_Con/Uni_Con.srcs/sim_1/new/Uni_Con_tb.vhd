library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Uni_Con_tb is
--  Port ( );
end Uni_Con_tb;

architecture Behavioral of Uni_Con_tb is

    component Uni_Con 
        Port ( TIPOR,BEQI,BNEQI,BLTI,BLETI,BGTI,BGETI : in STD_LOGIC;
               NA : in STD_LOGIC;
               EQ,NE,LT,LE,GT,GE : in STD_LOGIC;
               SM,SDOPC : out STD_LOGIC);
    end component;

    --senal
    signal TIPOR,BEQI,BNEQI,BLTI,BLETI,BGTI,BGETI,NA : STD_LOGIC;
    signal EQ,NE,LT,LE,GT,GE,SM,SDOPC : STD_LOGIC;
    
    constant CLK_period : time := 10 ns;
begin
    Uni_Con_tb:Uni_Con port map( 
        TIPOR => TIPOR,
        BEQI  => BEQI,
        BNEQI => BNEQI,
        BLTI  => BLTI,
        BLETI => BLETI,
        BGTI  => BGTI,
        BGETI => BGETI,
        NA    => NA,
        EQ    => EQ,
        NE    => NE,
        LT    => LT,
        LE    => LE,
        GT    => GT,
        GE    => GE,
        SM    => SM,
        SDOPC => SDOPC
    );
    CLK_process :process
        begin
            NA <= '1';
        wait for CLK_period/2;
            NA <= '0';
        wait for CLK_period/2;
     end process;

    tb:process 
        begin
            TIPOR <= '0';
            BEQI  <= '0';
            BNEQI <= '0';
            BLTI  <= '0';
            BLETI <= '0';
            BGTI  <= '0';
            BGETI <= '0';
            EQ    <= '0';
            NE    <= '0';
            LT    <= '0';
            LE    <= '0';
            GT    <= '0';
            GE    <= '0';
            wait for 10 ns;
            TIPOR <= '1';
            wait for 10 ns;
            TIPOR <= '0';
            wait for 10 ns;
            BEQI  <= '1';
            EQ    <= '1';
            wait for 10 ns;
            BEQI  <= '0';
            EQ    <= '0';
            BNEQI <= '1';
            NE    <= '0';
            wait;
    end process;    
end Behavioral;
