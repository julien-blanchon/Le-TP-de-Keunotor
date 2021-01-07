module ucmp2(a[1..0], b[1..0] : sup, equ)
	ucmp1(a[0], b[0] : sup0, equ0)
   ucmp1(a[1], b[1] : sup1, equ1)
	equ = equ0*equ1
   sup = sup1 + sup0*equ1
end module
