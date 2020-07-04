
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity sim_aluN is
--  Port ( );
end sim_aluN;

architecture Behavioral of sim_aluN is
component aluN is
    generic( num_bits:integer:=4); 
    Port ( a,b : in STD_LOGIC_VECTOR(num_bits-1 downto 0);
           aluop : in std_logic_vector (3 downto 0);
           res : out STD_LOGIC_vector (num_bits-1 downto 0);
           n,z,ov,co:out std_logic
           );
end component;
signal a : std_logic_vector(3 downto 0) := X"0";
signal b : std_logic_vector(3 downto 0) := X"0";
signal aluop : std_logic_vector(3 downto 0):= X"0"; 
signal res :std_logic_vector(3 downto 0);
signal n : std_logic; 
signal z :std_logic;
signal ov :std_logic;
signal co :std_logic;
begin
alu_4_bits:aluN Port map(
    a => a,
    b => b,
    aluop => aluop,
    res => res,
    n => n,
    z => z,
    ov => ov,
    co => co
    );
    
--sela,selb,op1,op0
practica4:process
begin
    a <= "0101";
    b <= "1110";
    aluop <= "0011";-- a+b
    wait for 10 ns;
    aluop <= "0111";--a-b
    wait for 10 ns;
    aluop <= "0000";--and
    wait for 10 ns;
    aluop <= "1101";--nand
    wait for 10 ns;
    aluop <= "0001";--or
    wait for 10 ns;
    aluop <= "1100";--nor
    wait for 10 ns;
    aluop <= "0010";--xor
    wait for 10 ns;
    aluop <= "1010";--xnor
    wait for 10 ns;
    
    a <= "0101";
    b <= "0111";
    aluop <= "0011";-- a+b
    wait for 10 ns;
    
    a <= "0101";
    b <= "0101";
    aluop <= "0111";--a-b
    wait for 10 ns;
    aluop <= "1101";--nand
    wait for 10 ns;
    wait;
    

end process;

end Behavioral;
