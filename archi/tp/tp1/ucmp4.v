module ucmp4(a[3..0], b[3..0] : sup, equ)
	ucmp2(a[1..0], b[1..0] : sup0, equ0)
   ucmp2(a[3..2], b[3..2] : sup1, equ1)
   equ = equ0*equ1
   sup = sup1 + sup0*equ1
end module
