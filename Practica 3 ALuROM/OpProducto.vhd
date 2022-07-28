----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 18.02.2022 16:10:23
-- Design Name: 
-- Module Name: OpProducto - Behavioral
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

entity OpProducto is
    generic ( N: INTEGER := 4 ); 
    Port ( In1 : in STD_LOGIC_VECTOR (N-1 downto 0);
           In2: in STD_LOGIC_VECTOR(N-1 downto 0); 
           Salida : out STD_LOGIC_VECTOR (2*N-1 downto 0));
end OpProducto;

architecture Behavioral of OpProducto is

begin

Salida <= (In1) * (In2) ;

end Behavioral;
