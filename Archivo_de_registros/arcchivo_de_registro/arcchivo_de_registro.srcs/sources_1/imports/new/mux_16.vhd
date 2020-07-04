
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux_16 is
    Port (canal_0:in std_logic_vector(15 downto 0);
        canal_1:in std_logic_vector(15 downto 0);
        canal_2:in std_logic_vector(15 downto 0);
        canal_3:in std_logic_vector(15 downto 0);
        canal_4:in std_logic_vector(15 downto 0);
        canal_5:in std_logic_vector(15 downto 0);
        canal_6:in std_logic_vector(15 downto 0);
        canal_7:in std_logic_vector(15 downto 0);
        canal_8:in std_logic_vector(15 downto 0);
        canal_9:in std_logic_vector(15 downto 0);
        canal_10:in std_logic_vector(15 downto 0);
        canal_11:in std_logic_vector(15 downto 0);
        canal_12:in std_logic_vector(15 downto 0);
        canal_13:in std_logic_vector(15 downto 0);
        canal_14:in std_logic_vector(15 downto 0);
        canal_15:in std_logic_vector(15 downto 0);
        selec: in STD_LOGIC_VECTOR (3 downto 0);
    Salida :out std_logic_vector(15 downto 0) );
end mux_16;

architecture Behavioral of mux_16 is

begin
    process(selec,canal_0,canal_1,canal_2,canal_3,canal_4,canal_5,canal_6,canal_7,canal_8)
        begin
            case selec is
                    when "0000"  =>Salida<= canal_0;
                    when "0001"  =>Salida<= canal_1;
                    when "0010"  =>Salida<= canal_2;
                    when "0011"  =>Salida<= canal_3;
                    when "0100"  =>Salida<= canal_4;
                    when "0101"  =>Salida<= canal_5;
                    when "0110"  =>Salida<= canal_6;
                    when "0111"  =>Salida<= canal_7;
                    when "1000"  =>Salida<= canal_8;
                    when "1001"  =>Salida<= canal_9;
                    when "1010"  =>Salida<= canal_10;
                    when "1011"  =>Salida<= canal_11;
                    when "1100"  =>Salida<= canal_12;
                    when "1101"  =>Salida<= canal_13;
                    when "1110"  =>Salida<= canal_14;
                    when others => Salida<= canal_15;
                end case;
    end process;

end Behavioral;
