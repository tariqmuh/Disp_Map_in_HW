library verilog;
use verilog.vl_types.all;
entity bram_dm is
    generic(
        IDLE            : vl_logic_vector(0 to 2) := (Hi0, Hi0, Hi0);
        START           : vl_logic_vector(0 to 2) := (Hi0, Hi0, Hi1);
        COMP            : vl_logic_vector(0 to 2) := (Hi0, Hi1, Hi0);
        \DONE\          : vl_logic_vector(0 to 2) := (Hi0, Hi1, Hi1);
        \BUSY\          : vl_logic_vector(0 to 2) := (Hi1, Hi0, Hi0);
        NUM_OF_WIN      : integer := 64;
        VRES            : integer := 480;
        HRES            : integer := 640;
        TOTAL_NUM_PIXELS: vl_notype;
        TOTAL_NUM_ROWS  : vl_notype;
        TOTAL_NUM_COLS  : vl_notype
    );
    port(
        reset           : in     vl_logic;
        clkb            : in     vl_logic;
        enb             : out    vl_logic;
        web             : out    vl_logic_vector(3 downto 0);
        addrb           : out    vl_logic_vector(31 downto 0);
        en_ref          : out    vl_logic;
        we_ref          : out    vl_logic_vector(3 downto 0);
        addr_ref        : out    vl_logic_vector(31 downto 0);
        dout_ref        : in     vl_logic_vector(31 downto 0);
        go              : in     vl_logic;
        window          : in     vl_logic_vector(2 downto 0);
        busy            : in     vl_logic;
        doutb           : in     vl_logic_vector(31 downto 0);
        done            : out    vl_logic;
        din_fifo        : out    vl_logic_vector(31 downto 0);
        wr_en_fifo      : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of IDLE : constant is 1;
    attribute mti_svvh_generic_type of START : constant is 1;
    attribute mti_svvh_generic_type of COMP : constant is 1;
    attribute mti_svvh_generic_type of \DONE\ : constant is 1;
    attribute mti_svvh_generic_type of \BUSY\ : constant is 1;
    attribute mti_svvh_generic_type of NUM_OF_WIN : constant is 1;
    attribute mti_svvh_generic_type of VRES : constant is 1;
    attribute mti_svvh_generic_type of HRES : constant is 1;
    attribute mti_svvh_generic_type of TOTAL_NUM_PIXELS : constant is 3;
    attribute mti_svvh_generic_type of TOTAL_NUM_ROWS : constant is 3;
    attribute mti_svvh_generic_type of TOTAL_NUM_COLS : constant is 3;
end bram_dm;
