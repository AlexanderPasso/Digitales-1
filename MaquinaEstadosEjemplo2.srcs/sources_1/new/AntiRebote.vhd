----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08.04.2022 16:11:48
-- Design Name: 
-- Module Name: AntiRebote - Behavioral
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

entity AntiRebote is
    Port ( Clk100MHz : in STD_LOGIC;
           Btn : in STD_LOGIC;
           fsm_clk : out STD_LOGIC);
end AntiRebote;

architecture Behavioral of AntiRebote is

signal btn_prev: STD_LOGIC := '0';
constant MAX_COUNT : integer := 1000000;
signal counter : integer range 0 to 2000000 := 0;


begin

    process(Clk100MHz)
    begin
        if(Clk100MHz'event and Clk100MHz = '1') then
            if(btn_prev /= Btn) then
                counter <= 0;
                btn_prev <= Btn;
            elsif( counter >= MAX_COUNT) then
                fsm_clk <= btn_prev;
            else
                counter <= counter + 1;
            end if;
        end if;
    end process;

end Behavioral;
