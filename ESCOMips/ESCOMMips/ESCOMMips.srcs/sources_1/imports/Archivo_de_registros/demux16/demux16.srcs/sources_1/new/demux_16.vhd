library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity demux_16 is
    Port( salida:out std_logic_vector(15 downto 0);
        entrada:in  std_logic;
        selector:in std_logic_vector(3 downto 0)
        );
end demux_16;

architecture Behavioral of demux_16 is

begin
    process(selector,entrada)
        begin
            if (entrada = '1')then
                case selector is
                    when "0000"  =>salida<= "0000000000000001";
                    when "0001"  =>salida<= "0000000000000010";
                    when "0010"  =>salida<= "0000000000000100";
                    when "0011"  =>salida<= "0000000000001000";
                    when "0100"  =>salida<= "0000000000010000";
                    when "0101"  =>salida<= "0000000000100000";
                    when "0110"  =>salida<= "0000000001000000";
                    when "0111"  =>salida<= "0000000010000000";
                    when "1000"  =>salida<= "0000000100000000";
                    when "1001"  =>salida<= "0000001000000000";
                    when "1010"  =>salida<= "0000010000000000";
                    when "1011"  =>salida<= "0000100000000000";
                    when "1100"  =>salida<= "0001000000000000";
                    when "1101"  =>salida<= "0010000000000000";
                    when "1110"  =>salida<= "0100000000000000";
                    when others => salida<= "1000000000000000";
                end case;
            else
                salida<="0000000000000000";
            end if;
    end process;

end Behavioral;
