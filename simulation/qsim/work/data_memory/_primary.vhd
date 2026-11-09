library verilog;
use verilog.vl_types.all;
entity data_memory is
    port(
        Address         : in     vl_logic_vector(127 downto 0);
        Read            : in     vl_logic;
        Write           : in     vl_logic;
        Datain          : in     vl_logic_vector(7 downto 0);
        Clock           : in     vl_logic;
        Dataout         : out    vl_logic_vector(7 downto 0)
    );
end data_memory;
