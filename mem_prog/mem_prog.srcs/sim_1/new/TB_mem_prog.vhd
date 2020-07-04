LIBRARY ieee;
LIBRARY STD;
USE STD.TEXTIO.ALL;
USE ieee.std_logic_TEXTIO.ALL;	--PERMITE USAR STD_LOGIC 

USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_UNSIGNED.ALL;
USE ieee.std_logic_ARITH.ALL;

entity TB_mem_prog is
    generic(Bits_bus_instruc:INTEGER:=25;
            Bits_bus_dir:INTEGER:=10);
end TB_mem_prog;

architecture Behavioral of TB_mem_prog is

component mem_program 
    Port ( Bus_direc : in STD_LOGIC_VECTOR (Bits_bus_dir-1 downto 0);
           Bus_sig_instru : out STD_LOGIC_VECTOR (Bits_bus_instruc-1 downto 0));
end component;
    --inputs
    signal Bus_direc :  STD_LOGIC_VECTOR (Bits_bus_dir-1 downto 0);
    
    --outputs
    signal Bus_sig_instru :  STD_LOGIC_VECTOR (Bits_bus_instruc-1 downto 0);
       
    
    
begin

    tb_mem_programa: mem_program Port map(
        Bus_direc => Bus_direc,
        Bus_sig_instru => Bus_sig_instru
    );
    
   
   
   simulacion:process
        file ARCH_SAL : TEXT;
        variable LINEA_SAL: line;
        variable VAR_Bus_sig_instru :  STD_LOGIC_VECTOR (Bits_bus_instruc-1 downto 0);
        
        variable OP: std_logic_vector(4 downto 0);
        variable for19to16 : std_logic_vector( 3 downto 0);
        variable for15to12 : std_logic_vector( 3 downto 0);
        variable for11to8 : std_logic_vector( 3 downto 0);
        variable for7to4 : std_logic_vector( 3 downto 0);
        variable for3to0 : std_logic_vector( 3 downto 0);

        VARIABLE CADENA : STRING(1 TO 8);
        variable PC: INTEGER:=0;
        
    begin	
        file_open(ARCH_SAL, "C:\Users\Ray\Desktop\Arquitectura\mem_prog\SALIDA.TXT", WRITE_MODE); 
        
        CADENA := "___OP___";
		write(LINEA_SAL, CADENA, right, CADENA'LENGTH+1);	
		CADENA := " 19...16";
		write(LINEA_SAL, CADENA, right, CADENA'LENGTH+1);	
		CADENA := " 15...12";
		write(LINEA_SAL, CADENA, right, CADENA'LENGTH+1);	
		CADENA := " 11...08";
		write(LINEA_SAL, CADENA, right, CADENA'LENGTH+1);	
        CADENA := " 07...04";
		write(LINEA_SAL, CADENA, right, CADENA'LENGTH+1);
		CADENA := " 03...00";
		write(LINEA_SAL, CADENA, right, CADENA'LENGTH+1);
		
		writeline(ARCH_SAL,LINEA_SAL);
		
		wait for 100 ns;
		for I in 0 to 12 loop
		  
		  Bus_direc <= conv_std_logic_vector(PC,Bits_bus_dir);
		  PC := PC + 1;
		  
		 --wait until rising_edge(CLK);
		  wait for 10ns;
		  VAR_Bus_sig_instru := Bus_sig_instru;
		  OP := Bus_sig_instru(24 downto 20);
		  for19to16 := Bus_sig_instru(19 downto 16);
		  for15to12 := Bus_sig_instru(15 downto 12);
		  for11to8 := Bus_sig_instru(11 downto 8);
		  for7to4 := Bus_sig_instru(7 downto 4);
		  for3to0 := Bus_sig_instru(3 downto 0);
		  
		  WRITE(LINEA_SAL,OP, right, 5);
		  WRITE(LINEA_SAL,for19to16, right, 5);
		  WRITE(LINEA_SAL,for15to12, right, 5);
		  WRITE(LINEA_SAL,for11to8, right, 5);
	      WRITE(LINEA_SAL,for7to4, right, 5);
		  WRITE(LINEA_SAL,for3to0, right, 5);
		  writeline(ARCH_SAL,LINEA_SAL);
		end loop;
		file_close(ARCH_SAL);
	   wait;		
    end process;
    

end Behavioral;
