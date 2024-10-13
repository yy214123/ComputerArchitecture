.data
test_data_1: .word 0x00000001   # binary: 00000000 00000000 00000000 00000001
expected_result_1: .word 31     # 31 leading zeros

test_data_2: .word 0x00000010   # binary: 00000000 00000000 00000000 00010000
expected_result_2: .word 27     # 27 leading zeros

test_data_3: .word 0x80000000   # binary: 10000000 00000000 00000000 00000000
expected_result_3: .word 0      # 0 leading zeros

test_data_4: .word 0x000000FF   # binary: 00000000 00000000 00000000 11111111
expected_result_4: .word 24     # 24 leading zeros

test_data_5: .word 0x00F00000   # binary: 00000000 11110000 00000000 00000000
expected_result_5: .word 8      # 8 leading zeros

test_data_6: .word 0x7FFFFFFF   # binary: 01111111 11111111 11111111 11111111
expected_result_6: .word 1      # 1 leading zero

test_data_7: .word 0x0000F000   # binary: 00000000 00000000 11110000 00000000
expected_result_7: .word 16     # 16 leading zeros

test_data_8: .word 0x00000000   # binary: 00000000 00000000 00000000 00000000
expected_result_8: .word 32     # 32 leading zeros (all bits are zero)

test_data_9: .word 0x00008000   # binary: 00000000 00000000 10000000 00000000
expected_result_9: .word 15     # 15 leading zeros

test_data_10: .word 0x40000000   # binary: 01000000 00000000 00000000 00000000
expected_result_10: .word 1      # 1 leading zero

str1:     .string "Pass "  
str2:     .string "Fail "

.text
main:
    lw a0, test_data_1
    jal ra, my_clz
    lw t0, expected_result_1
    bne t0, a1, fail
    jal pass
    
    li a7, 10               
    ecall
    
my_clz:
    li t0, 0  
    li t1, 31    
    li t2, 1  
    
loop:
    sll t3, t2, t1
    and t3, a0, t3 
    bnez t3, break
    
    addi t0, t0, 1
    addi t1, t1, -1
    
    bgez t1, loop
        
break:
    mv a1, t0 
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