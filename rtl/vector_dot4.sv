module vector_dot4 (
    input  wire               clk,
    input  wire               rst_n,
    input  wire [63:0]        s_a,
    input  wire [63:0]        s_b,
    input  wire signed [39:0] s_bias,
    input  wire               s_valid,
    output wire               s_ready,
    output reg  [31:0]        m_result,
    output reg                m_valid,
    input  wire               m_ready,
    output reg                m_saturated
);
    timeunit 1ns; timeprecision 1ps;
    reg signed [39:0] total;
    reg signed [31:0] product;
    integer lane;
    always @* begin
        total = s_bias;
        product = 0;
        for (lane=0; lane<4; lane=lane+1) begin
            product = $signed(s_a[lane*16 +:16]) * $signed(s_b[lane*16 +:16]);
            total = total + {{8{product[31]}},product};
        end
    end
    assign s_ready = !m_valid || m_ready;
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            m_valid <= 0;
            m_result <= 0;
            m_saturated <= 0;
        end else if (s_ready) begin
            m_valid <= s_valid;
            if (s_valid) begin
                if (total > 40'sd2147483647) begin
                    m_result <= 32'h7fffffff;
                    m_saturated <= 1;
                end else if (total < -40'sd2147483648) begin
                    m_result <= 32'h80000000;
                    m_saturated <= 1;
                end else begin
                    m_result <= total[31:0];
                    m_saturated <= 0;
                end
            end
        end
    end
endmodule
