module decoder6to64(e[5..0] : s[63..0])
	decoder5to32(e[4..0] : c[31..0])
	s[31..0] = /e[5]*c[31..0]
	s[63..32] = e[5]*c[31..0]
end module
