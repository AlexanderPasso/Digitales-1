----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 18.02.2022 15:51:57
-- Design Name: 
-- Module Name: SistemaCompleto - Behavioral
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


-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity SistemaCompleto is
    Port ( Add_A : in STD_LOGIC_VECTOR (2 downto 0);
           Add_B : in STD_LOGIC_VECTOR (2 downto 0);
           FA : in STD_LOGIC;
           FB : in STD_LOGIC;
           Sel_Alu : in STD_LOGIC_VECTOR (2 downto 0);
           Clk : in STD_LOGIC;
           Enable01 : in STD_LOGIC;
           Enable2 : in STD_LOGIC;
           Display : out STD_LOGIC_VECTOR (6 downto 0);
           DataA : in STD_LOGIC_VECTOR (3 downto 0);
           DataB : in STD_LOGIC_VECTOR (3 downto 0);
           Cout : out STD_LOGIC;
           outLed : out STD_LOGIC;
           An : out STD_LOGIC_VECTOR (3 downto 0));
end SistemaCompleto;

architecture Behavioral of SistemaCompleto is

component RomA8x4 is
    Port ( inRom : in STD_LOGIC_VECTOR (2 downto 0);
           outRom : out STD_LOGIC_VECTOR (3 downto 0));
end component  RomA8x4;

component RomB8x4 is
    Port ( inRom : in STD_LOGIC_VECTOR (2 downto 0);
           outRom : out STD_LOGIC_VECTOR (3 downto 0));
end component RomB8x4;

component Mux2to1 is
    Port ( I0 : in STD_LOGIC_VECTOR (3 downto 0);
           I1 : in STD_LOGIC_VECTOR (3 downto 0);
           Sel : in STD_LOGIC;
           outMux : out STD_LOGIC_VECTOR (3 downto 0));
end component Mux2to1;


component DriverTriestados is
    Port ( DataB: in STD_LOGIC_VECTOR ( 3 downto 0);
           RomB : in STD_LOGIC_VECTOR ( 3 downto 0);
           Output : out STD_LOGIC_VECTOR (3 downto 0);
           Sel : in STD_LOGIC);
end component DriverTriestados;

component Clock_D is
    Port ( D : in STD_LOGIC_VECTOR (3 downto 0);
           Q : out STD_LOGIC_VECTOR (3 downto 0);
           Enable : in STD_LOGIC;
           Clk : in STD_LOGIC);
end component Clock_D;

component ALU is
    Port ( inA : in STD_LOGIC_VECTOR (3 downto 0);
           inB : in STD_LOGIC_VECTOR (3 downto 0);
           Sel_Alu : in STD_LOGIC_VECTOR (2 downto 0);
           Cout : out STD_LOGIC;
           outAlu : out STD_LOGIC_VECTOR (3 downto 0));
end component ALU;

component ModuloDEC is
    Port ( S : in STD_LOGIC_VECTOR (3 downto 0);
           O : out STD_LOGIC_VECTOR (6 downto 0));
end component ModuloDEC;

component Clock_Div is
    Port ( Clk100MHz : in STD_LOGIC;
           Clk_1Hz : out STD_LOGIC);
end component;

---signal

signal inMux , BA , BB, inTraestado , inAlu1 , inAlu2, SalAlu, Resultado: STD_LOGIC_VECTOR ( 3 downto 0);
signal enab , outClk_1Hz , salOut: STD_LOGIC ; 


begin
enab <= Enable01;
Cout <= salOut;
outLed <= outClk_1Hz;
An <= "1110";

I0_RomA:RomA8x4 port map (inRom => Add_A , outRom => inMux );
I0_Mux:Mux2to1 port map (I0 => inMux , I1 => DataA , Sel => FA , outMux => BA );
I0_RomB:RomB8x4 port map (inRom => Add_B , outRom => inTraestado );
I0_Triestados:DriverTriestados port map (DataB => DataB , RomB => inTraestado, Output => BB , Sel => FB );
I0Clock_Div:Clock_Div port map (Clk100MHz => Clk , Clk_1Hz => outClk_1Hz );
I0_Clk:Clock_D port map (D => BA, Clk =>outClk_1Hz   , Enable => enab , Q => inAlu1 );
I1_Clk:Clock_D port map (D => BB, Clk =>outClk_1Hz , Enable => enab , Q => inAlu2 );
I0ALU:ALU port map (inA =>inAlu1  , inB =>inAlu2  , Sel_Alu =>Sel_Alu, Cout => salOut , outAlu => SalAlu );
I2_Clk:Clock_D port map (D => SalAlu, Clk =>outClk_1Hz , Enable => Enable2 , Q => Resultado );
I0ModuloDEC:ModuloDEC port map (S => Resultado , O => Display );

end Behavioral;
