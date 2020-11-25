module addsub32(a[31..0], b[31..0], sub : s[31..0], V, C)
	bb[31..0] = /sub*b[31..0] + sub*/b[31..0]
	adder32(a[31..0], bb[31..0], sub : s[31..0], co)
	V = /sub*a[31]*b[31]*/s[31] + /sub*/a[31]*/b[31]*s[31]
	     + sub*a[31]*/b[31]*/s[31] + sub*/a[31]*b[31]*s[31]
	C = /sub*co+sub*/co
end module
