# non-repl:
#							r <cps> 		ramp
#							c<0-7> <*> 		channel (* = function)
#
#							f<c> <q> <freq*> 	filter
#							d<c> <0-1*> <ms*> 	delay
#							h<c> <0-1*> <holdfrq*> 	samp&hold
#							p<c> <0-1*>	 	pan
#
#							v <subdiv> 		global random time
#
#							l<c> <num> 		load file
#							w<c> <amp*> <*> 	read sample
#

		

# 							@ space
# 							t time
#							x random
#							W total samples

s_ __g
s_@_ _g
s_t_$v1_g
s_x_$v2_g
s_W_$v3_g

# 							#<0-9> 			1/8 <0-9> counter
#		 					'<subdiv><0-9> 		1/? <0-9> counter
#		 					X     			random interger
# 							e<0-9>			1/8 pow envelope
# 							i<0-9>			1/8 pow inverse envelope
#							E<subdiv><0-9>		1/subdiv pow envelope
#							I<subdiv><0-9> 		1/sibdiv pow inverse envelope

s_E\(.\)\(.\)_pow(1-$v1%(8000/\1)/(8000/\1)\\,\2)_g
s_I\(.\)\(.\)_pow($v1%(8000/\1)/(8000/\1)\\,\2)_g
s_'\(.\)\(.\)_(1+$v1/(8000/\1)%\2)_g

s_#\(.\)_(1+$v1/1000%\1)_g
s_X\(.\)_(1+$v2*\1%\1)_g
s_e\(.\)_pow(1-$v1%1000/1000\\,\1)_g
s_i\(.\)_pow($v1%1000/1000\\,\1)_g



# 							s(*) sin
#							a(*) abs
#							P(*_*) pow
# 							_ ,

s_P_pow_g
s_s_sin_g
s_a_abs_g
s/_/\\,/g




