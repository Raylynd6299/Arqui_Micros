library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity mem_program is
    generic(Bits_bus_instruc:INTEGER:=25;
            Bits_bus_dir:INTEGER:=10);
    Port ( Bus_direc : in STD_LOGIC_VECTOR (Bits_bus_dir-1 downto 0);
           Bus_sig_instru : out STD_LOGIC_VECTOR (Bits_bus_instruc-1 downto 0));
end mem_program;

architecture Behavioral of mem_program is
--CODIGOS DE OPERACION
constant TipeR: std_logic_vector(4 downto 0):="00000";
constant LI: std_logic_vector(4 downto 0):="00001";
constant LWI: std_logic_vector(4 downto 0):="00010";
constant LW: std_logic_vector(4 downto 0):="10111";
constant SWI: std_logic_vector(4 downto 0):="00011";
constant SW: std_logic_vector(4 downto 0):="00100";
constant ADDI: std_logic_vector(4 downto 0):="00101";
constant SUBI: std_logic_vector(4 downto 0):="00110";
constant ANDI: std_logic_vector(4 downto 0):="00111";
constant ORI: std_logic_vector(4 downto 0):="01000";
constant XORI: std_logic_vector(4 downto 0):="01001";
constant NANDI: std_logic_vector(4 downto 0):="01010";
constant NORI: std_logic_vector(4 downto 0):="01011";
constant XNORI: std_logic_vector(4 downto 0):="01100";
constant BEQI: std_logic_vector(4 downto 0):="01101";
constant BNEI: std_logic_vector(4 downto 0):="01110";
constant BLTI: std_logic_vector(4 downto 0):="01111";
constant BLETI: std_logic_vector(4 downto 0):="10000";
constant BGTI: std_logic_vector(4 downto 0):="10001";
constant BGETI: std_logic_vector(4 downto 0):="10010";
constant B: std_logic_vector(4 downto 0):="10011";
constant CALL: std_logic_vector(4 downto 0):="10100";
constant RET: std_logic_vector(4 downto 0):="10101";
constant NOP: std_logic_vector(4 downto 0):="10110";

--REGISTROS
CONSTANT R0: STD_LOGIC_VECTOR(3 DOWNTO 0):="0000";
CONSTANT R1: STD_LOGIC_VECTOR(3 DOWNTO 0):="0001";
CONSTANT R2: STD_LOGIC_VECTOR(3 DOWNTO 0):="0010";
CONSTANT R3: STD_LOGIC_VECTOR(3 DOWNTO 0):="0011";
CONSTANT R4: STD_LOGIC_VECTOR(3 DOWNTO 0):="0100";
CONSTANT R5: STD_LOGIC_VECTOR(3 DOWNTO 0):="0101";
CONSTANT R6: STD_LOGIC_VECTOR(3 DOWNTO 0):="0110";
CONSTANT R7: STD_LOGIC_VECTOR(3 DOWNTO 0):="0111";
CONSTANT R8: STD_LOGIC_VECTOR(3 DOWNTO 0):="1000";
CONSTANT R9: STD_LOGIC_VECTOR(3 DOWNTO 0):="1001";
CONSTANT R10: STD_LOGIC_VECTOR(3 DOWNTO 0):="1010";
CONSTANT R11: STD_LOGIC_VECTOR(3 DOWNTO 0):="1011";
CONSTANT R12: STD_LOGIC_VECTOR(3 DOWNTO 0):="1100";
CONSTANT R13: STD_LOGIC_VECTOR(3 DOWNTO 0):="1101";
CONSTANT R14: STD_LOGIC_VECTOR(3 DOWNTO 0):="1110";
CONSTANT R15: STD_LOGIC_VECTOR(3 DOWNTO 0):="1111";

--S/U
CONSTANT SU: std_logic_vector(3 downto 0):="0000";
--CODIGO DE FIN DE OPERACION
CONSTANT F_ADD: STD_LOGIC_VECTOR(3 DOWNTO 0):="0000";
CONSTANT F_SUB: STD_LOGIC_VECTOR(3 DOWNTO 0):="0001";
CONSTANT F_AND: STD_LOGIC_VECTOR(3 DOWNTO 0):="0010";
CONSTANT F_OR: STD_LOGIC_VECTOR(3 DOWNTO 0):="0011";
CONSTANT F_XOR: STD_LOGIC_VECTOR(3 DOWNTO 0):="0100";
CONSTANT F_NAND: STD_LOGIC_VECTOR(3 DOWNTO 0):="0101";
CONSTANT F_NOR: STD_LOGIC_VECTOR(3 DOWNTO 0):="0110";
CONSTANT F_XNOR: STD_LOGIC_VECTOR(3 DOWNTO 0):="0111";
CONSTANT F_NOT: STD_LOGIC_VECTOR(3 DOWNTO 0):="1000";
CONSTANT F_SLL: STD_LOGIC_VECTOR(3 DOWNTO 0):="1001";
CONSTANT F_SRL: STD_LOGIC_VECTOR(3 DOWNTO 0):="1010";


Type memoria  is array(0 to 2**Bits_bus_dir -1) of std_logic_vector(Bus_sig_instru'RANGE);
signal memoria_programa: memoria:=( LI & R0 & X"0000",
                               LI & R1 & X"0005",
                               LI & R2 & X"0003",
                               LI & R3 & X"0000",
                               TipeR & R3 & R3 & R1 & SU & F_ADD,
                               ADDI & R0 & R0 & X"001",
                               BLTI & R2 & R0 & X"FFE",
                               NOP & SU & SU & SU & SU & SU,
                               B & SU & X"0007",
                               others=>"0"&X"000000");

begin
    Bus_sig_instru <= memoria_programa(CONV_INTEGER(Bus_direc)); 
end Behavioral;
