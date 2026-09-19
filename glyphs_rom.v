`default_nettype none

// Glyph ROM for the phrase "COLEGIO DE MUNTINLUPA MICROELECTRONICS 2026 "
// c = position in the phrase (0..43), y = glyph row, x = glyph column
module glyphs_rom(
    input  wire [5:0] c, input  wire [3:0] y, input  wire [2:0] x, output reg pixel
);
    reg [4:0] ch; // glyph id
    reg [7:0] rb;

    // position in phrase -> glyph id
    always @(*) begin
        case (c)
            0: ch = 0; // C
            1: ch = 1; // O
            2: ch = 2; // L
            3: ch = 3; // E
            4: ch = 4; // G
            5: ch = 5; // I
            6: ch = 1; // O
            7: ch = 6; // SPACE
            8: ch = 7; // D
            9: ch = 3; // E
            10: ch = 6; // SPACE
            11: ch = 8; // M
            12: ch = 9; // U
            13: ch = 10; // N
            14: ch = 11; // T
            15: ch = 5; // I
            16: ch = 10; // N
            17: ch = 2; // L
            18: ch = 9; // U
            19: ch = 12; // P
            20: ch = 13; // A
            21: ch = 6; // SPACE
            22: ch = 8; // M
            23: ch = 5; // I
            24: ch = 0; // C
            25: ch = 14; // R
            26: ch = 1; // O
            27: ch = 3; // E
            28: ch = 2; // L
            29: ch = 3; // E
            30: ch = 0; // C
            31: ch = 11; // T
            32: ch = 14; // R
            33: ch = 1; // O
            34: ch = 10; // N
            35: ch = 5; // I
            36: ch = 0; // C
            37: ch = 15; // S
            38: ch = 6; // SPACE
            39: ch = 16; // 2
            40: ch = 17; // 0
            41: ch = 16; // 2
            42: ch = 18; // 6
            43: ch = 6; // SPACE
            default: ch = 6; // SPACE
        endcase
    end

    // glyph id -> bitmap row
    always @(*) begin
        case (ch)
            0:  case(y) 2,10:rb=8'h7E; 3,9:rb=8'hC3; 4,5,6,7,8:rb=8'hC0; default:rb=0; endcase // C
            1:  case(y) 2,10:rb=8'h3C; 3,9:rb=8'h66; 4,5,6,7,8:rb=8'hC3; default:rb=0; endcase // O
            2:  case(y) 2,3,4,5,6,7,8,9:rb=8'hC0; 10:rb=8'hFE; default:rb=0; endcase // L
            3:  case(y) 2,6,10:rb=8'hFE; 3,4,5,7,8,9:rb=8'hC0; default:rb=0; endcase // E
            4:  case(y) 2,10:rb=8'h7E; 3,4,5:rb=8'hC0; 6:rb=8'hCE; 7,8,9:rb=8'hC6; default:rb=0; endcase // G
            5:  case(y) 2,10:rb=8'h7E; 3,4,5,6,7,8,9:rb=8'h18; default:rb=0; endcase // I
            6: rb = 8'h00; // SPACE
            7:  case(y) 2,10:rb=8'hF8; 3,4,5,6,7,8,9:rb=8'hC6; default:rb=0; endcase // D
            8:  case(y) 2:rb=8'hC3; 3:rb=8'hE7; 4:rb=8'hFF; 5:rb=8'hDB; 6,7,8,9,10:rb=8'hC3; default:rb=0; endcase // M
            9:  case(y) 2,3,4,5,6,7,8,9:rb=8'hC6; 10:rb=8'h7E; default:rb=0; endcase // U
            10:  case(y) 2,3:rb=8'hC6; 4:rb=8'hE6; 5:rb=8'hF6; 6:rb=8'hD6; 7:rb=8'hC6; 8:rb=8'hCE; 9,10:rb=8'hC6; default:rb=0; endcase // N
            11:  case(y) 2:rb=8'hFF; 3,4,5,6,7,8,9,10:rb=8'h18; default:rb=0; endcase // T
            12:  case(y) 2,6:rb=8'hFC; 3,4,5:rb=8'hC6; 7,8,9,10:rb=8'hC0; default:rb=0; endcase // P
            13:  case(y) 2:rb=8'h3C; 3,4,5:rb=8'h66; 6,7:rb=8'hFF; 8,9,10:rb=8'hC3; default:rb=0; endcase // A
            14:  case(y) 2,6:rb=8'hFC; 3,4,5:rb=8'hC6; 7,8,9:rb=8'hD8; 10:rb=8'hC6; default:rb=0; endcase // R
            15:  case(y) 2:rb=8'h3E; 3:rb=8'h63; 4:rb=8'h60; 5:rb=8'h7C; 6,7:rb=8'h06; 8:rb=8'h63; 9:rb=8'h3E; default:rb=0; endcase // S
            16:  case(y) 2:rb=8'h3E; 3:rb=8'h63; 4:rb=8'h03; 5:rb=8'h06; 6:rb=8'h1C; 7:rb=8'h30; 8,9:rb=8'h60; 10:rb=8'hFF; default:rb=0; endcase // 2
            17:  case(y) 2,10:rb=8'h3C; 3,4,5,6,7,8,9:rb=8'h66; default:rb=0; endcase // 0
            18:  case(y) 2:rb=8'h3E; 3,4:rb=8'h60; 5:rb=8'h7C; 6,7,8,9:rb=8'h66; 10:rb=8'h3C; default:rb=0; endcase // 6
            default: rb = 8'h00;
        endcase
        pixel = rb[7-x];
    end
endmodule
