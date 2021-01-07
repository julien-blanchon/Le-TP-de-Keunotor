module ucmp32(a[31..0], b[31..0] : sup, equ)
	ucmp16(a[15..0], b[15..0] : sup0, equ0)
   ucmp16(a[31..16], b[31..16] : sup1, equ1)
   equ = equ0*equ1
   sup = sup1 + sup0*equ1
end module
