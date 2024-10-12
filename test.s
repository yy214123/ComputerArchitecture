.data
        test_data_1: .word 0xbf800000   # -1.0
        expected_result_1: .word 0x3f800000  # 1.0

        test_data_2: .word 0xbfc00000   # -1.5
        expected_result_2: .word 0x3fc00000  # 1.5

        test_data_3: .word 0xbfe00000   # -1.75
        expected_result_3: .word 0x3fe00000  # 1.75

        test_data_4: .word 0xbfa00000   # -1.25
        expected_result_4: .word 0x3fa00000  # 1.25

        test_data_5: .word 0xbf400000   # -0.75
        expected_result_5: .word 0x3f400000  # 0.75

        test_data_6: .word 0xbf200000   # -0.625
        expected_result_6: .word 0x3f200000  # 0.625

        test_data_7: .word 0xbf000000   # -0.5
        expected_result_7: .word 0x3f000000  # 0.5

        test_data_8: .word 0xbf100000   # -0.5625
        expected_result_8: .word 0x3f100000  # 0.5625

        test_data_9: .word 0xbf600000   # -0.875
        expected_result_9: .word 0x3f600000  # 0.875

        test_data_10: .word 0xbfc80000   # -1.5625
        expected_result_10: .word 0x3fc80000  # 1.5625

        abs_mask: .word  0x7FFFFFFF
        str1:     .string "Pass "
        str2:     .string "Fail "
.text
main:   
        la a1, test_data_1   
        jal fabsf_v2      
        lw t0, expected_result_1  
        bne a0, t0, fail  
        jal pass
        
        la a1, test_data_2   
        jal fabsf_v2      
        lw t0, expected_result_2  
        bne a0, t0, fail  
        jal pass
        
        la a1, test_data_3   
        jal fabsf_v2      
        lw t0, expected_result_3  
        bne a0, t0, fail  
        jal pass
        
        la a1, test_data_4   
        jal fabsf_v2      
        lw t0, expected_result_4  
        bne a0, t0, fail  
        jal pass
        
        la a1, test_data_5   
        jal fabsf_v2      
        lw t0, expected_result_5  
        bne a0, t0, fail  
        jal pass
        
        la a1, test_data_6   
        jal fabsf_v2      
        lw t0, expected_result_6  
        bne a0, t0, fail  
        jal pass
        
        la a1, test_data_7
        jal fabsf_v2      
        lw t0, expected_result_7
        bne a0, t0, fail  
        jal pass
        
        la a1, test_data_8   
        jal fabsf_v2      
        lw t0, expected_result_8
        bne a0, t0, fail  
        jal pass
        
        la a1, test_data_9   
        jal fabsf_v2      
        lw t0, expected_result_9  
        bne a0, t0, fail  
        jal pass
        
        la a1, test_data_10   
        jal fabsf_v2      
        lw t0, expected_result_10
        bne a0, t0, fail  
        jal pass
        
        li a7, 10
        ecall

fabsf_v1:
        lw a0, 0(a1)
        bltz a0, negate_value
        ret
fabsf_v2:
        lw a0, 0(a1)        
        lw a2, abs_mask      
        and a0, a0, a2      
        ret         
negate_value:
        lw a2, abs_mask 
        and a0, a0, a2      
        ret
fail:
    la a0, str2
    li a7, 4  
    ecall
    ret
pass:
    la a0, str1
    li a7, 4  
    ecall
    ret
