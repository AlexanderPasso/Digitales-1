----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 18.02.2022 11:05:15
-- Design Name: 
-- Module Name: RomA8x4 - Behavioral
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

entity RomA8x4 is
    Port ( inRom : in STD_LOGIC_VECTOR (2 downto 0);
           outRom : out STD_LOGIC_VECTOR (3 downto 0));
end RomA8x4;

architecture Behavioral of RomA8x4 is

begin

--Memoria ROM A  
with inRom select
    outRom <= X"6" when "000",
              X"4" when "001",
              X"7" when "010",
              X"5" when "011",
              X"9" when "100",
              X"C" when "101",
              X"D" when "110",
              X"B" when others;
              
end Behavioral;
