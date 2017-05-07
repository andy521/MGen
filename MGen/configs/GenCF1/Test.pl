# Main parameters
t_cnt = 1000000 # Maximum number of canti generated
c_len = 9 # Number of measures in each cantus. Usually 9 to 11
s_len = 7 # Maximum number of measures to full scan. 6-7 is recommended. Lower values can create less melodic results. Higher values are slow to compute
min_interval = 4 # Minimum diatonic interval in cantus (7 = octave)
max_interval = 7 # Maximum diatonic interval in cantus (7 = octave)
key = C # Music key to use for generation
random_key = 0 # Allow generator to select random key
first_note = C5 # Starting note of each cantus
last_note = C5 # Ending note of each cantus
tempo = 100-130 # Tempo range
random_seed = 0 # Seed melody with random numbers. This ensures giving different results if generation is very slow.
shuffle = 0 # If you want to shuffle all canti after generation (can shuffle up to 32000 canti)

# Rules: 0 - show only without violation, 1 - show with or without violation, 2 - show only violations
# ! means that this rule can produce results without other rules with c_len=9, interval 4-7
# Flag order in list below goes from green - less severe (top) to red - more severe (bottom)
# Groups:
# S - strict rules that can usually be violated
# U - universal for all melodies
# C - rules specifially for cantus firmus
# L - rules specifially for lower cantus firmus
# H - rules specifially for higher cantus firmus
# V - rules appropriate for vocal melody

Strict                     = 0 # No violated rules
3 letters in a row [V]     = X #SC 3 same letters (TDS) in possible chord names in a row (variants)
4 step miss [C]            = X #SC 4 steps missing one of 3 letters (TDS) in possible chord names in a row (constant)
4 letters in a row [V]     = X #SC 4 same letters (TDS) in possible chord names in a row (variants)
>4 letters in a row [V]    = X #SC More than 4 same letters (TDS) in possible chord names in a row (variants)
5 step miss [C]            = X #SC 5 steps missing one of 3 letters (TDS) in possible chord names in a row (constant)
>5 step miss [C]           = X #SC More than 5 steps missing one of 3 letters (TDS) in possible chord names in a row (constant)
Preleaped unfilled 3rd     = 0 #S 3rd is unfilled, but was prepared by leap before
Preleaped unresolved 3rd   = 0 #S! 3rd is unresolved, but was prepared by leap before
Two 3rds after 6/8         = 0 #S Chain of two thirds in one direction after 6th or octave
Late <6th resolution       = 0 #S! Leap less than 6th is resolved after a second note
Leap back <7th             = 0 #S Leap returns to same note (in case leap is equal or less than 4th)
Early-late filled >4th     = 0 #S! Leap longer than 4th is not filled or prefilled, but it is filled somewhere else in the melody
"Consecutive leaps"        = 0 #S More than cse_leaps consecutive leaps
Many leaps                 = 0 #S! Maximum allowed max_leaps during max_leap_steps
"3rd to last is CEG"       = 0 #SC! Third to last note is not Subdominant (C E G forbidden)
Last leap                  = 0 #S Last step is a leap
Tritone resolved           = 2 #S Tritone is prepared by E and resolved to C
"Prefilled unresolved 3rd" = 0 #S 3rd is not resolved by backward movement, but it was filled before
"Prefilled unresolved 4th" = 0 #S 4th is not resolved by backward movement, but it was filled before
3 letters in a row [C]     = 0 #L! 3 same letters (TDS) in possible chord names in a row (constant)
Unfilled leap >4th         = 0 #U! Leap is not filled
Leap to leap resolution    = 0 #S Resolution of leap with another leap
"Leap back overflow"       = 0 #S Leap back is going farther than starting note of a previous leap
"Prefilled unfilled 3rd"   = 0 #S 3rd is not filled, but it was filled before
"Prefilled unfilled 4th"   = 0 #S 4th is not filled, but it was filled before
"Prefilled unfilled >4th"  = 1 #S Leap longer than 4th is not filled, but it was filled before
"Preleaped unfilled 4th"   = 0 #S 4th is not filled, but it has a greater leap as neighbour
"Preleaped unfilled >4th"  = 0 #S Leap longer than 4th is not filled, but it has a greater leap as neighbour
Two 3rds                   = 0 #U Chain of two thirds in one direction
4 step miss [V]            = 0 #L 4 steps missing one of 3 letters (TDS) in possible chord names in a row (variants)
"First not C"              = 0 #C First note is not tonic
Minor seventh              = 0 #U Minor seventh interval leap
Outstanding repeat         = 0 #U Prohibit repeating of 3 notes closer than repeat_steps between first notes (if beats are same)
Long smooth                = 0 #U Too long smooth movement
Long line                  = 0 #U Too long smooth movement in one direction (linear)
First steps without C      = 0 #L First first_steps_tonic (see comment) steps do not have C note
First steps without E      = 0 #H First first_steps_tonic (see comment) steps do not have E note
Close repeat               = 0 #U Two notes repeat in contact
Stagnation                 = 0 #U Stagnation on one note
Multiple culminations      = 0 #U Melody has more than one culmination with the same note
Major seventh              = 0 #U Major seventh interval leap
"2nd to last not GBD"      = 0 #C Second to last note is not GBD (C E F A forbidden)
"2nd to last is G"         = 0 #H Second to last note is G (G forbidden)
4 letters in a row [C]     = 0 #C 4 same letters (TDS) in possible chord names in a row (constant)
>4 letters in a row [C]    = 0 #U More than 4 same letters (TDS) in possible chord names in a row (constant)
5 step miss [V]            = 0 #C 5 steps missing one of 3 letters (TDS) in possible chord names in a row (variants)
>5 step miss [V]           = 0 #U More than 5 steps missing one of 3 letters (TDS) in possible chord names in a row (variants)
Late culmination           = 0 #L Culmination at last three steps
Leap back >6th             = 0 #U Leap returns to same note (in case leap is larger than 4th)
Many leaps+                = 0 #U Maximum allowed max_leaps2 during max_leap_steps
"Last not C"               = 0 #C Last note is not tonic
"Unresolved 3rd"           = 0 #U 3rd is not resolved by backward movement
"Preleaped unresolved 4th" = 0 #U 4th is not resolved by backward movement, but it has a greater leap as neighbour
"Unresolved 4th"           = 0 #U 4th is not resolved by backward movement
Preleaped unresolved >4th  = 0 #U Leap longer than 4th is not resolved by backward movement, but it has a greater leap as neighbour
Prefilled unresolved >4th  = 0 #U Leap longer than 4th is not resolved by backward movement, but it was filled before
"G-C before cadence"       = 0 #L G note goes to C note before final cadence
"Early-late filled 3rd"    = 0 #U 3rd is not filled or prefilled, but it is filled somewhere else in the melody
"Early-late filled 4th"    = 0 #U 4th is not filled or prefilled, but it is filled somewhere else in the melody
"Unfilled 3rd"             = 0 #U 3rd is not filled
"Unfilled 4th"             = 0 #U 4th is not filled
"Consecutive leaps+"       = 0 #U More than cse_leaps2 consecutive leaps
"Start tonic unprepared"   = 0 #C If tonic is not the very first note, it has to be prepared with BD or GBD notes
Leap unresolved            = 0 #U Leap unresolved during two next steps (movement direction does not change)
Leap chain                 = 0 #U Chain of two leaps in one direction
Late >5th resolution       = 0 #U Leap greater than 5th is resolved after a second note
Tritone unresolved         = 0 #U Tritone is not resolved correctly
Tritone culmination        = 0 #U Tritone is the highest leap
"3rd to last is leading"   = 0 #C Third to last note is leading (B forbidden)
Too wide range             = 0 #CV If range is greater than max_interval (diatonic interval)
Too tight range            = 0 #CV If range is lower than min_interval (diatonic interval)

