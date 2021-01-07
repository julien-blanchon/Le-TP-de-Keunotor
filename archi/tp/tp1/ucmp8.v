module ucmp8(a[7..0], b[7..0] : sup, equ)
	ucmp4(a[3..0], b[3..0] : sup0, equ0)
   ucmp4(a[7..4], b[7..4] : sup1, equ1)
   equ = equ0*equ1
   sup = sup1 + sup0*equ1
end module
