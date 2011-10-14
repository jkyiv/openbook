%% end verbatim - this comment is a hack to prevent texinfo.tex
%% from choking on non-European UTF-8 subsets

%% this version tag will keep me compiling only on this version of lilypond.
%%=====================================================================
\version "2.12.3"

%% lets define a variable to hold the formatted build date (man 3 strftime):
date=#(strftime "%T %d-%m-%Y" (localtime (current-time)))
lilyver=#(lilypond-version)

%% default values for headers
%%=======================================================================
subsubtitleval=#"Built by Mark Veltzer <mark.veltzer@gmail.com> at esyscmd(date)"
subsubtitlevalheb=#"נבנה על ידי מרק ולצר mark.veltzer@gmail.com ב esyscmd(date)"
%%subsubtitle_val=\date
enteredbyval=#"Mark Veltzer"
enteredbyvalheb=#"מרק ולצר"
maintainerEmailval=#"mark.veltzer@gmail.com"
maintainerEmailvalheb=#"mark.veltzer@gmail.com"
footerval=#"this is the footer"
footervalheb=#"זה הטקסט התחתון"
copyrightval=#"-- help me fill it out copyright --"
copyrightvalheb=#"-- עיזרו לי למלא זכויות יוצרים --"
copyrightvalstudy=#"-- no copyright notice for study materials --"
completionval=#"0"
taglineval=\markup {\small {Typeset by Mark Veltzer <mark.veltzer@gmail.com>, Built at \date, Engraved by lilypond \lilyver}}
taglinevalheb=\markup {\small {Typeset by Mark Veltzer <mark.veltzer@gmail.com>, Built at \date, Engraved by lilypond \lilyver}}
%%define(default_header_heb,
%%	enteredby=enteredbyval
%%	maintainerEmail=maintainerEmailvalheb
%%	footer=footervalheb
%%	copyright=copyrightvalheb
%%	completion=completionval
%%	tagline=taglinevalheb
%%	style="ישראלי"
%%	poet="לא מולא"
%%)
%% setting instruments for midi generation (bah - this doesn't work...)
%%=====================================================================
%%\set ChordNames.midiInstrument = #"acoustic grand"
%%\set Staff.midiInstrument = #"flute"
%%\set PianoStaff.instrumentName = #"acoustic grand"
%% do not show chords unless they change...
%%\set chordChanges = ##t

%% number of staffs per page (this does not work because of my breaks)
%%\paper {
%%	system-count = #7
%%}

\paper {
	%% reduce spaces between systems and the bottom (taken from the lilypond
	%% documentation and found the relevant variable)
	%% the result of this is that I can fit 8 single staffs in one page
	%% which is ideal for Jazz (think 32 bar divided into 8 lines of 4 bars each...).
	%% I should really only apply this thing for Jazz tunes but that is a TODO item.
	%% default is 4\mm - 3 already causes 8 staffs to take 2 pages
	between-system-padding = 2\mm
	%% default is 20\mm
	%% between-system-space = 16\mm
	%% ragged-last-bottom = ##f
	%% ragged-bottom = ##f

	%% make lilypond increase the distance of the footer from the bottom of the page
	%% it seems that if you don't do something like this you're going to have
	%% a real problem seeing the footer in postscript printing....
	%%bottom-margin = 2.5\cm

}
\layout {
	%% don't have the fist line indented
	indent = 0.0 \cm
	%% don't know what this is (taken from Laurent Martelli...)
	%%textheight = 1.5\cm

	\context {
		\Score
		\override LyricText #'font-family = #'typewriter
		\override LyricText #'font-size = #'-2
		%% set the style of the chords to Jazz - I don't see this making any effect
		%%\override ChordName #'style = #'jazz
		%%\override ChordName #'word-space = #2
		\override ChordName #'font-series = #'bold
		\override ChordName #'font-family = #'roman
		\override ChordName #'font-size = #-1
		%% don't show bar numbers (for jazz it makes it too cluttery)
		\remove "Bar_number_engraver"
	}
}
%% reduce the font size (taken from the lilypond info documentation)
%%#(set-global-staff-size 17.82)

%% There is no need to set the paper size to a4 since it is the default.
%% make lilypond use paper of size a4 (Is this the default ?!?)
%%#(set-default-paper-size "a4")
%%)

%% some macros to be reused all over
%% =====================================================================
myBreak=\break
myEndLine=\break
myEndLineVoltaNotLast={}
myEndLineVoltaLast=\break
partBar=\bar "||"
endBar=\bar "|."
startRepeat=\bar "|:"
endRepeat=\bar ":|"
startTune={}
endTune=\bar "|."
myFakeEndLine={}

%% this is a macro that * really * breaks lines. You don't really need this since a regular \break will work
%% AS LONG AS you have the '\remove Bar_engraver' enabled...
hardBreak={ \bar "" \break }
%% a macro to make vertical space
verticalSpace=\markup { \null }

%% some macros for marking parts of jazz tunes
%% =====================================================================
%% if attributes['jazzTune']:
startSong={}
endSong=\bar "|."
startPart={}
endPart=\bar "||"
startIntro=\mark "Intro"
endIntro={}
%% this causes chords that do not change to disappear...
startChords=\set chordChanges = ##t
endChords={}
%% endif

%% this causes the variables to be defined...
${self.body()}

\header {
	enteredby=\enteredbyval
	maintainerEmail=\maintainerEmailval
	footer=\footerval
	copyright=\copyrightval
	completion=\completionval
	tagline=\taglineval
	style="not filled"
	poet="unkown"

	title="${attributes['title']}"
	subtitle="${attributes['subtitle']}"
	composer="${attributes['composer']}"
	style="${attributes['style']}"
	piece="${attributes['piece']}"
	poet="${attributes['poet']}"
	copyright="${attributes['copyright']}"
	copyrightextra="${attributes['copyrightextra']}"

	completion="${attributes['completion']}"
	uuid="${attributes['uuid']}"

	structure="${attributes['structure']}"

	idyoutube="${attributes['idyoutube']}"

	lyricsurl="${attributes['lyricsurl']}"
}

% if attributes['type']=='harmony_tune_lyrics':
%% score for printing
\score {
	<<
		\new ChordNames="Chords"
			${self.myChords()}
		\new Staff="Melody" {
			\new Voice="myvoice"
			${self.myVoice()}
		}
		\new Lyrics="Lyrics" \lyricsto "myvoice"
			${self.myLyrics()}
	>>
	\layout {
	}
}
%% score for midi
\score {
	\unfoldRepeats
	<<
		%% the ="Chords" is the name of the channel that will be in midi
		\new ChordNames="Chords"
			${self.myChords()}
		%% the ="Melody" is the name of the channel that will be in midi
		\new Staff="Melody" {
			\new Voice="myvoice"
			${self.myVoice()}
		}
		%% the ="Lyrics" is the name of the channel that will be in midi
		\new Lyrics="Lyrics" \lyricsto "myvoice"
			${self.myLyrics()}
	>>
	\midi {
	}
}
% endif