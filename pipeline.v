module pipe_ex(f,a,b,c,d,clk);
parameter n=10;
input[n-1:0] a,b,c,d;
input clk;
output[n-1:0] f;
reg[n-1:0]l12_x1,l12_x2,l12_b,l23_x3,l23_d,l34_f;
assign f=l34_f;

always @(posedge clk)
begin
l12_x1<=#4 a+b;
l12_x2<=#4 c-d;
l23_d<=0;
end

always @( posedge clk)
begin
l23_x3<=#4 l12_x1+l12_x2;
l23_d<= l23_d;
end

always @( posedge clk)
begin
l34_f=#8 l23_x3*l23_d;
end
endmodule
