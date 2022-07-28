----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 18.02.2022 11:05:15
-- Design Name: 
-- Module Name: ALU - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_arith.ALL;
use IEEE.std_logic_unsigned.ALL;


entity ALU is
    Port ( inA : in STD_LOGIC_VECTOR (3 downto 0);
           inB : in STD_LOGIC_VECTOR (3 downto 0);
           Sel_Alu : in STD_LOGIC_VECTOR (2 downto 0);
           Cout : out STD_LOGIC;
           outAlu : out STD_LOGIC_VECTOR (3 downto 0));
end ALU;

architecture Behavioral of ALU is

component OpProducto is
    generic ( N: INTEGER := 4 ); 
    Port ( In1 : in STD_LOGIC_VECTOR (N-1 downto 0);
           In2: in STD_LOGIC_VECTOR(N-1 downto 0);
           Salida : out STD_LOGIC_VECTOR (2*N-1 downto 0));
           
           
end component OpProducto;

signal resulSuma: STD_LOGIC_VECTOR ( 4 downto 0) := "00000" ;
signal sigProduct: STD_LOGIC_VECTOR ( 7 downto 0) := "00000000" ;
signal cA,cB : STD_LOGIC_VECTOR ( 4 downto 0);
signal x : STD_LOGIC_VECTOR(3 downto 0) := "0010"; 


begin


I0_OpProducto:OpProducto port map (In1 => inB, In2=> x ,Salida => sigProduct);


cA <= '0' & inA;
cB <= '0' & inB;


    process(inA, inB,cB, cA, Sel_Alu, sigProduct) is 
    begin
    
        Case Sel_Alu is 
            when "000" => 
                outAlu <= sigProduct( 3 downto 0); -- inB * 2 (implementar multiplicacion) 
                Cout <= sigProduct(4);
            when "001" => 
                outAlu <= inA or inB ;
                
            when "010" => 
                resulSuma <= cB + 1;
                outAlu <= resulSuma( 3 downto 0);
                Cout <= resulSuma(4);
                
            when "011" => 
                resulSuma <= cA + cB;
                outAlu <= resulSuma( 3 downto 0); -- A + B;
                Cout <= resulSuma(4);
                
            when "100" => 
                outAlu <= inA nor inB;
                
            when "101" => 
                outAlu <= inA xnor inB;
                
            when "110" => 
                if (inB < 2 ) then 
                    resulSuma <= "00000";
                    outAlu <= resulSuma( 3 downto 0);
                    Cout <= resulSuma(4);
                else 
                    resulSuma <= cB - 2;
                    outAlu <= resulSuma(3 downto 0);
                     Cout <= resulSuma(4); 
                end if;
                
            when others =>  
                resulSuma <= cB + 1;
                outAlu <= resulSuma( 3 downto 0);
                Cout <= resulSuma(4);
                
        end case;
    end process;


end Behavioral;
