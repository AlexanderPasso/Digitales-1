----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04.04.2022 12:14:59
-- Design Name: 
-- Module Name: Ejemplo2Mealy - Behavioral
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

entity Ejemplo2Mealy is ---Diseño con dos bloques 
     Port ( Xin : in STD_LOGIC;
           Reset : in STD_LOGIC;
           Clk : in STD_LOGIC;
           --enable: in STD_LOGIC := '0';
           Zout : out STD_LOGIC);
end Ejemplo2Mealy;

architecture Behavioral of Ejemplo2Mealy is

--Definicion de los estados tipo moore. 
type Estados is (S0,S1,S2,S3,S4);
signal estado, sig_estado : Estados;

component AntiRebote is
    Port ( Clk100MHz : in STD_LOGIC;
           Btn : in STD_LOGIC;
           fsm_clk : out STD_LOGIC);
end component AntiRebote;

signal Pulso, ClkOut , En1: STD_LOGIC;

begin


 --Proceso que registra los estados actuales y estados siguientes
    Registro_Estados : process (Clk,Reset)
    begin
        if(Reset = '1' ) then
            estado <= S0;
        elsif( Clk'event and Clk='1') then
            estado <= sig_estado;
        end if;
    end process;
    
    Salida_Sig_Estado : process(estado, Xin)
    begin
        Zout <= '0';
        case(estado) is
            when S0 =>
                if(Xin = '1') then
                    Sig_Estado <= S1;
                end if;
            When S1 =>
                if(Xin = '1') then
                    Sig_Estado <= S0;
                else
                    Sig_Estado <= S2;
                end if;
            When S2 => 
                if(Xin = '1') then
                    Sig_Estado <= S3;
                else
                    Sig_Estado <= S0;
                end if;
            when S3 => 
                if(Xin = '1') then              
                    Sig_Estado <= S0;
                else
                    Zout <= '1';
                    Sig_Estado <= S2;
                end if;
            when others =>
                Sig_Estado <= S0;
        end case;
    end process;

end Behavioral;
