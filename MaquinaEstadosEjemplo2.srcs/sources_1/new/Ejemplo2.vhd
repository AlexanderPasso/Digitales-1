----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02.04.2022 11:16:09
-- Design Name: 
-- Module Name: Ejemplo2 - Behavioral
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
use IEEE.NUMERIC_STD.ALL; 
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Ejemplo2 is
    Port ( Xin : in STD_LOGIC;
           Reset : in STD_LOGIC;
           Clk : in STD_LOGIC;
           --enable: in STD_LOGIC := '0';
           Zout : out STD_LOGIC);
end Ejemplo2;

architecture Behavioral of Ejemplo2 is

--Definicion de los estados tipo moore. 
type Estados is (S0,S1,S2,S3,S4);
signal estado, sig_estado : Estados;


begin


    --Proceso que registra los estados actuales y estados siguientes
    Registro_Estados : process (Reset, Clk)
    begin
        if(Reset = '1' ) then
            estado <= S0;                                       
        elsif(Clk'event and Clk ='1') then
            estado <= sig_estado;
        else
            estado <= estado;
        end if;
    end process;
    

    --Proceso que controla la salida de cada estado
    Salida_Estado: process ( estado)
    begin
        case(estado) is
            when S0 =>
                Zout <= '0';
            when S1 => 
                Zout <= '0';
            when S2 =>
                Zout <= '0';
            when S3 => 
                Zout <= '0';
            when S4 =>
                Zout <= '1';
            when others => 
                Zout <= '0';
        end case;
    end process;


    Salida_Sig_Estado : process(estado, Xin)
    begin
        Sig_Estado <= S0;
        
        case(estado) is
            when S0 =>
                if(Xin = '1') then
                    Sig_Estado <= S1;
                end if;
            When S1 =>
                if(Xin = '1') then
                    Sig_Estado <= S1;
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
                    Sig_Estado <= S1;
                else
                    Sig_Estado <= S4;
                end if;
            when S4 =>
                if(Xin = '1' ) then
                    Sig_Estado <= S3;
                else
                    Sig_Estado <= S0;
                end if;
        end case;
    end process;
    
end Behavioral;
