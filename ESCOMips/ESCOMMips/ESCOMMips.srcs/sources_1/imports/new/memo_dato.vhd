library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity memo_dato is
    generic(Bits_bus_dato:INTEGER:=16;
            Bits_bus_dir:INTEGER:=10);
    Port ( Bus_dir : in STD_LOGIC_VECTOR (Bits_bus_dir-1 downto 0);
           Bus_dat_in : in STD_LOGIC_VECTOR (Bits_bus_dato-1 downto 0);
           WD : in STD_LOGIC;
           clk : in STD_LOGIC;
           Bus_data_out : out STD_LOGIC_VECTOR (Bits_bus_dato-1 downto 0));
end memo_dato;

architecture Behavioral of memo_dato is
Type memoria  is array(0 to 2**Bits_bus_dir -1) of std_logic_vector(Bus_dat_in'RANGE);
signal RAM: memoria:=(others => X"0000");
begin
     
    Ram_process:process(WD,clk,Bus_dir,RAM,Bus_dat_in)
    begin
        if(rising_edge(clk))then
            if(WD = '1')then
                RAM( CONV_INTEGER(Bus_dir)) <= Bus_dat_in;
            end if;
        end if; 
        Bus_data_out <= RAM(CONV_INTEGER(Bus_dir));
    end process;
    

end Behavioral;
