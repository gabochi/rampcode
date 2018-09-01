# 							@ space
# 							t time
#							x random

s_ __g
s_@_ _g
s_t_$v1_g
s_x_$v2_g

# 							# 1/8 sequence
#		 					## X/8 sequence
#		 					X# 1/8 random sequence?
#		 					/X# X/8 random sequence?
# 							e 1/8 envelope
# 							i 1/8 invert envelope
#							#e X/8 envelope
#							#i X/8 inverse envelope

s_#e\(.\)\(.\)_*pow(1-$v1%(8000/\1)/(8000/\1)\\,\2)_g
s_#i\(.\)\(.\)_*pow($v1%(8000/\1)/(8000/\1)\\,\2)_g
s_##\(.\)\(.\)_($v1/(8000/\1)%\2)_g
s_#\(.\)_($v1/1000%\1)_g
s_e\(.\)_*pow(1-$v1%1000/1000\\,\1)_g
s_i\(.\)_*pow($v1%1000/1000\\,\1)_g

# 							s sin
#							a abs
# 							_ ,

s_s_sin_g
s_a_abs_g
s/_/\\,/g

#							PRESETS
