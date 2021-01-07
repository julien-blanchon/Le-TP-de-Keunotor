module decoder3to8 (e[2..0] : s[7..0])
	decoder2to4(e[1..0] : c[3..0])
	s[3..0] = /e[2]*c[3..0]
	s[7..4] = e[2]*c[3..0]
end module
