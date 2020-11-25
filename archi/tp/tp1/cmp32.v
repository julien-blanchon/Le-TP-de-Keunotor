module cmp32(a[31..0], b[31..0] : usup, ssup, equ)
	ucmp32(a[31..0], b[31..0] : sup0, equ0)
   usup = sup0
   ssup = /a[31]*b[31] + /a[31]*/b[31]*sup0 + a[31]*b[31]*/sup0
   equ = equ0
end module
