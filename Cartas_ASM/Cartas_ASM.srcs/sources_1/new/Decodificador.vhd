library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity Decodificador is
    Port ( bus_in : in STD_LOGIC_VECTOR(3 downto 0);
           bus_out: out STD_LOGIC_VECTOR(7 downto 0));
end Decodificador;
architecture Behavioral of Decodificador is
                                          --"abcdefgp"
signal zero : std_logic_vector(7 downto 0) := "11111100";--listo
signal uno : std_logic_vector(7 downto 0) := "01100000";
signal dos : std_logic_vector(7 downto 0) := "11011010";
signal tres : std_logic_vector(7 downto 0) := "11110010";
signal cuatro : std_logic_vector(7 downto 0) := "01100110";
signal cinco : std_logic_vector(7 downto 0) := "10110110";
signal seis : std_logic_vector(7 downto 0) := "10111110";
signal siete : std_logic_vector(7 downto 0) := "11100000";
signal ocho : std_logic_vector(7 downto 0) := "11111110";
signal nueve : std_logic_vector(7 downto 0) := "11100110";
begin
    bus_out <= zero when bus_in = "0000" else
                uno when bus_in = "0001" else
                dos when bus_in = "0010" else
               tres when bus_in = "0011" else
             cuatro when bus_in = "0100" else
              cinco when bus_in = "0101" else
               seis when bus_in = "0110" else
              siete when bus_in = "0111" else
               ocho when bus_in = "1000" else
              nueve when bus_in = "1001";
    
end Behavioral;