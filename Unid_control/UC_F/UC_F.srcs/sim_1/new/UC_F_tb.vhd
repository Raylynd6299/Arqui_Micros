LIBRARY ieee;
LIBRARY STD;
USE STD.TEXTIO.ALL;
USE ieee.std_logic_TEXTIO.ALL;  --PERMITE USAR STD_LOGIC
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_UNSIGNED.ALL;
USE ieee.std_logic_ARITH.ALL;

entity UC_F_tb is
--  Port ( );
end UC_F_tb;

architecture Behavioral of UC_F_tb is
    component UC_F 
        Port ( funCode,Flags : in STD_LOGIC_VECTOR (3 downto 0);
               opCode : in STD_LOGIC_VECTOR (4 downto 0);
               CLK,CLR,LF : in STD_LOGIC;
               Microinst : inout STD_LOGIC_VECTOR (19 downto 0));
    end component;
    
    --signals
    signal funCode,Flags : STD_LOGIC_VECTOR (3 downto 0);
    signal opCode :  STD_LOGIC_VECTOR (4 downto 0);
    signal CLK,CLR,LF : STD_LOGIC;
    signal Microinst : STD_LOGIC_VECTOR (19 downto 0);
    
    constant CLK_period : time := 10 ns;
begin
    UC_F_tb:UC_F port map (
        funCode => funCode,
        Flags => Flags,
        opCode => opCode,
        CLK => CLK,
        CLR => CLR,
        LF => LF,
        Microinst => Microinst
    );
    CLK_process :process
        begin
            CLK <= '0';
        wait for CLK_period/2;
            CLK <= '1';
        wait for CLK_period/2;
    end process;

    simulacion:process 
            --salida
            file ARCH_SAL : TEXT;
            variable LINEA_SAL: line;
            variable VAR_Microins: STD_LOGIC_VECTOR(19 downto 0);
            
            --entrada
            file ARCH_ENT :TEXT;
            variable LINEA_ENT :line;    
            VARIABLE VAR_FunCode : STD_LOGIC_VECTOR (3 downto 0);
            VARIABLE VAR_opCode : STD_LOGIC_VECTOR (4 downto 0);
            VARIABLE VAR_CLK,VAR_CLR,VAR_LF : STD_LOGIC;
            VARIABLE VAR_Flags : STD_LOGIC_VECTOR (3 downto 0);
            
            VARIABLE CADENA : STRING(1 TO 9);
            VARIABLE NIVEL : STRING(1 TO 4);
            
        begin
            file_open(ARCH_ENT, "C:\Users\Ray\Desktop\Arquitectura\Unid_control\UC_F\Entrada.txt", READ_MODE);      
            file_open(ARCH_SAL, "C:\Users\Ray\Desktop\Arquitectura\Unid_control\UC_F\Salida.txt", WRITE_MODE);
           
            CADENA := "_OP_CODE_";
            write(LINEA_SAL, CADENA, right, CADENA'LENGTH+1);       
            CADENA := " FUN_CODE";
            write(LINEA_SAL, CADENA, right, CADENA'LENGTH+1);     
            CADENA := " BANDERAS";
            write(LINEA_SAL, CADENA, right, CADENA'LENGTH+1);
            CADENA := " __CLR___";
            write(LINEA_SAL, CADENA, right, CADENA'LENGTH+1);
            CADENA := " ___LF___";
            write(LINEA_SAL, CADENA, right, CADENA'LENGTH+1);
            CADENA := " MICRONST";
            write(LINEA_SAL, CADENA, right, CADENA'LENGTH+1);
            CADENA := " __NIVEL_";
            write(LINEA_SAL, CADENA, right, CADENA'LENGTH+1);
             
            writeline(ARCH_SAL,LINEA_SAL);
            
            wait for 100 ns;
            for I in 0 to 53 loop
              readline(ARCH_ENT,LINEA_ENT);
             
              read(LINEA_ENT,VAR_opCode);
              opCode <= VAR_opCode;
              
              read(LINEA_ENT,VAR_FunCode);
              FunCode <= VAR_FunCode;
              
              read(LINEA_ENT,VAR_Flags);
              Flags <= VAR_Flags;
              
              read(LINEA_ENT,VAR_CLR);
              CLR <= VAR_CLR; 
              
              read(LINEA_ENT,VAR_LF);
              LF <= VAR_LF;      
             
             --wait until rising_edge(CLK);
              wait for 5ns;
              VAR_Microins := Microinst;

              WRITE(LINEA_SAL,VAR_opCode, right, 5);
              WRITE(LINEA_SAL,VAR_FunCode, right, 5);
              WRITE(LINEA_SAL,VAR_Flags, right, 5);
              WRITE(LINEA_SAL,VAR_CLR, right, 5);
              WRITE(LINEA_SAL,VAR_LF, right, 5);
              WRITE(LINEA_SAL,VAR_Microins, right, 21);
              if CLK = '1' then
                    NIVEL :="ALTO";
                    write(LINEA_SAL, NIVEL, right, NIVEL'LENGTH+1);
              else
                    NIVEL :="BAJO";
                    write(LINEA_SAL, NIVEL, right, NIVEL'LENGTH+1);
              end if;
              writeline(ARCH_SAL,LINEA_SAL);
              
              wait for 5ns;
              VAR_Microins:=Microinst;

              WRITE(LINEA_SAL,VAR_opCode, right, 5);
              WRITE(LINEA_SAL,VAR_FunCode, right, 5);
              WRITE(LINEA_SAL,VAR_Flags, right, 5);
              WRITE(LINEA_SAL,VAR_CLR, right, 5);
              WRITE(LINEA_SAL,VAR_LF, right, 5);
              WRITE(LINEA_SAL,VAR_Microins, right, 21);
              if CLK = '1' then
                    NIVEL :="ALTO";
                    write(LINEA_SAL, NIVEL, right, NIVEL'LENGTH+1);
              else
                    NIVEL :="BAJO";
                    write(LINEA_SAL, NIVEL, right, NIVEL'LENGTH+1);
              end if;
              writeline(ARCH_SAL,LINEA_SAL);
              
            end loop;
            file_close(ARCH_ENT);
            file_close(ARCH_SAL);
           wait;               
    end process;
end Behavioral;


