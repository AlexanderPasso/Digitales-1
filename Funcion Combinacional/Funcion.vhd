----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 25.01.2022 08:08:09
-- Design Name: 
-- Module Name: Funcion - Behavioral
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

entity Funcion is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           Salida : out STD_LOGIC_VECTOR (2 downto 0));
end Funcion;

architecture Behavioral of Funcion is

--Componente AND 3 entradas
component and3 is
    Port ( I0 : in STD_LOGIC;
           I1 : in STD_LOGIC;
           I2 : in STD_LOGIC;
           Y : out STD_LOGIC);
end component and3;

component or4 is
    Port ( I0 : in STD_LOGIC;
           I1 : in STD_LOGIC;
           I2 : in STD_LOGIC;
           I3 : in STD_LOGIC;
           outOr : out STD_LOGIC);
end component or4;

Signal outAnd1, outAnd2, outAnd3, outAnd4 : STD_LOGIC; --Salida para cada And 
Signal invX, invY, invW, invZ : STD_LOGIC; --Señales para los inversores de cada señal de entrada
Signal sal_0, sal_1 ,sal_2 : STD_LOGIC;

begin
--Salida(2) => Flujo de datos
--Salida(1) => Comportamental  
--Salida(0) => Estructuraal

-- Flujo de Datos --
-- funcion(X,Y,W,Z) => X'W'Z' + XY'W' + YW'Z + XWZ'  

-- sea A(3) =X  , A(2)=Y , A(1)=W , A(0)=Z 

sal_2 <= ((not A(3)) AND (not A(1))AND (not A(0))) OR (A(3) AND (not A(2))AND (not A(1))) OR (A(2)AND (not A(1)) AND A(0)) OR (A(3) AND A(1) AND (not A(0)));

--Process para la estructura comportamental 
process(A)
begin

    case A is
        when "0000"|"0100"|"0101"|"1000"|"1001"|"1010"|"1101"|"1110" =>
            sal_1 <= '1';
        when others => 
            Sal_1 <= '0';
    end case;
  
end process;


--Codigo para el modelo estructural 

--funcion(X,Y,W,Z) => X'W'Z' + XY'W' + YW'Z + XWZ'  
-- sea A(3) =X  , A(2)=Y , A(1)=W , A(0)=Z 

invX <= not A(3);
invY <= not A(2);
invW <= not A(1);
invZ <= not A(0);

I0:and3 port map (I0=>invX , I1=>invW , I2=>invZ , Y=>outAnd1);
I1:and3 port map (I0=>A(3) , I1=>invY , I2=>invW , Y=>outAnd2);
I2:and3 port map (I0=>A(2) , I1=>invW , I2=>A(0) , Y=>outAnd3);
I3:and3 port map (I0=>A(3) , I1=>A(1) , I2=>invZ , Y=>outAnd4);
I4:or4 port map (I0 =>outAnd1 , I1 => outAnd2 , I2 => outAnd3 , I3 => outAnd4 , outOr => Sal_0);

Salida <= sal_2 & sal_1 & sal_0;
end Behavioral;
