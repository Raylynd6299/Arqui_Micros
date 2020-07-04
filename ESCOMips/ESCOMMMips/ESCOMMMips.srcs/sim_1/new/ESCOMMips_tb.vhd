library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ESCOMMips_tb is
--  Port ( );
end ESCOMMips_tb;

architecture Behavioral of ESCOMMips_tb is

component ESCOMMips is
    Port ( Instruccion_out : out STD_LOGIC_VECTOR (24 downto 0);
           MICROinstruccion_out : out STD_LOGIC_VECTOR(19 downto 0);
           Flags_out : out STD_LOGIC_VECTOR(3 downto 0);
           PC,RD1,RD2,ResALU,BUS_SR : out STD_LOGIC_VECTOR (15 downto 0);
           CLK,CLR : in STD_LOGIC);
end component;

--signal
signal MICROinstruccion_out : STD_LOGIC_VECTOR(19 downto 0);
signal Instruccion_out : STD_LOGIC_VECTOR (24 downto 0);
signal PC,RD1,RD2,ResALU,BUS_SR : STD_LOGIC_VECTOR (15 downto 0);
signal CLK,CLR : STD_LOGIC;
signal Flags_out : STD_LOGIC_VECTOR(3 downto 0);

--clock period
constant CLK_period : time := 10 ns;
    
begin
    ESCOMMips_tb:ESCOMMips port map (
    MICROinstruccion_out =>MICROinstruccion_out,
        CLR => CLR,
        CLK => CLK,
        Instruccion_out => Instruccion_out,
        Flags_out => Flags_out,
        PC => PC,
        RD1 => RD1,
        RD2 => RD2,
        ResALU => ResALU,
        BUS_SR => BUS_SR
    );
    
    CLK_process :process
        begin
            CLK <= '0';
        wait for CLK_period/2;
            CLK <= '1';
        wait for CLK_period/2;
    end process; 
    
    practica4:process
        begin
            CLR <= '1';
            wait for 20 ns;
            CLR <= '0';
            
            wait;
    end process;
end Behavioral;
