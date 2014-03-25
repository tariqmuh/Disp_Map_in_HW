library verilog;
use verilog.vl_types.all;
entity bram_dm is
    generic(
        IDLE            : vl_logic_vector(0 to 2) := (Hi0, Hi0, Hi0);
        START_3         : vl_logic_vector(0 to 2) := (Hi0, Hi0, Hi1);
        START_5         : vl_logic_vector(0 to 2) := (Hi0, Hi1, Hi0);
        START_7         : vl_logic_vector(0 to 2) := (Hi0, Hi1, Hi1);
        COMP_3          : vl_logic_vector(0 to 2) := (Hi1, Hi0, Hi0);
        COMP_5          : vl_logic_vector(0 to 2) := (Hi1, Hi0, Hi1);
        COMP_7          : vl_logic_vector(0 to 2) := (Hi1, Hi1, Hi0);
        \DONE\          : vl_logic_vector(0 to 2) := (Hi1, Hi1, Hi1);
        NUM_OF_WIN      : integer := 64;
        TOTAL_NUM_PIXELS: integer := 199076;
        TOTAL_NUM_ROWS  : integer := 634;
        TOTAL_NUM_COLS  : integer := 474
    );
    port(
        reset           : in     vl_logic;
        clka            : in     vl_logic;
        ena             : in     vl_logic;
        wea             : in     vl_logic_vector(3 downto 0);
        addra           : in     vl_logic_vector(31 downto 0);
        dina            : in     vl_logic_vector(31 downto 0);
        clkb            : in     vl_logic;
        enb             : in     vl_logic;
        dinb            : in     vl_logic_vector(31 downto 0);
        go              : in     vl_logic;
        window          : in     vl_logic_vector(2 downto 0);
        done            : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of IDLE : constant is 1;
    attribute mti_svvh_generic_type of START_3 : constant is 1;
    attribute mti_svvh_generic_type of START_5 : constant is 1;
    attribute mti_svvh_generic_type of START_7 : constant is 1;
    attribute mti_svvh_generic_type of COMP_3 : constant is 1;
    attribute mti_svvh_generic_type of COMP_5 : constant is 1;
    attribute mti_svvh_generic_type of COMP_7 : constant is 1;
    attribute mti_svvh_generic_type of \DONE\ : constant is 1;
    attribute mti_svvh_generic_type of NUM_OF_WIN : constant is 1;
    attribute mti_svvh_generic_type of TOTAL_NUM_PIXELS : constant is 1;
    attribute mti_svvh_generic_type of TOTAL_NUM_ROWS : constant is 1;
    attribute mti_svvh_generic_type of TOTAL_NUM_COLS : constant is 1;
end bram_dm;
