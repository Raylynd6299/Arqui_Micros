library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Arc_Reg is
    Port ( writeData : in STD_LOGIC_VECTOR (15 downto 0);
           writeReg : in STD_LOGIC_VECTOR (3 downto 0);
           readReg1 : in STD_LOGIC_VECTOR (3 downto 0);
           readReg2 : in STD_LOGIC_VECTOR (3 downto 0);
           shamt : in STD_LOGIC_VECTOR (3 downto 0);
           WR,CLK : in STD_LOGIC;
           SHE,DIR,clr : in STD_LOGIC;
           readData1 : inout STD_LOGIC_VECTOR (15 downto 0);
           readData2 : out STD_LOGIC_VECTOR (15 downto 0));
end Arc_Reg;

architecture Behavioral of Arc_Reg is
component registro1
    Port ( d : in STD_LOGIC_VECTOR (15 downto 0);
           q : out STD_LOGIC_VECTOR (15 downto 0);
           clr,clk,l : in STD_LOGIC);
end component;
component Barrel 
    Port ( dato : in STD_LOGIC_VECTOR (15 downto 0);
           res : out STD_LOGIC_VECTOR (15 downto 0);
           dir : std_logic;
           s : in STD_LOGIC_VECTOR (3 downto 0));
end component;
component mux_16
    Port (canal_0:in std_logic_vector(15 downto 0);
        canal_1:in std_logic_vector(15 downto 0);
        canal_2:in std_logic_vector(15 downto 0);
        canal_3:in std_logic_vector(15 downto 0);
        canal_4:in std_logic_vector(15 downto 0);
        canal_5:in std_logic_vector(15 downto 0);
        canal_6:in std_logic_vector(15 downto 0);
        canal_7:in std_logic_vector(15 downto 0);
        canal_8:in std_logic_vector(15 downto 0);
        canal_9:in std_logic_vector(15 downto 0);
        canal_10:in std_logic_vector(15 downto 0);
        canal_11:in std_logic_vector(15 downto 0);
        canal_12:in std_logic_vector(15 downto 0);
        canal_13:in std_logic_vector(15 downto 0);
        canal_14:in std_logic_vector(15 downto 0);
        canal_15:in std_logic_vector(15 downto 0);
        selec: in STD_LOGIC_VECTOR (3 downto 0);
        Salida :out std_logic_vector(15 downto 0) );
end component;
    
component demux_16
    Port(salida:out std_logic_vector(15 downto 0);
        entrada:in  std_logic;
        selector:in std_logic_vector(3 downto 0));
end component;

component mux2_1 
    Port ( p,s : in STD_LOGIC_VECTOR (15 downto 0);
           sel : in STD_LOGIC;
           sout : out STD_LOGIC_VECTOR (15 downto 0));
end component;

signal BS_out :std_logic_vector(15 downto 0);--salida del barrel shifter
signal WRSHE_out :std_logic_vector(15 downto 0);
signal WR_writeREG:std_logic_vector(15 downto 0);
TYPE banco is array (0 to 15) of std_logic_vector(15 downto 0);
signal q:banco;
begin
    WR_writeregister: demux_16 POrt map(
        salida => WR_writeREG,
        entrada => WR,
        selector => writeReg
    );

    Barrel_shifter:Barrel Port map(
        dato => readData1,
        res => BS_out,
        dir => DIR,      
        s => shamt
    );
    
    entrada_registros: mux2_1 port map(
        sel => SHE,
        p => writeData,
        s => BS_out,
        sout =>WRSHE_out
    );
    
    ciclo: for i in 0 to 15 generate
        Registros:registro1 PORT MAP(
        d=>WRSHE_out,
        q => q(i),
        clr =>clr,
        clk => CLK,
        L =>WR_writeREG(i)
        );
    end generate;
    
    muxreadData1:mux_16 Port map(
        canal_0 => q(0),
        canal_1 => q(1),
        canal_2 => q(2),
        canal_3 => q(3),
        canal_4 => q(4),
        canal_5 => q(5),
        canal_6 => q(6),
        canal_7 => q(7),
        canal_8 => q(8),
        canal_9 => q(9),
        canal_10 => q(10),
        canal_11 => q(11),
        canal_12 => q(12),
        canal_13 => q(13),
        canal_14 => q(14),
        canal_15 => q(15),
        selec => readReg1,
        Salida =>readData1
    );
    muxreadData2:mux_16 Port map(
        canal_0 => q(0),
        canal_1 => q(1),
        canal_2 => q(2),
        canal_3 => q(3),
        canal_4 => q(4),
        canal_5 => q(5),
        canal_6 => q(6),
        canal_7 => q(7),
        canal_8 => q(8),
        canal_9 => q(9),
        canal_10 => q(10),
        canal_11 => q(11),
        canal_12 => q(12),
        canal_13 => q(13),
        canal_14 => q(14),
        canal_15 => q(15),
        selec => readReg2,
        Salida =>readData2
    );
    

end Behavioral;
