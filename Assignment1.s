.data
float_value: .word 0x8048F5C3
abs_mask: .word  0x7FFFFFFF
str1:     .string "The absolute value of "  # First part of the output message
str2:     .string " is "

.text
main:
        lw a0, float_value
        jal ra, fabsf
        
        jal ra, print_fabs_Result

        li a7, 10               
        ecall                  
fabsf:        
        lw a1, abs_mask      
        and a1, a0, a1      
        ret      
        
print_fabs_Result:
        mv t0, a0
        mv t1, a1  
        
        # print "The absolute value of"
        la a0, str1
        li a7, 4  
        ecall
        
        mv a0, t0                  
        li a7, 1                
        ecall 
        
        # print "is"
        la a0, str2
        li a7, 4  
        ecall
        
        mv a0, t1                 
        li a7, 1                
        ecall 
        
        ret 