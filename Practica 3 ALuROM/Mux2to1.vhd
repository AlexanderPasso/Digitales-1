----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 18.02.2022 13:00:47
-- Design Name: 
-- Module Name: Mux2to1 - Behavioral
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



entity Mux2to1 is
    Port ( I0 : in STD_LOGIC_VECTOR (3 downto 0);
           I1 : in STD_LOGIC_VECTOR (3 downto 0);
           Sel : in STD_LOGIC;
           outMux : out STD_LOGIC_VECTOR (3 downto 0));
end Mux2to1;

architecture Behavioral of Mux2to1 is

begin

    process(I0,I1,Sel) is
    begin
    
        if ( Sel = '0') then
            outMux <= I0;
        else 
            outMux <= I1;
        end if;
        
    end process;

end Behavioral;
