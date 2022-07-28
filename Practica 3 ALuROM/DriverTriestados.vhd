----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 18.02.2022 15:38:33
-- Design Name: 
-- Module Name: DriverTriestados - Behavioral
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

entity DriverTriestados is
    Port ( DataB: in STD_LOGIC_VECTOR ( 3 downto 0);
           RomB : in STD_LOGIC_VECTOR ( 3 downto 0);
           Output : out STD_LOGIC_VECTOR (3 downto 0);
           Sel : in STD_LOGIC);
end DriverTriestados;

architecture Behavioral of DriverTriestados is

begin

    process(Sel, RomB , DataB) is 
    begin
        If (Sel = '1') then 
            Output <= RomB;
        else 
            Output <= DataB;
        end if;    
    end process; 

end Behavioral;