# Rule parameters
# Lower voice
harm_var = TS,DS,DT,S,DT,TS,D # Variants of possible harmonic meaning of each note
harm_const = T,DS,T,S,D,S,D # Constant harmonic meaning that is always possible for particular note (must be after harm_var)
# Higher voice
#harm_var = TS,DS,DST,S,DT,TS,DT # Variants of possible harmonic meaning of each note
#harm_const = TS,DS,T,S,DT,S,D # Constant harmonic meaning that is always possible for particular note (must be after harm_var)

fill_steps_mul = 2 # Multiply number of notes between leap notes to get steps for filling (+2)
max_smooth_direct = 5 # Maximum linear movement in one direction allowed (in steps)
max_smooth = 7 # Maximum linear movement allowed (in steps)
max_leaps = 2 # Maximum allowed max_leaps during max_leap_steps
max_leaps2 = 3 # Maximum allowed max_leaps2 during max_leap_steps for Many leaps+
cse_leaps = 2 # Maximum allowed consecutive leaps for Consecutive leaps
cse_leaps2 = 3 # Maximum allowed consecutive leaps for Consecutive leaps+
max_leap_steps = 7
stag_notes = 2 # Maximum allowed stag_notes (same notes) during stag_note_steps
stag_note_steps = 7
repeat_steps = 8 # Prohibit repeating of 3 notes closer than repeat_steps between first notes (if beats are same)
first_steps_tonic = 3 # Number of first steps, which must contain tonic note (will increase by one if cantus is longer than 10 notes)

# Technical parameters
midifile_out_mul = 8 # All notes are made whole for midi export
show_severity = 1 # =1 to show severity in square brackets in comments to notes (also when exporting to MIDI file)
calculate_correlation = 0 # Enables correlation calculation algorithm. Slows down generation. Outputs to cf1-cor.csv
calculate_blocking = 1 # Enables blocking flags calculation algorithm. Slows down generation.
calculate_stat = 0 # Enables flag statistics calculation algorithm. Slows down generation.
late_require = 0 # Allow not-last scan window to have no needed tags, but no blocked tags. This calculation usually requires much more time
