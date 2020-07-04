library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity Mux is
    Port ( bus_in : in STD_LOGIC_VECTOR(7 downto 0);
              sel : in STD_LOGIC;
           bus_out: out STD_LOGIC_VECTOR(7 downto 0));
end Mux;
architecture Behavioral of Mux is
signal raya : std_logic_vector(7 downto 0) := "00000010";
begin
    process(sel,bus_in)
        begin
            case sel is
                when '0' => bus_out <= raya;
                when others => bus_out <= bus_in;
            end case;
    end process;
end Behavioral;