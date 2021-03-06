library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity suma1 is
    Port ( a,b,cin : in STD_LOGIC;
           s,cout : out STD_LOGIC);
end suma1;

architecture Behavioral of suma1 is
begin
    s <= a xor b xor cin;
    cout <= (a and cin) or (b and cin) or (a and b);


end Behavioral;
