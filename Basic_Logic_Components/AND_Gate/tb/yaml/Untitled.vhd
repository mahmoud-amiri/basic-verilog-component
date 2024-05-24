library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;   

entity adder i
port(
    clk : in std_logic;
    reset_n : in std_logic;
    a: in std_logic_vector(3 downto 0);
    b: in std_logic_vector(3 downto 0);
    sum: out std_logic_vector(3 downto 0)
)
end entity;

architecture rtl of adder is

begin

    process(clk)

    begin

        if rising_edge(clk) then

            if reset_n = '0' then

                sum <= (others => '0');

            else    

                sum <= std_logic_vector(signed(a) + signed(b));

            end if;

        end if;

    end process;

end architecture;
    process(clk)
    begin
        if rising_edge(clk) then
            if reset_n = '0' then
                sum_reg_1 <= (others => '0');
                sum_reg_2 <= (others => '0');
                sum_reg_3 <= (others => '0');
            else    
                sum_reg_1 <= sum;
                sum_reg_2 <= sum_reg_1;
                sum_reg_3 <= sum_reg_2;
            end if;
        end if;
    end process;

