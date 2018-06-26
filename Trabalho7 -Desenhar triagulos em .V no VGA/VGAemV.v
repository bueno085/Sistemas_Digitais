module mem_ROM (
   input CLOCK_50,
   input  [17:0] w_addr,
   input  [15:0] w_data,
   input  [17:0] r_addr,
   output [15:0] r_data,

   output [17:0] addr,
   inout [15:0] data,

   output we, // config da placa para memoria
   output oe, //
   output ub, //
   output lb, //
   output ce  //
   );

   reg state = 0;
   assign we = state;
   assign oe = 0;
   assign ub = 0;
   assign lb = 0;
   assign ce = 0;
   assign r_data = reg_r_data;

   reg [15:0] reg_r_data;

   reg [17:0] reg_addr;
   reg [15:0] reg_dq;

   assign addr = reg_addr;

   assign data = reg_dq;
   
   always @(posedge CLOCK_50)
   begin

       case (state)
           0: begin
               reg_addr <= r_addr;
               reg_dq <= 16'hzzzz;
               state <= 1;
           end
           1: begin
               reg_r_data <= data;
               reg_addr <= w_addr;
               reg_dq <= w_data;
               state <= 0;
           end
       endcase
   end

endmodule // mem_ROM

module trianguloVGA (
   input CLOCK_50,

   );


endmodule // trianguloVGA
