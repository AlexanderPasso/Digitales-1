----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02.04.2022 16:16:12
-- Design Name: 
-- Module Name: TeshEjemplo2 - Behavioral
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

entity TeshEjemplo2 is
--  Port ( );
end TeshEjemplo2;

architecture Behavioral of TeshEjemplo2 is

component Ejemplo2 is
    Port ( Xin : in STD_LOGIC;
           Reset : in STD_LOGIC;
           Clk : in STD_LOGIC;
           --enable: in STD_LOGIC;
           Zout : out STD_LOGIC);
end component Ejemplo2;

--Señales

signal Clk_in, Reset_in, X_int, Z_out: STD_LOGIC;


begin

UUT:Ejemplo2 port map (Xin => X_int , Reset =>Reset_in,Clk=>Clk_in,Zout =>Z_out);

--Generar Reloj 
    gen_Clk: process
    begin
        Clk_in <= '0';
        wait for 5 ns;
        Clk_in <= '1';
        wait for 5 ns;
    end process;
    
 -- Señal de Reset
    gen_reset:process
    begin 
        Reset_in <= '0';
        wait for 8ns;
        Reset_in <= '1';
        wait for 12 ns;
        Reset_in <= '0';
        wait for 200 ns;
    end process;
    
-- Generacion de los datos
    gen_dates:process
    begin
        X_int <= '0'; 
        wait for 30 ns;    -- 30 ns
        X_int <= '1';
        wait for 10 ns;    -- 40 ns
        X_int <= '0';
        wait for 10 ns;    -- 50 ns
        X_int <= '1';
        wait for 20 ns;    -- 70 ns
        X_int <= '0';
        wait for 10 ns;    -- 80 ns
        X_int <= '1';
        wait for 20 ns;    -- 100 ns
        X_int <= '0';
        wait for 10 ns;    -- 110 ns
        X_int <= '1';
        wait for 7 ns;     -- 117 ns
        X_int <= '0';
        wait for 13 ns;    -- 130 ns
        X_int <= '1';
        wait for 10 ns;    -- 140 ns
        X_int <= '0';
        wait for 20 ns;    -- 160 ns
        X_int <= '1';
        wait for 30 ns;    -- 190 ns
        X_int <= '0';
        wait for 10 ns;    -- 200 ns
        X_int <= '1';
        wait for 20 ns;    -- 220 ns
        X_int <= '0';
        wait for 10 ns;    -- 230 ns  
    end process; 
   

end Behavioral;
