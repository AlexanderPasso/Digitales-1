----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 18.02.2022 11:05:15
-- Design Name: 
-- Module Name: Clock_D - Behavioral
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

entity Clock_D is
    Port ( D : in STD_LOGIC_VECTOR (3 downto 0);
           Q : out STD_LOGIC_VECTOR (3 downto 0);
           Enable : in STD_LOGIC;
           Clk : in STD_LOGIC);
end Clock_D;

architecture Behavioral of Clock_D is

begin

    process(Clk) is
    begin
    
        if( Clk 'event and Clk = '1' ) then
            if(Enable = '1' ) then
                Q <= D;
            end if;
        end if;
    
    end process;

end Behavioral;
