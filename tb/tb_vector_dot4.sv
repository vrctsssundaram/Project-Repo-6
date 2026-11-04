module tb_vector_dot4;
    timeunit 1ns; timeprecision 1ps;
    reg clk=0;
    always #5 clk=~clk;
    reg rst_n=0;
    reg [63:0] a=0,b=0;
    reg signed [39:0] bias=0;
    reg s_valid=0, m_ready=0;
    wire s_ready, m_valid, m_saturated;
    wire [31:0] m_result;
    integer outputs=0;
    vector_dot4 dut(.clk(clk),.rst_n(rst_n),.s_a(a),.s_b(b),
        .s_bias(bias),.s_valid(s_valid),.s_ready(s_ready),
        .m_result(m_result),.m_valid(m_valid),.m_ready(m_ready),
        .m_saturated(m_saturated));
    task automatic issue(input [63:0] av,input [63:0] bv,input signed [39:0] bv_bias);
        begin
            @(negedge clk); a=av; b=bv; bias=bv_bias; s_valid=1;
            @(posedge clk); while(!s_ready) @(posedge clk);
            @(negedge clk); s_valid=0;
        end
    endtask
    task automatic take(input [31:0] expected,input expected_sat);
        begin
            @(negedge clk); m_ready=1;
            @(posedge clk);
            if (!m_valid || m_result !== expected || m_saturated !== expected_sat)
                $fatal(1,"Dot product result %h sat=%b expected %h",m_result,m_saturated,expected);
            outputs=outputs+1;
            @(negedge clk); m_ready=0;
        end
    endtask
    initial begin
        #22; rst_n=1;
        issue({16'd7,-16'sd5,16'd3,16'd1},{-16'sd8,16'd6,16'd4,16'd2},40'sd0);
        repeat(2) @(posedge clk);
        if (!m_valid || m_result !== 32'hffffffb8 || m_saturated)
            $fatal(1,"Backpressure/result mismatch");
        take(32'hffffffb8,0); // -72
        issue(0,0,40'sd2147483747);
        take(32'h7fffffff,1);
        issue(0,0,-40'sd2147483748);
        take(32'h80000000,1);
        if(outputs != 3) $fatal(1,"Output count");
        $display("PASS: signed four-lane dot product, stalls and positive/negative saturation");
        $finish;
    end
    initial begin #20000; $fatal(1,"Watchdog timeout"); end
endmodule
