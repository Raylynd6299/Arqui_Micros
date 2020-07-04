library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity UC_F is
    Port ( funCode,Flags : in STD_LOGIC_VECTOR (3 downto 0);
           opCode : in STD_LOGIC_VECTOR (4 downto 0);
           CLK,CLR : in STD_LOGIC;
           Microinst : inout STD_LOGIC_VECTOR (19 downto 0));
end UC_F;

architecture Behavioral of UC_F is

    --Componentes
    component MfunCode 
        Port ( funCode : in STD_LOGIC_VECTOR (3 downto 0);
               Micro : out STD_LOGIC_VECTOR (19 downto 0));
    end component;
    
    component MopCode 
        Port ( opCode : in STD_LOGIC_VECTOR (4 downto 0);
               Micro : out STD_LOGIC_VECTOR (19 downto 0));
    end component;
    
    component Mux5 
        Port ( sel : in STD_LOGIC;
               opcd : in STD_LOGIC_VECTOR (4 downto 0);
               salida : out STD_LOGIC_VECTOR (4 downto 0));
    end component;
    
    component Mux20 
        Port ( Mfun,Mopcode : in STD_LOGIC_VECTOR (19 downto 0);
                sel : in STD_LOGIC;
               Microis : out STD_LOGIC_VECTOR (19 downto 0));
    end component;
    
    component Deco_Instru 
        Port ( opCode : in STD_LOGIC_VECTOR (4 downto 0);
               TIPOR,BEQI,BNEQI,BLTI,BLETI,BGTI,BGETI : out STD_LOGIC);
    end component;
    
    component Bloq_Nivel 
        Port ( CLR,CLK : in STD_LOGIC;
               NA : out STD_LOGIC);
    end component;
    
    component Registro 
        Port ( D : in STD_LOGIC_VECTOR (3 downto 0);
               Q : out STD_LOGIC_VECTOR (3 downto 0);
               CLR,CLK,L : in STD_LOGIC);
    end component;
    
    component Bloq_Cond 
        Port ( Q : in STD_LOGIC_VECTOR (3 downto 0);
               EQ,NE,LT,LE,GT,GE : out STD_LOGIC);
    end component;
    
    component Uni_Con 
        Port ( TIPOR,BEQI,BNEQI,BLTI,BLETI,BGTI,BGETI : in STD_LOGIC;
               NA : in STD_LOGIC;
               EQ,NE,LT,LE,GT,GE : in STD_LOGIC;
               SM,SDOPC : out STD_LOGIC);
    end component;
    
    --senales
    signal MfunCode_out,MopCode_out : STD_LOGIC_VECTOR (19 downto 0);
    signal salMux5 : STD_LOGIC_VECTOR (4 downto 0);
    signal SDOPC_AUX,SM_AUX :STD_LOGIC;
    signal TIPOR,BEQI,BNEQI,BLTI,BLETI,BGTI,BGETI : STD_LOGIC;
    signal NA_aux : STD_LOGIC;
    signal Q_aux :STD_LOGIC_VECTOR(3 downto 0);
    signal EQ,NE,LT,LE,GT,GE : STD_LOGIC;
    
begin
    MfunCode_tb:MfunCode port map(
        funCode => funCode,
        Micro => MfunCode_out
    );
    Mux5_tb:Mux5 port map(
        opcd => opCode,
        sel => SDOPC_AUX,
        salida => salMux5
    );
    MopCode_tb:MopCode port map(
        opCode => salMux5,
        Micro => MopCode_out
    );
    Mux20_tb:Mux20 port map(
        sel => SM_AUX,
        Mfun => MfunCode_out,
        Mopcode => MopCode_out,
        Microis => Microinst
    );
    Deco_Instru_tb:Deco_Instru port map(
        opCode => opCode,
        TIPOR => TIPOR,
        BEQI => BEQI,
        BNEQI => BNEQI,
        BLTI => BLTI,
        BLETI => BLETI,
        BGTI => BGTI,
        BGETI => BGETI
    );
    Bloq_Nivel_tb:Bloq_Nivel port map(
        CLR => CLR,
        CLK => CLK,
        NA => NA_aux
    );
    Registro_tb:Registro port map(
        CLR => CLR,
        CLK => CLK,
        L => Microinst(0),
        Q => Q_aux,
        D => Flags
    );    
    Bloq_Cond_tb:Bloq_Cond port map(
        Q => Q_aux,
        EQ => EQ,
        NE => NE,
        LT => LT,
        LE => LE,
        GT => GT,
        GE => GE
    );
    Uni_Con_tb:Uni_Con port map(
        TIPOR => TIPOR,
        BEQI => BEQI,
        BNEQI => BNEQI,
        BLTI => BLTI,
        BLETI => BLETI,
        BGTI => BGTI,
        BGETI => BGETI,
        EQ => EQ,
        NE => NE,
        LT => LT,
        LE => LE,
        GT => GT,
        GE => GE,
        NA => NA_aux,
        SM => SM_AUX,
        SDOPC => SDOPC_AUX
    );
    
    
end Behavioral;
