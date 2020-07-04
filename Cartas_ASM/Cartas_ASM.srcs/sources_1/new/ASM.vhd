library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity ASM is
    Port ( INI,CLR,CLK : in STD_LOGIC;
           D : in STD_LOGIC_VECTOR (8 downto 0);
           SEG : out STD_LOGIC_VECTOR (7 downto 0);
           salida : out STD_LOGIC_VECTOR (8 downto 0));
end ASM;
architecture Behavioral of ASM is
    --COMPONENTES
    COMPONENT Mux
        Port ( bus_in : in STD_LOGIC_VECTOR(7 downto 0);
                  sel : in STD_LOGIC;
               bus_out: out STD_LOGIC_VECTOR(7 downto 0));
    END COMPONENT;
    COMPONENT Decodificador 
        Port ( bus_in : in STD_LOGIC_VECTOR(3 downto 0);
               bus_out: out STD_LOGIC_VECTOR(7 downto 0));
    END COMPONENT;
    COMPONENT Contador 
        Port ( CLK,CLR,LB,EB : in STD_LOGIC;
               QB : INOUT STD_LOGIC_VECTOR(3 DOWNTO 0));
    END COMPONENT;
    COMPONENT Arreglo 
        Port ( CLK,CLR,LA,EA : in STD_LOGIC;
               DA : IN STD_LOGIC_VECTOR(8 DOWNTO 0);
               QA : INOUT STD_LOGIC_VECTOR(8 DOWNTO 0));
    END COMPONENT;
    COMPONENT UC 
        Port ( CLK,CLR,INI,Z,A0 : in STD_LOGIC;
               LA,EA,EC,EB,LB : OUT STD_LOGIC);
    END COMPONENT;
        
    --SENALES USADAS
    
    SIGNAL SALIDA_AUX : STD_LOGIC_VECTOR (8 downto 0);
    SIGNAL Z_AUX :STD_LOGIC;
    
    --SENALES UC AUXILIARES
    SIGNAL LA_AUX : STD_LOGIC;
    SIGNAL LB_AUX : STD_LOGIC;
    SIGNAL EA_AUX : STD_LOGIC;
    SIGNAL EB_AUX : STD_LOGIC;
    SIGNAL EC_AUX : STD_LOGIC;
    
    --SENALES CONTADOR AUXILIARES
    SIGNAL QB_AUX : STD_LOGIC_VECTOR(3 DOWNTO 0);
    
    --SENALES DECODIFICADOR AUXILIARES
    SIGNAL bus_out_AUX : STD_LOGIC_VECTOR(7 DOWNTO 0);
    

begin

    UC_1:UC port map(
        CLK => CLK,
        CLR => CLR,
        INI => INI,
        Z => Z_AUX,
        A0 => SALIDA_AUX(0),
        LA => LA_AUX,
        EA => EA_AUX,
        EC => EC_AUX,
        EB => EB_AUX,
        LB => LB_AUX
    );
    Arreglo_1:Arreglo port map (
        CLK => CLK,
        CLR => CLR,
        LA => LA_AUX,
        EA => EA_AUX,
        DA => D,
        QA => SALIDA_AUX
    );
    Contador_1:Contador port map(
        CLK => CLK,
        CLR => CLR,
        EB => EB_AUX,
        LB => LB_AUX,
        QB => QB_AUX
    );
    Deco_1:Decodificador port map(
        bus_in => QB_AUX,
        bus_out => bus_out_AUX
    );
    Mux_1:Mux port map (
        bus_in => bus_out_AUX,
        sel => EC_AUX,
        bus_out => SEG
    );
    process (SALIDA_AUX)
        begin
            salida <= SALIDA_AUX;
            Z_AUX <= not(SALIDA_AUX(8) or SALIDA_AUX(7) or SALIDA_AUX(6) or SALIDA_AUX(5) or SALIDA_AUX(4) or SALIDA_AUX(3) or SALIDA_AUX(2) or SALIDA_AUX(1) or SALIDA_AUX(0) );
    end process;

end Behavioral;
