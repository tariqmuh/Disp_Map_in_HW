library verilog;
use verilog.vl_types.all;
entity grayscale_pixel_FIFO is
    port(
        rst             : in     vl_logic;
        wr_clk          : in     vl_logic;
        rd_clk          : in     vl_logic;
        din             : in     vl_logic_vector(31 downto 0);
        wr_en           : in     vl_logic;
        rd_en           : in     vl_logic;
        dout            : out    vl_logic_vector(31 downto 0);
        full            : out    vl_logic;
        empty           : out    vl_logic;
        rd_data_count   : out    vl_logic_vector(5 downto 0)
    );
end grayscale_pixel_FIFO;
