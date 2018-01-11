include "..\include\Embertone IS.pl"

# Main
library = "Blakus Cello 1.0" # For which library algorithm is optimized

# Instrument parameters
n_min = C2 # Lowest note
n_max = C6 # Highest note
t_min = 100 # Shortest note in ms
t_max = 0 # Longest melody withot pauses in ms (0 = no limit). Decreases with dynamics
#leap_t_min = 100 # Shortest note after leap in ms

# Controls
CC_Name = 59: "Transition speed"
#CC_Name = 66: "Bow position"
CC_Name = 67: "Slur"
CC_Name = 80: "Portamento speed" # Used only when enabled Portamento CC mode on.
#CC_Name = 87: "Rebow on"

# These controls should be mapped manually
#CC_Name = 20: "Retrigger on" # All except Cello
#CC_Name = 16: "Portamento CC mode on" # All except Cello

#KswGroup = "F2: Color on", "F#2: Color off"
KswGroup = "C#1: Slur while held"
KswGroup = "B1: Ghost note"
KswGroup = "F1: Normal", "F#1: Con sordino", "G1: Sul ponticello", "G#1: Sul ponticello con sordino"
KswGroup = "A1: Legato", "A#1: Poly"
KswGroup = "C1: Sustain", "D1: Staccato", "D#1: Pizzicato", "E1: Tremolo" # Style

# Seems that vibrato styles cannot be selected with CC or keyswitch (bug?)
CC_Name = 2:  "Vibrato style"
KswGroup = "G0: Vibrato style - Default"
KswGroup = "G#0: Vibrato style - Progressive"
KswGroup = "A0: Vibrato style - Open string"
KswGroup = "A#0: Vibrato style - Gentle"
KswGroup = "B0: Vibrato style - Passionate"

# Techniques mapping to commands
Technique = "con sord; Con sordino"
Technique = "ord; Normal + Sustain"
Technique = "nat; Normal + Sustain"
Technique = "senza sord; Normal"
Technique = "sul pont; Sul ponticello"
#Technique = "sul tast; Sul tasto"
Technique = "stac; Staccato" # TODO: not implemented yet
Technique = "spic; Staccato" # TODO: not implemented yet
Technique = "martele; Staccato" # TODO: not implemented yet
Technique = "saltando; Staccato" # TODO: not implemented yet
Technique = "sautille; Staccato" # TODO: not implemented yet
Technique = "arco; Sustain" # TODO: not implemented yet
Technique = "pizz; Pizzicato" # TODO: not implemented yet
Technique = "trem; Tremolo" # TODO: not implemented yet

# Initial setup
InitCommand = "Ensemble intonation: 20" # default 15
InitCommand = "Ensemble L: 40" # default 0
InitCommand = "Ensemble R: 87" # default 127
InitCommand = "Ensemble tightness: 65" # default 28
InitCommand = "Ensemble randomize: 100" # default 41
InitCommand = "Ensemble combine transitions" # default 0
InitCommand = "Transition speed lower: 16"
InitCommand = "Transition speed upper: 49"
InitCommand = "Transition speed: 76"
InitCommand = "Solo intonation: 2"
InitCommand = "Responsiveness: 0" # default 0
InitCommand = "Dynamic KSW threshold: 100"
InitCommand = "Shorts length control on"
InitCommand = "Release samples on"
InitCommand = "Portamento velocity threshold: 8"
InitCommand = "Vibrato style - Progressive"
InitCommand = "Legato"
InitTechnique = "ord"

# Retrigger adaptor
CC_retrigger = 64 # This CC will be set before note retriger and reset soon after
retrigger_freq = 50 # Percent to use CC retrigger instead of non-legato when repeating notes
retrigger_min_len = 600 # Minimum next note length in ms to use retrigger
retrigger_rand_max = 300 # Maximum length in ms to move note end to the left in case of nonlegato retrigger
retrigger_rand_end = 50 # Maximum percent of note length to move note end to the left in case of nonlegato retrigger

# Slur adaptor
max_slur_count = 2 # Use slur for 2nd moves, but no longer than X moves
max_slur_interval = 2 # in semitones

# Legato adaptor
legato_ahead = 165 # Time in ms to stretch legato notes back to cope with legato delay
max_ahead_note = 12 # Maximum chromatic interval having ahead property
all_ahead = 128 # Time in ms to stretch sutain notes (not legato) back to cope with slow attack

# Nonlegato adaptor
nonlegato_freq = 20 # Frequency (in percent) when legato can be replaced with non-legato by moving note end to the left
nonlegato_minlen = 600 # Minimum note length (in ms) allowed to convert to nonlegato
nonlegato_maxgap = 300 # Maximum gap between notes (in ms) introduced by automatic nonlegato 

# Transition types
vel_harsh = 90 # Velocity equal or above this value triggers harsh sustain
vel_immediate = 60 # Velocity equal or above this value triggers immediate sustain
vel_normal = 50 # Velocity equal or above this value triggers normal sustain
vel_gliss = 8 # Velocity below this value triggers glissando transition
vel_normal_minlen = 600 # Minimum note length (ms) that can have a normal or lower sustain
harsh_freq = 0 # Frequency of harsh sustain articulation in percent of all possible situations

# Gliss adaptor
gliss_minlen = 1000 # Minimum note length that can have a gliss transition
gliss_freq = 50 # Frequency of gliss articulation in percent

# Bell adaptor
bell_mindur = 700 # Minimum note duration (ms) that can have a bell
bell_mul = 0.2-0.2 # Multiply dynamics by this parameter at bell start-end
bell_len = 30-30 # Percent of notelength to use for slope at bell start-end

# Reverse bell adaptor
rbell_freq = 80 # Frequency to apply reverse bell when all conditions met
rbell_dur = 300-1000 # Minimum note duration (ms) that can have a reverse bell - that will have deepest reverse bell
rbell_mul = 0.8-0.2 # Multiply dynamics by this parameter at bell center with mindur - with longer dur
rbell_pos = 20-80 # Leftmost-rightmost minimum reverse bell position inside window (percent of window duration)

# Vibrato adaptor
vib_bell_top = 10-90 # Leftmost-rightmost maximum vibrato intensity in note (percent of note duration)
vibf_bell_top = 10-90 # Leftmost-rightmost maximum vibrato speed in note (percent of note duration)
vib_bell_exp = 2 # Exponent to create non-linear bell shape
vibf_bell_exp = 2 # Exponent to create non-linear bell shape
vib_bell_freq = 100 # Frequency to apply vibrato bell when all conditions met
vib_bell_dur = 600-1200 # Minimum note duration (ms) that can have a vibrato bell - that can have highest vibrato bell
vib_bell = 30-90 # Maximum vibrato intensity in vibrato bell (for minimum and highest duration)
vibf_bell = 20-80 # Max vibrato frequency in vibrato bell (for minimum and highest duration)
rnd_vib = 10 # Randomize vibrato intensity not greater than this percent
rnd_vibf = 10 # Randomize vibrato speed not greater than this percent

# Randomization
rnd_vel = 8 # Randomize note velocity not greater than this percent
rnd_dyn = 8 # Randomize step dynamics not greater than this percent