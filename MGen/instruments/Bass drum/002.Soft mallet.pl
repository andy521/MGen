include "All sounds.pl"

ReplacePitch = "C2" # Replace all notes in track with this pitch

# Tremolo adaptor
trem_maxlen = 100 # Maximum length of one note inside tremolo for detection
trem_min_repeats = 3 # Minimum number of note repeats to detect tremolo
trem_dyn_range = 0-100 # (0-100) Percent of tremolo dynamics compared to sustain notes
trem_replace = "G#2" # Replace tremolo notes with this note
trem_maxint = 127 # Maximum interval between notes of a trill in semitones to be considered a tremolo
trem_end = 1 # 0 - normal ending, 1 - cutoff (need hit), 2 - ending hit
