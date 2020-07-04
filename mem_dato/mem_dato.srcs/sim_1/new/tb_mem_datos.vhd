LIBRARY ieee;
LIBRARY STD;
USE STD.TEXTIO.ALL;
USE ieee.std_logic_TEXTIO.ALL;	--PERMITE USAR STD_LOGIC 

USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_UNSIGNED.ALL;
USE ieee.std_logic_ARITH.ALL;

entity tb_mem_datos is
    generic(Bits_bus_dato:INTEGER:=16;
            Bits_bus_dir:INTEGER:=11);
end tb_mem_datos;

architecture Behavioral of tb_mem_datos is

component memo_dato 
    
    Port ( Bus_dir : in STD_LOGIC_VECTOR (Bits_bus_dir-1 downto 0);
           Bus_dat_in : in STD_LOGIC_VECTOR (Bits_bus_dato-1 downto 0);
           WD : in STD_LOGIC;
           clk : in STD_LOGIC;
           Bus_data_out : out STD_LOGIC_VECTOR (Bits_bus_dato-1 downto 0));
end component;
    --inputs
    signal Bus_dir : STD_LOGIC_VECTOR (Bits_bus_dir-1 downto 0);
    signal Bus_dat_in : STD_LOGIC_VECTOR (Bits_bus_dato-1 downto 0);
    signal WD : STD_LOGIC;
    signal clk : STD_LOGIC;
    
    --outputs
    signal Bus_data_out : STD_LOGIC_VECTOR (Bits_bus_dato-1 downto 0);
    
    --clock period
    constant CLK_period : time := 10 ns;
begin

    tb_mem_datos: memo_dato Port map(
        Bus_dir => Bus_dir,
        Bus_dat_in => Bus_dat_in,
        WD => WD,
        clk => clk,
        Bus_data_out => Bus_data_out
    );
    CLK_process :process
       begin
            clk <= '0';
            wait for CLK_period/2;
            clk <= '1';
            wait for CLK_period/2;
   end process;
   
   
   simulacion:process
        file ARCH_SAL : TEXT;
        variable LINEA_SAL: line;
        variable VAR_Bus_data_out: STD_LOGIC_VECTOR (Bits_bus_dato-1 downto 0);
        
        file ARCH_ENT :TEXT;
        variable LINEA_ENT :line;
        variable VAR_Bus_dir : STD_LOGIC_VECTOR (Bits_bus_dir-1 downto 0);
        variable VAR_Bus_dat_in : STD_LOGIC_VECTOR (Bits_bus_dato-1 downto 0);
        variable VAR_WD:  STD_LOGIC;        
        VARIABLE CADENA : STRING(1 TO 8);
        
    begin
        file_open(ARCH_ENT, "C:\Users\Ray\Desktop\Arquitectura\mem_dato\ENTRADA.TXT", READ_MODE); 	
        file_open(ARCH_SAL, "C:\Users\Ray\Desktop\Arquitectura\mem_dato\SALIDA.TXT", WRITE_MODE); 
        
        CADENA := "__add___";
		write(LINEA_SAL, CADENA, right, CADENA'LENGTH+1);	--ESCRIBE LA CADENA "RR1"
		CADENA := "  __WD__";
		write(LINEA_SAL, CADENA, right, CADENA'LENGTH+1);	--ESCRIBE LA CADENA "RR2"
		CADENA := " datain_";
		write(LINEA_SAL, CADENA, right, CADENA'LENGTH+1);	--ESCRIBE LA CADENA "SHAMT"
		CADENA := " dataOut";
		write(LINEA_SAL, CADENA, right, CADENA'LENGTH+1);	--ESCRIBE LA CADENA "WREG"

		writeline(ARCH_SAL,LINEA_SAL);
		
		wait for 100 ns;
		for I in 0 to 11 loop
		  readline(ARCH_ENT,LINEA_ENT);
		  
		  Hread(LINEA_ENT,VAR_Bus_dir);
		  Bus_dir <= VAR_Bus_dir;
		  Hread(LINEA_ENT,VAR_Bus_dat_in);
		  Bus_dat_in <= VAR_Bus_dat_in;
		  read(LINEA_ENT,VAR_WD);
		  WD <= VAR_WD;
		  
		  
		 --wait until rising_edge(CLK);
		  wait for 10ns;
		  VAR_Bus_data_out := Bus_data_out;
		  
		  
		  
		  HWRITE(LINEA_SAL,VAR_Bus_dir, right, 5);
		  WRITE(LINEA_SAL,VAR_WD, right, 5);
		  HWRITE(LINEA_SAL,VAR_Bus_dat_in, right, 5);
		  HWRITE(LINEA_SAL,VAR_Bus_data_out, right, 5);
	
		  writeline(ARCH_SAL,LINEA_SAL);
		end loop;
		file_close(ARCH_ENT);
		file_close(ARCH_SAL);
	   wait;		
    end process;
    

end Behavioral;
