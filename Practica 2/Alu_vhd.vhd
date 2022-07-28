----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 28.01.2022 16:52:34
-- Design Name: 
-- Module Name: Alu_vhd - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Alu_vhd is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           Sel : in STD_LOGIC_VECTOR (1 downto 0);
           Anodos : out STD_LOGIC_VECTOR (3 downto 0);
           outCarry: out STD_LOGIC ;
           Display: out STD_LOGIC_VECTOR(6 downto 0));
end Alu_vhd;

architecture Behavioral of Alu_vhd is

component Division is
    Port ( Input : in STD_LOGIC_VECTOR (3 downto 0);
           Output : out STD_LOGIC_VECTOR (3 downto 0));
end component Division;

component ModuloDEC is
    Port ( S : in STD_LOGIC_VECTOR (3 downto 0);
           O : out STD_LOGIC_VECTOR (6 downto 0));
end component ModuloDEC;


signal outA, outSalida, An : STD_LOGIC_VECTOR(3 downto 0);
signal Carry : STD_LOGIC;
signal outDisplay: STD_LOGIC_VECTOR (6 downto 0);
signal resulSuma : STD_LOGIC_VECTOR ( 4 downto 0):= "00000";
signal cA, cB : STD_LOGIC_VECTOR (4 downto 0);

begin

Anodos <= "1110";
I0_Division:Division port map (Input => A , Output => outA );
I1_Modulo:ModuloDEC port map (S => outSalida , O => outDisplay );

cA <= '0' & A;
cB <= '0' & B;
resulSuma <= cA + cB;

process(A,B,Sel,resulSuma)

begin
    
    Case Sel is
        when "11" =>
            outSalida <= outA;
            Carry <= resulSuma(4);
        when "10" => 
            if(A<2) then
                outSalida <= "0000";
                Carry <= resulSuma(4);
            else
                outSalida <= A-2;
                Carry <= resulSuma(4);
            end if;
        when "01" => 
            outSalida <= not A;
            Carry <= resulSuma(4);
        when others => 
            outSalida <= resulSuma(3 downto 0);
            Carry <= resulSuma(4);
    end Case;
end process;

Display <= outDisplay;
outCarry <= Carry;
end Behavioral;
