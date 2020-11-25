module adder32(a[31..0], b[31..0], cin : s[31..0], cout)
	adder8(a[7..0], b[7..0], cin : s[7..0], aux1)
   adder8(a[15..8], b[15..8], aux1 : s[15..8], aux2)
   adder8(a[23..16], b[23..16], aux2 : s[23..16], aux3)
   adder8(a[31..24], b[31..24], aux3 : s[31..24], cout)
end module
