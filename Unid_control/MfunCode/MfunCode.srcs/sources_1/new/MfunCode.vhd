library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity MfunCode is
    Port ( funCode : in STD_LOGIC_VECTOR (3 downto 0);
           Micro : out STD_LOGIC_VECTOR (19 downto 0));
end MfunCode;

architecture Behavioral of MfunCode is
Type memoria  is array(0 to 15 ) of std_logic_vector(19 downto 0);
constant MfunCode: memoria:=("00000100010000110011",    
                            "00000100010001110011",
                            "00000100011100000011",
                            "00000100011100010011",
                            "00000100011100100011",
                            "00000100011111010011",
                            "00000100011111000011",
                            "00000100011110100011",
                            "00000100011111010011",
                            "00000001110000000000",
                            "00000001010000000000",                                                       
                              others=>X"00000");
begin

Micro <= MfunCode(CONV_INTEGER(funCode));


end Behavioral;
