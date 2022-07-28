----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 18.02.2022 16:53:39
-- Design Name: 
-- Module Name: Clock_Div - Behavioral
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
use IEEE.numeric_std.all;
use IEEE.std_logic_arith.ALL;
use IEEE.std_logic_unsigned.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

--entity Clock_Div is
--    Port ( Clk100MHz : in STD_LOGIC;
--           Clk_1Hz : inout STD_LOGIC);
--end Clock_Div;

--architecture Behavioral of Clock_Div is

--signal  Count_clk : STD_LOGIC_VECTOR ( 22 downto 0);

--begin

--process(Clk100MHz) is 
--begin
--    if (Clk100MHz'event and Clk100MHz='1') then 
--        if(Count_clk = 50000000) then
--            Count_clk <= "00000000000000000000000";
--            Clk_1Hz <= not Clk_1Hz;
--        else
--            Count_clk <= Count_clk + 1;
--        end if;
--    end if;
--end process;



--end Behavioral;

--library IEEE;
--use IEEE.STD_LOGIC_1164.ALL;
--use IEEE.STD_LOGIC_ARITH.ALL;

--entity Clock_Div is
--port (
--	Clk100MHz: 	in STD_LOGIC;
--	Clk_1Hz:		out STD_LOGIC
--);
--end Clock_Div;

--architecture rtl of Clock_Div is
--	constant max_count: INTEGER := 50000000;
--	signal count: INTEGER range 0 to max_count;
--	signal clk_state: STD_LOGIC := '0';
	
--begin
--	gen_clock: process(Clk100MHz, clk_state, count)
--	begin
--		if Clk100MHz'event and Clk100MHz='1' then
--			if count < max_count then 
--				count <= count+1;
--			else
--				clk_state <= not clk_state;
--				count <= 0;
--			end if;
--		end if;
--	end process;
	
--	persecond: process (clk_state)
--	begin
--		Clk_1Hz <= clk_state;
--	end process;
	
--end rtl;

entity Clock_Div is
    Port ( Clk100MHz: in STD_LOGIC;
           Clk_1Hz : out STD_LOGIC);
end Clock_Div;

architecture Behavioral of Clock_Div is

signal temporal: STD_LOGIC;
signal contador : integer range 0 to 26999999 := 0;

begin

divisor_frecuencia : process(Clk100MHz)
    begin
        if rising_edge(Clk100MHz) then
                if (contador = 6000023) then
                    temporal <= NOT(temporal);
                    contador <= 0;
                else
                    contador <= contador+1;
                end if;
        end if;
    end process;
    Clk_1Hz <= temporal;

end Behavioral;

