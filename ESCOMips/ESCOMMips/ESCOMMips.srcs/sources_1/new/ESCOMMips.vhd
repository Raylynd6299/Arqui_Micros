library IEEE;
library WORK;
use IEEE.STD_LOGIC_1164.ALL;
use WORK.paquete.ALL;

entity ESCOMMips is
    Port ( Instruccion_out : out STD_LOGIC_VECTOR (24 downto 0);
           MICROinstruccion_out : out STD_LOGIC_VECTOR(19 downto 0);
           Flags_out : out STD_LOGIC_VECTOR(3 downto 0);
           PC,RD1,RD2,ResALU,BUS_SR : out STD_LOGIC_VECTOR (15 downto 0);
           CLK,CLR : in STD_LOGIC);
end ESCOMMips;

architecture Behavioral of ESCOMMips is

    signal Instruccion : STD_LOGIC_VECTOR(24 downto 0); -- MEMPROG => Un chingo
    signal MICROinstruccion : STD_LOGIC_VECTOR(19 downto 0); --UC -> Un chingo
    signal Flags : STD_LOGIC_VECTOR(3 downto 0); --UC -> ALU
    signal RD2_mux : STD_LOGIC_VECTOR(3 downto 0);
    signal SDMP_aux,SDMD_aux,SR_aux,SWD_aux,SEXT_aux,SOP1_aux,SOP2_aux : STD_LOGIC_VECTOR(15 downto 0);
    signal PCout_aux,extDIR_aux,extSIG_aux : STD_LOGIC_VECTOR (15 downto 0);
    signal RD1_aux,RD2_aux,ALU_aux,Mem_Dat_aux : STD_LOGIC_VECTOR (15 downto 0);
begin
    --port maps
    
    --Unidad de Control
    UC_F_escom:UC_F port map(
        funCode => Instruccion( 3 downto 0 ),
        Flags => Flags,
        opCode => Instruccion ( 24 downto 20),
        CLK => CLK,
        CLR => CLR,
        Microinst => MICROinstruccion
    );
    
    --SDMP MUX
    SDMP_escom:SDMP port map(
        Dato0 => Instruccion (15 downto 0),
        Dato1 => SR_aux,
        DATOout => SDMP_aux,
        sel => MICROinstruccion(19)
    );
    
    --Pila 
    pila_escom:pila port map(
        PCin => SDMP_aux,
        UP => MICROinstruccion(18),
        DW => MICROinstruccion(17),
        WPC => MICROinstruccion(16),
        CLK => CLK,
        CLR => CLR,
        PCout => PCout_aux
    );
    
    --Memoria de Programa
    mem_program_escom:mem_program port map(
        Bus_direc => PCout_aux(9 DOWNTO 0),
        Bus_sig_instru => Instruccion
    );
    
    --SR2 MUX
    SR2_escom:SR2 port map(
        Dato0 => Instruccion(11 downto 8),
        Dato1 => Instruccion(19 downto 16),
        sel => MICROinstruccion(15),
        DATOout => RD2_mux
    );
    
    --SWD MUX
    SWD_escom:SWD port map(
        Dato0 => Instruccion (15 downto 0),
        Dato1 => SR_aux,
        DATOout => SWD_aux,
        sel => MICROinstruccion(14)
    );
    
    --extDIr
    extDIR_escom:extDIR port map(
        entrada => Instruccion(11 downto 0),
        salida => extDIR_aux
    );
    
    --extSIG
    extSIG_escom:extSIG port map(
        entrada => Instruccion(11 downto 0),
        salida => extSIG_aux
    );
    
    --SEXT MUX
    SEXT_escom:SEXT port map(
        Dato0 => extSIG_aux,
        Dato1 => extDIR_aux,
        DATOout => SEXT_aux,
        sel => MICROinstruccion(13)
    );
    
    --Archivo de Registros
    Arc_Reg_escom:Arc_Reg port map(
        writeData => SWD_aux,
        writeReg => Instruccion(19 downto 16),
        readReg1 => Instruccion(15 downto 12),
        readReg2 => RD2_mux,
        shamt => Instruccion(7 downto 4),
        SHE => MICROinstruccion(12),
        DIR => MICROinstruccion(11),
        WR => MICROinstruccion(10),
        CLK => CLK,
        CLR => CLR,
        readData1 => RD1_aux,
        readData2 => RD2_aux
    );
    
    --SOP1
    SOP1_escom:SEXT port map(
        Dato0 => RD1_aux,
        Dato1 => PCout_aux,
        DATOout => SOP1_aux,
        sel => MICROinstruccion(9)
    );
    
    --SOP2
    SOP2_escom:SEXT port map(
        Dato0 => RD2_aux,
        Dato1 => SEXT_aux,
        DATOout => SOP2_aux,
        sel => MICROinstruccion(8)
    );
    
    --ALU
    ALU_escom:aluN port map(
        a => SOP1_aux,
        b => SOP2_aux,
        aluop => MICROinstruccion(7 downto 4),
        res => ALU_aux,
        ov => Flags(3),
        z => Flags(2),
        n => Flags(0),
        co => Flags(1)
    );
    
    --SDMD
    SDMD_escom:SEXT port map(
        Dato0 => ALU_aux,
        Dato1 => Instruccion(15 downto 0),
        DATOout => SDMD_aux,
        sel => MICROinstruccion(3)
    );
    
    --Memoria de Datos
    memo_dato_Escom:memo_dato port map(
        Bus_dir => SDMD_aux(9 DOWNTO 0),
        Bus_dat_in => RD2_aux,
        CLK => CLK,
        WD => MICROinstruccion(2),
        Bus_data_out => Mem_Dat_aux
    );
    
    --SR
    SR_escom:SEXT port map(
        Dato0 => Mem_Dat_aux,
        Dato1 => ALU_aux,
        DATOout => SR_aux,
        sel => MICROinstruccion(1)
    );
    
    process(Instruccion,PCout_aux,RD1_aux,RD2_aux,ALU_aux,SR_aux,MICROinstruccion,Flags)
        begin
            Flags_out <= Flags;
            MICROinstruccion_out <= MICROinstruccion;
            Instruccion_out <= Instruccion;
            PC <= PCout_aux;
            RD1 <= RD1_aux;
            RD2 <= RD2_aux;
            ResALU <= ALU_aux;
            BUS_SR <= SR_aux;
    end process;
    
end Behavioral;
