----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03.02.2022 17:51:12
-- Design Name: 
-- Module Name: ModuloDEC - Behavioral
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

entity ModuloDEC is
    Port ( S : in STD_LOGIC_VECTOR (3 downto 0);
           O : out STD_LOGIC_VECTOR (6 downto 0));
end ModuloDEC;

architecture Behavioral of ModuloDEC is

begin

with S select 
    O <= "0000001" when "0000",
         "1001111" when "0001",
         "0010010" when "0010",
         "0000110" when "0011",
         "1001100" when "0100",
         "0100100" when "0101",
         "1100000" when "0110",
         "0001110" when "0111",
         "0000000" when "1000",
         "0000100" when "1001",
         "0001000" when "1010", --A
         "1110000" when "1011", -- b
         "0110001" when "1100", -- C
         "1000010" when "1101", --d
         "0110000" when "1110", --E
         "0111000" when others; -- F

end Behavioral;
