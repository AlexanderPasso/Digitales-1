----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03.02.2022 15:39:22
-- Design Name: 
-- Module Name: Division - Behavioral
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

entity Division is
    Port ( Input : in STD_LOGIC_VECTOR (3 downto 0);
           Output : out STD_LOGIC_VECTOR (3 downto 0));
end Division;

architecture Behavioral of Division is

begin

process(Input)
begin

    Case Input is
        
        when "0000" =>
            Output <= "0000";    
        when "0001"|"0010" =>
            Output <= "0001";
        when "0011"|"0100" => 
            Output <= "0010";
        when "0101"|"0110" => 
            Output <= "0011";
        when "0111"|"1000" => 
            Output <= "0100";
        when "1001"|"1010" => 
            Output <= "0101";
        when "1011"|"1100" => 
            Output <= "0110"; 
        when "1101"|"1110" => 
            Output <= "0111";
        when others => 
            Output <= "1000";    
    end Case;
        
end process;

end Behavioral;
