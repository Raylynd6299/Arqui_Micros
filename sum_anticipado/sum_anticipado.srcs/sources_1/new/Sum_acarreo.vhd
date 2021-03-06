library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Sum_acarreo is
    Port ( a,b : in STD_LOGIC_VECTOR (7 downto 0);
           s : out STD_LOGIC_VECTOR (7 downto 0);
           cin : in STD_LOGIC;
           cout : out STD_LOGIC);
end Sum_acarreo;

architecture Behavioral of Sum_acarreo is

begin
    process(a,b,cin)
    variable p,g:std_logic_vector(7 downto 0);
    variable c:std_logic_vector(8 downto 0);
    variable auxa,auxb,auxc,auxd:std_logic;
    
    begin
    
        c(0):= cin;
        for i in 0 to 7 loop
            p(i) := a(i) xor b(i);
            g(i) := a(i) and b(i);
            s(i) <= p(i) xor c(i);
            
            auxc := '1';
            
            for j in 0 to i loop
                auxc := auxc and p(j);
            end loop;
            auxa :=auxc and c(0);
            
            auxd := '0';
            for k in 0 to i-1 loop
                auxb := '1';
                for m in k+1 to i loop
                    auxb := auxb and p(m);
                end loop;
                auxd := auxd or (auxb and g(k) );
            end loop;
            c(i+1) := g(i) or auxa or auxd;
        end loop;
        cout <= c(8);
    end process;
end Behavioral;
