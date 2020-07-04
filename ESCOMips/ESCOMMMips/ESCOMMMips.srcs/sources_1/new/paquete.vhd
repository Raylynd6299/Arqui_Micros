library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

package paquete is 
--Pila
component pila is
    generic ( 
        N : integer := 3;
        M : integer := 16
    );
    Port ( PCin : in STD_LOGIC_VECTOR (M-1 downto 0);
           DW : in STD_LOGIC;
           UP : in STD_LOGIC;
           WPC : in STD_LOGIC;
           CLK : in STD_LOGIC;
           CLR : in STD_LOGIC;
           PCout : out STD_LOGIC_VECTOR (M-1 downto 0);
           SP_out : out STD_LOGIC_VECTOR (N-1 downto 0));
end component;

--Unidad de Control
component UC_F is
    Port ( funCode,Flags : in STD_LOGIC_VECTOR (3 downto 0);
           opCode : in STD_LOGIC_VECTOR (4 downto 0);
           CLK,CLR : in STD_LOGIC;
           Microinst : inout STD_LOGIC_VECTOR (19 downto 0));
end component;

--SDMP MUX
component SDMP is
    Port ( Dato0,Dato1 : in STD_LOGIC_VECTOR (15 downto 0);
           sel : in STD_LOGIC;
           DATOout : out STD_LOGIC_VECTOR (15 downto 0));
end component;

--Memoria de Programa
component mem_program is
    generic(Bits_bus_instruc:INTEGER:=25;
            Bits_bus_dir:INTEGER:=10);
    Port ( Bus_direc : in STD_LOGIC_VECTOR (Bits_bus_dir-1 downto 0);
           Bus_sig_instru : out STD_LOGIC_VECTOR (Bits_bus_instruc-1 downto 0));
end component;

--SR2 MUX
component SR2 is
    Port ( Dato0,Dato1 : in STD_LOGIC_VECTOR (3 downto 0);
           sel : in STD_LOGIC;
           DATOout : out  STD_LOGIC_VECTOR(3 downto 0));
end component;

--SWD MUX
component SWD is
    Port ( Dato0,Dato1 : in STD_LOGIC_VECTOR (15 downto 0);
           sel : in STD_LOGIC;
           DATOout : out  STD_LOGIC_VECTOR(15 downto 0));
end component;

--extDIR 
component extDIR is
    Port ( entrada : in STD_LOGIC_VECTOR (11 downto 0);
           salida : out STD_LOGIC_VECTOR (15 downto 0));
end component;

--extSIG
component extSIG is
    Port ( entrada : in STD_LOGIC_VECTOR (11 downto 0);
           salida : out STD_LOGIC_VECTOR (15 downto 0));
end component;

--SEXT MUX
component SEXT is
    Port ( Dato0,Dato1 : in STD_LOGIC_VECTOR (15 downto 0);
           sel : in STD_LOGIC;
           DATOout : out  STD_LOGIC_VECTOR(15 downto 0));
end component;

--Archivo de Registros
component Arc_Reg is
    Port ( writeData : in STD_LOGIC_VECTOR (15 downto 0);
           writeReg : in STD_LOGIC_VECTOR (3 downto 0);
           readReg1 : in STD_LOGIC_VECTOR (3 downto 0);
           readReg2 : in STD_LOGIC_VECTOR (3 downto 0);
           shamt : in STD_LOGIC_VECTOR (3 downto 0);
           WR,CLK : in STD_LOGIC;
           SHE,DIR,clr : in STD_LOGIC;
           readData1 : inout STD_LOGIC_VECTOR (15 downto 0);
           readData2 : out STD_LOGIC_VECTOR (15 downto 0));
end component;

--ALU
component aluN is
    generic( num_bits:integer:=16); 
    Port ( a,b : in STD_LOGIC_VECTOR(num_bits-1 downto 0);
           aluop : in std_logic_vector (3 downto 0);
           res : out STD_LOGIC_vector (num_bits-1 downto 0);
           n,z,ov,co:out std_logic
           );
end component;

--Memoria de Datos
component memo_dato is
    generic(Bits_bus_dato:INTEGER:=16;
            Bits_bus_dir:INTEGER:=10);
    Port ( Bus_dir : in STD_LOGIC_VECTOR (Bits_bus_dir-1 downto 0);
           Bus_dat_in : in STD_LOGIC_VECTOR (Bits_bus_dato-1 downto 0);
           WD : in STD_LOGIC;
           clk : in STD_LOGIC;
           Bus_data_out : out STD_LOGIC_VECTOR (Bits_bus_dato-1 downto 0));
end component;


end package;