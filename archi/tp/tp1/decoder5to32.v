module decoder5to32(e[4..0] : s[31..0])
	decoder4to16(e[3..0] : c[15..0])
	s[15..0] = /e[4]*c[15..0]
	s[31..16] = e[4]*c[15..0]
end module