module ucmp16(a[15..0], b[15..0] : sup, equ)
	ucmp8(a[7..0], b[7..0] : sup0, equ0)
   ucmp8(a[15..8], b[15..8] : sup1, equ1)
   equ = equ0*equ1
   sup = sup1 + sup0*equ1
end module
