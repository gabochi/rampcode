# 		@ 			space
# 		t 			time
#		x<subd><seed> 		random float (0-1)
#		W 			total samples

s_ __g
s_@_ _g
s_t_$v1_g
s_x\(.\)\(.\)_a(s($v1/(8000/\1)%7919*s($v1/(8000/\1)%7919)+\2))_g
s_W_$v2_g

# 		#<subd><1-9> 		1/x counter
#		X<subd><1-9> 		random integer
# 		e<subd><1-9>		1/x pow envelope
# 		i<subd><1-9>		1/x pow inverse envelope


s_e\(.\)\(.\)_pow(1-$v1%(8000/\1)/(8000/\1)\\,\2)_g
s_i\(.\)\(.\)_pow($v1%(8000/\1)/(8000/\1)\\,\2)_g
s_#\(.\)\(.\)_(1+$v1/(8000/\1)%\2)_g
s_X\(.\)\(.\)_I(1+a(s($v1/(8000/\1)%7919*s($v1/(8000/\1)%7919)))*\2)_g

# 		s() 	sin
#		a() 	abs
# 		_ 	,
#		I()	int

s_s_sin_g
s_a_abs_g
#s/_/\\,/g
s_I_int_g

# Hex

s_A_11_g
s_B_12_g
s_C_13_g
s_D_14_g
s_E_15_g
s_F_16_g

