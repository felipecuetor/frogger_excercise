module states
   (
    input wire clk, reset,
    input wire sw,
    output reg [7:0] data0,
    output reg [7:0] data1,
    output reg [7:0] data2,
    output reg [7:0] data3,
    output reg [7:0] data4,
    output reg [7:0] data5,
    output reg [7:0] data6,
    output reg [7:0] data7
   );

   // symbolic state declaration
   localparam
               zero  = 1'b0,
               uno = 1'b1;

reg state_reg, state_next;

always @(posedge clk, posedge reset)
       if (reset)
          begin
             state_reg <= zero;
          end
       else
          begin
             state_reg <= state_next;
          end

   always @*
   begin
      state_next = state_reg;   // default state: the same
      case (state_reg)
         zero:
            begin
               data0 = 8'b00111100;
               data1 = 8'b01000010;
               data2 = 8'b10001001;
               data3 = 8'b10000010;
               data4 = 8'b10000100;
               data5 = 8'b10000010;
               data6 = 8'b01000001;
               data7 = 8'b00111110;
               if (sw)
                  begin
                     state_next = uno;
                  end
            end
         uno:
            begin
               data0 = 8'b00111100;
               data1 = 8'b01000010;
               data2 = 8'b10001001;
               data3 = 8'b10000001;
               data4 = 8'b10000111;
               data5 = 8'b10000001;
               data6 = 8'b01000010;
               data7 = 8'b00111100;
               if (sw)
                  begin
                     state_next = zero;
                  end
            end
         default:
	    begin
               data0 = 8'b00111100;
               data1 = 8'b01000010;
               data2 = 8'b10001001;
               data3 = 8'b10000001;
               data4 = 8'b10000111;
               data5 = 8'b10000001;
               data6 = 8'b01000010;
               data7 = 8'b00111100;
            end
      endcase
   end

endmodule
