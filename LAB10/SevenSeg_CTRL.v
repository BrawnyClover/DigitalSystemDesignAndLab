module SevenSeg_CTRL(
	iCLK,
	nRST,
	iSEG7,
	iSEG6,
	iSEG5,
	iSEG4,
	iSEG3,
	iSEG2,
	iSEG1,
	iSEG0,
	oS_COM,
	oS_ENS
);
// I/O definition------------------------------------------	
input iCLK, nRST;
input [6:0] iSEG7, iSEG6, iSEG5, iSEG4,iSEG3, iSEG2, iSEG1, iSEG0;

output [7:0] oS_COM;
output [6:0] oS_ENS; /* a,b,c,d, e,f,g,dp */

reg [7:0] oS_COM;
reg [6:0] oS_ENS;
integer CNT_SCAN; 

/*
   [a]
[f]   [b]
   [g]
[e]   [c]
   [d]   [dp]
*/


always @(posedge iCLK)

begin
	$display("%b", iSEG7);
	$display("%b", iSEG6);
	$display("%b", iSEG5);
	if (nRST)
	  begin
		oS_COM <= 8'b00000000;
		oS_ENS <= 0;
	    CNT_SCAN = 0;
	  end
	else
	  begin
	  	if (CNT_SCAN >= 7)
	  	  CNT_SCAN = 0;
	  	else
	  	  CNT_SCAN = CNT_SCAN + 1;
	  	  	  	
	  	case (CNT_SCAN)
	  	  0 : 
	  	    begin
				oS_COM <= 8'b11111110;
				oS_ENS <= iSEG0;
				$display("%b", oS_ENS);
	  	    end
	  	  1 : 
	  	    begin
				oS_COM <= 8'b11111101;
				oS_ENS <= iSEG1;
				$display("%b", oS_ENS);
	  	    end
	  	  2 : 
	  	    begin
				oS_COM <= 8'b11111011;
				oS_ENS <= iSEG2;
				$display("%b", oS_ENS);
	  	    end
	  	  3 : 
	  	    begin
				oS_COM <= 8'b11110111;
				oS_ENS <= iSEG3;
				$display("%b", oS_ENS);
	  	    end
	  	  4 : 
	  	    begin
				oS_COM <= 8'b11101111;
				oS_ENS <= iSEG4;
				$display("%b", oS_ENS);
	  	    end
	  	  5 : 
	  	    begin
				oS_COM <= 8'b11011111;
				oS_ENS <= iSEG5;
				$display("%b", oS_ENS);
	  	    end
	  	  6 : 
	  	    begin
				oS_COM <= 8'b10111111;
				oS_ENS <= iSEG6;
				$display("%b", oS_ENS);
	  	    end
	  	  7 : 
	  	    begin
				oS_COM <= 8'b01111111;
				oS_ENS <= iSEG7;
				$display("%b", oS_ENS);
	  	    end			 
	  	  default : 
	  	    begin
	  	      oS_COM <= 8'b11111111;
				oS_ENS <= iSEG7;
	  	    end
	  	endcase
		  $display("==============");
      end
end

endmodule


module linedecoder(
	A3,A2,A1,A0,
	S3,S2,S1,S0
);

input A3,A2,A1,A0;
output S3,S2,S1,S0;

reg [3:0] out; 

always @(A3,A2,A1,A0)
begin
case({A3,A2,A1,A0})
4'b0000 : out <= 4'b0000; //0
4'b0001 : out <= 4'b0001; //1
4'b0010 : out <= 4'b0010; //2
4'b0011 : out <= 4'b0011; //3
4'b0100 : out <= 4'b0100; //4
4'b0101 : out <= 4'b1000; //5
4'b0110 : out <= 4'b1001; //6
4'b0111 : out <= 4'b1010; //7
4'b1000 : out <= 4'b1011; //8
4'b1001 : out <= 4'b1100; //9
default : out <= 4'b0000; //NULL
endcase 
end

assign {S3,S2,S1,S0} = out;

endmodule

/*
module binary_to_BCD(
    i_binary,
    o_bcd
);
		
input   [7:0]   i_binary;
output  [9:0]   o_bcd;
wire    [10:0]  d;

assign o_bcd[0] = i_binary[0];
linedecoder C1(0,0,0,i_binary[3],		        d[3],d[2],d[1],d[0]);
linedecoder C2(d[2],d[1],d[0],i_binary[2],	    d[7],d[6],d[5],d[4]);
linedecoder C3(0,0,0,d[3],		                o_bcd[9],d[10],d[9],d[8]);
linedecoder C4(d[6],d[5],d[4],i_binary[1],	    o_bcd[4],o_bcd[3],o_bcd[2],o_bcd[1]);
linedecoder C5(d[10],d[9],d[8],d[7],	        o_bcd[8],o_bcd[7],o_bcd[6],o_bcd[5]);

endmodule
*/


module BCD_to_7segment(
	i_bcd,
	o_segment
);

/*
   [a]
[f]   [b]
   [g]
[e]   [c]
   [d]   [dp]
*/

input [3:0] i_bcd;
output [6:0] o_segment;

reg [6:0] out; 

always @(i_bcd)
begin
case(i_bcd)
	4'b0000 : out <= 7'b1111110; //0
	4'b0001 : out <= 7'b0110000; //1
	4'b0010 : out <= 7'b1101101; //2
	4'b0011 : out <= 7'b1111001; //3
	4'b0100 : out <= 7'b0110011; //4
	4'b0101 : out <= 7'b1011011; //5
	4'b0110 : out <= 7'b1011111; //6
	4'b0111 : out <= 7'b1110010; //7
	4'b1000 : out <= 7'b1111111; //8
	4'b1001 : out <= 7'b1111011; //9
	default : out <= 7'b0000000; //NULL
endcase 
end

assign o_segment = out;

endmodule

