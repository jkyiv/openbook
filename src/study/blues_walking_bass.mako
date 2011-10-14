include(src/include/common.lyi)
\header {
	default_header

	title="Jazz Bass line for Blues in F"
	style="Jazz"
	piece="Upbeat Jazz Blues"

	copyright=copyright_val_study

	completion="5"

	uuid="84a886b8-a26f-11df-9034-0019d11e5a41"
}
jazzTune

<%doc>
	TODO:
</%doc>

\score {
<<
\chordmode {
	\startChords

	\startSong

	\mark "A"
	\startPart
	f1:7 | bes1:7 | f1:7 | c2:m7 f2:7 | \myEndLine
	bes1:7 | bes1:7 | f1:7 | d1:7 | \myEndLine
	g1:7 | c1:7 | f2:7 d2:7 | g2:7 c2:7 | \myEndLine
	\endPart

	\mark "B"
	\startPart
	f1:7 | bes1:7 | f1:7 | c2:m7 f2:7 | \myEndLine
	bes1:7 | bes1:7 | f1:7 | a2:m7 d2:7 | \myEndLine
	g1:m7 | c1:7 | f2:7 d2:7 | g2:m7 c2:7 | \myEndLine
	\endPart

	\mark "C"
	\startPart
	f1:7 | bes1:7 | c1:m7 | f1:7 | \myEndLine
	bes1:7 | bes1:7 | f1:7 | d1:7 | \myEndLine
	g2:7 g:m7 | c1:7 | f2:7 d2:7 | g2:7 c2:7 | \myEndLine
	\endPart

	\endSong

	\endChords
}
\new Voice="melody" {
	\time 4/4
	\key f \major
	\clef bass

	f,4 a, c b, | bes, d, dis, e, | f, a, d des | c e, f, a, |
	bes, f d c | bes, b, c e | f a, c cis | d fis, a, aes, |
	g, a, ais, b, | c cis d e | f a, d fis, | g, b, c e |

	f f ees ees | d d des des | c d g, c | f, fis, g, a, |
	bes,4 b,4 c4 b,8 f,8-> | bes,8 f,8 aes,4 g, ges, | f, c b, bes, | a, ees d8 a,8 fis,4 |
	g, bes, d des | c bes, a, g, | f, ees d aes, | g, des c bes, |

	a, c f ees | d ees d des | c d ees g, | c bes, a, f |
	bes, f, c f | bes,8 f8-> b,4 c bes, | a, bes, a, g, | fis, a, d8 a,8 fis,4 |
	g,8 g,8-> a,4 bes, b, | c d dis e8 f8-> | r8 a,4.-> d4 c | b, g, c8 e,4.-> |
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