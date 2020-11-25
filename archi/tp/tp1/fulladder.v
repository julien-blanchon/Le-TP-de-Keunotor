module fulladder (a, b, cin : s, cout)
	s = /a*/b*cin + /a*b*/cin + a*/b*/cin + a*b*cin
	cout = a*(b+cin) + b*cin
end module
