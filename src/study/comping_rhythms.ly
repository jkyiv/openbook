\include "src/include/common.lyi"
\header {
	title="Comping Rhythms"
	style="Jazz"

	copyright="-- no copyright notice for study materials --"

	completion="5"
}

%{
	TODO:
%}

\markup {
Standard Jazz comping pattern...
}
\score {
<<
	\drums {
		sn4. sn8 r2 | sn4. sn8 r2 |
	}
>>
	\midi {
		\context {
			\Score
			tempoWholesPerMinute = #(ly:make-moment 130 4)
		}
	}
	\layout {}
}
\markup {
Very famous comping for certain standards (My Baby Don't Care For Me)...
}
\score {
<<
	\drums {
		r8 sn8 r8 sn8 r8 sn8 r8 sn8 | r8 sn8 r8 sn8 r8 sn8 r8 sn8 |
	}
>>
	\midi {
		\context {
			\Score
			tempoWholesPerMinute = #(ly:make-moment 130 4)
		}
	}
	\layout {}
}
\markup {
Count Basie, Every Day I have the Blues...
}
\score {
<<
	\drums {
		sn4 r4 r4 sn4 | r1 |
	}
>>
	\midi {
		\context {
			\Score
			tempoWholesPerMinute = #(ly:make-moment 130 4)
		}
	}
	\layout {}
}
\markup {
Bossa Nove basics...
}
\score {
<<
	\drums {
		sn4 sn4 r8 sn4 sn8 ~ | sn8 r8 r4 sn4 sn4 |
	}
>>
	\midi {
		\context {
			\Score
			tempoWholesPerMinute = #(ly:make-moment 130 4)
		}
	}
	\layout {}
}
\markup {
Triplet based comping...
}
\score {
<<
	\drums {
		\times 4/3 { sn16 sn16 sn16 } \times 4/3 { sn16 sn16 sn16 } \times 4/3 { sn16 sn16 sn16 } \times 4/3 { sn16 sn16 sn16 } |
	}
>>
	\midi {
		\context {
			\Score
			tempoWholesPerMinute = #(ly:make-moment 130 4)
		}
	}
	\layout {}
}
\score {
	\drums {
		\times 4/3 { r16 sn16 sn16 } \times 4/3 { r16 sn16 sn16 } \times 4/3 { r16 sn16 sn16 } \times 4/3 { r16 sn16 sn16 } |
		\times 4/3 { sn16 r16 sn16 } \times 4/3 { sn16 r16 sn16 } \times 4/3 { sn16 r16 sn16 } \times 4/3 { sn16 r16 sn16 } |
		\times 4/3 { sn16 sn16 r16 } \times 4/3 { sn16 sn16 r16 } \times 4/3 { sn16 sn16 r16 } \times 4/3 { sn16 sn16 r16 } |
	}
	\midi {
		\context {
			\Score
			tempoWholesPerMinute = #(ly:make-moment 130 4)
		}
	}
	\layout {}
}
\score {
	\drums {
		\times 4/3 { sn16 r16 r16 } \times 4/3 { sn16 r16 r16 } \times 4/3 { sn16 r16 r16 } \times 4/3 { sn16 r16 r16 } |
		\times 4/3 { r16 sn16 r16 } \times 4/3 { r16 sn16 r16 } \times 4/3 { r16 sn16 r16 } \times 4/3 { r16 sn16 r16 } |
		\times 4/3 { r16 r16 sn16 } \times 4/3 { r16 r16 sn16 } \times 4/3 { r16 r16 sn16 } \times 4/3 { r16 r16 sn16 } |
	}
	\midi {
		\context {
			\Score
			tempoWholesPerMinute = #(ly:make-moment 130 4)
		}
	}
	\layout {}
}
\markup {
Triplet based combinations...
}
\score {
	\drums {
		\times 4/3 { sn16 sn8 } \times 4/3 { sn8 sn16 } \times 4/3 { sn16 sn8 } \times 4/3 { sn8 sn16 } |
	}
	\midi {
		\context {
			\Score
			tempoWholesPerMinute = #(ly:make-moment 130 4)
		}
	}
	\layout {}
}
\score {
	\drums {
		\times 4/3 { sn8 sn16 } \times 4/3 { r16 sn16 sn16 } \times 4/3 { sn8 sn16 } \times 4/3 { r16 sn16 sn16 } |
	}
	\midi {
		\context {
			\Score
			tempoWholesPerMinute = #(ly:make-moment 130 4)
		}
	}
	\layout {}
}
