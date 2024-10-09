.data
float_value: .word 0x8048F5C3
abs_mask: .word  0x7FFFFFFF
str1:     .string "The absolute value of "  # First part of the output message
str2:     .string " is "

.text
main:
        jal ra, fabsf
        li a7, 10               
        ecall                  
fabsf:
        lw a0, float_value        
        lw a1, abs_mask      
        and a1, a0, a1      
        ret      
        
