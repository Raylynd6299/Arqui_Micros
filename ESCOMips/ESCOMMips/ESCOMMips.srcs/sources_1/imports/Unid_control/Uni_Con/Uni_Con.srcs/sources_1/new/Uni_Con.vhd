library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Uni_Con is
    Port ( TIPOR,BEQI,BNEQI,BLTI,BLETI,BGTI,BGETI : in STD_LOGIC;
           NA : in STD_LOGIC;
           EQ,NE,LT,LE,GT,GE : in STD_LOGIC;
           SM,SDOPC : out STD_LOGIC);
end Uni_Con;

architecture Behavioral of Uni_Con is

begin
    SDOPC<=(    (   (not NA) and (      (BEQI  and EQ ) or
										(BNEQI and NE ) or
										(BLTI  and LT ) or
										(BLETI and LE ) or
										(BGTI  and GT ) or
										(BGETI and GE ))
				) or (not (TIPOR or BEQI or BNEQI or BLTI or BLETI or BGTI or BGETI)) 
			);	
			
	SM<=(not TIPOR);

end Behavioral;
