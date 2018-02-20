include "All sounds.pl"

ReplacePitch = "E4" # Replace all notes in track with this pitch

# Tremolo adaptor
trem_maxlen = 100 # Maximum length of one note inside tremolo for detection
trem_min_repeats = 3 # Minimum number of note repeats to detect tremolo
trem_dyn_range = 0-100 # Percent of tremolo dynamics compared to sustain notes
trem_replace = "D3" # Replace tremolo notes with this note
