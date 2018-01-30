include "..\include\Embertone IS.pl"

# Main
library = "Friedlander Violin 1.5" # For which library algorithm is optimized

# Instrument parameters
n_min = G3 # Lowest note
n_max = F7 # Highest note
t_min = 12 # Shortest note in ms
t_max = 0 # Longest melody withot pauses in ms (0 = no limit). Decreases with dynamics
#leap_t_min = 100 # Shortest note after leap in ms

# Controls
CC_Name = 59: "Transition speed"
CC_Name = 66: "Bow position"
CC_Name = 67: "Slur"
CC_Name = 80: "Portamento speed" # Used only when enabled Portamento CC mode on. Not working
CC_Name = 87: "Rebow on"

# These controls should be mapped manually
CC_Name = 20: "Retrigger on" # All except Cello
CC_Name = 16: "Portamento CC mode on" # All except Cello

KswGroup = "G#2: Slur while held"
KswGroup = "E2: Ghost note"
KswGroup = "F2: Color on", "F#2: Color off"
KswGroup = "C3: Con sordino", "C#3: Senza sordino"
KswGroup = "D3: Normal", "D#3: Sul ponticello", "E3: Sul tasto" # Bow position
KswGroup = "F3: Legato", "F#3: Poly"
KswGroup = "G2: Sustain", "A2: Staccato", "A#2: Pizzicato", "B2: Tremolo" # Style

# Seems that vibrato styles cannot be selected with CC or keyswitch (bug?)
CC_Name = 2:  "Vibrato style"
KswGroup = "B0: Vibrato style - Default"
KswGroup = "C1: Vibrato style - Progressive"
KswGroup = "C#1: Vibrato style - Open string"
KswGroup = "D1: Vibrato style - Gentle"
KswGroup = "D#1: Vibrato style - Passionate"

# Techniques mapping to commands
Technique = "con sord; Con sordino"
Technique = "ord; Senza sordino + Normal + Sustain"
Technique = "nat; Senza sordino + Normal + Sustain"
Technique = "senza sord; Senza sordino"
Technique = "sul pont; Sul ponticello"
Technique = "sul tast; Sul tasto"
Technique = "stac; Staccato"
Technique = "spic; Staccato"
Technique = "martele; Staccato"
Technique = "saltando; Staccato"
Technique = "sautille; Staccato"
Technique = "arco; Sustain"
Technique = "pizz; Pizzicato"
Technique = "trem; Tremolo"

# Initial setup
InitCommand = "Responsiveness: 0" # default for Violin: 0
InitCommand = "Portamento speed: 11" # Use only when enabled Portamento CC mode on
InitCommand = "Dynamic KSW threshold: 100"
InitCommand = "Shorts length control on: 0"
InitCommand = "Portamento CC mode on: 0"
InitCommand = "Portamento velocity threshold: 18"
InitCommand = "Vibrato style - Progressive"
InitCommand = "Color off"
InitCommand = "Transition speed lower: 16"
InitCommand = "Transition speed upper: 90"
InitCommand = "Transition speed: 127"
InitCommand = "Retrigger on" # default for Violin: 0
InitCommand = "Legato"

# Initial setup (can change)
InitCommand = "Ensemble intonation: 20" # default 13
InitCommand = "Ensemble L: 40" # default 10
InitCommand = "Ensemble R: 87" # default 117
InitCommand = "Ensemble tightness: 65" # default 18
InitCommand = "Ensemble randomize: 100" # default 43
InitCommand = "Ensemble combine transitions" # default 0
InitCommand = "Solo intonation: 2"
InitCommand = "Rebow on" # default for Violin: 0
InitCommand = "Release samples on"
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

# Nonlegato adaptor
all_ahead = 54 # Time in ms to stretch sutain notes (not legato) back to cope with slow attack
nonlegato_freq = 20 # Frequency (in percent) when legato can be replaced with non-legato by moving note end to the left
nonlegato_minlen = 600 # Minimum note length (in ms) allowed to convert to nonlegato
nonlegato_maxgap = 300 # Maximum gap between notes (in ms) introduced by automatic nonlegato 

# Staccato adaptor
stac_auto = 1 # Set to 0 to disable automatic staccato articulations
stac_ahead = -1 # Time in ms to stretch stac notes back to cope with slow attack. -1 falls back to all_ahead
stac_dynamics = 50 # Percent of staccato dynamics compared to sustain notes
stac_dyn_add = 0 # Add minimum dynamics after multiplying
spic_import = 1 # Allow to import spiccato technique from midi file into staccato articulation
stac_import = 1 # Set to 0 to ignore staccato in source MIDI file and play as normal notes. Set to 1 to import as staccato
marc_import = 1 # Set to 0 to ignore marcato in source MIDI file and play as normal notes. Set to 1 to import as staccato

# Sul tasto adaptor
tasto_import = 1 # Set to 0 to ignore sul tasto in source MIDI file and play as normal notes
bow_lock = 0 # 0 - do not lock bow, 1 - always sul tasto, 2 - always sul ponticello

# Pizzicato adaptor
pizz_import = 1 # Set to 0 to ignore pizzicato in source MIDI file and play as normal notes
pizz_ahead = -1 # Time in ms to stretch pizz notes back to cope with slow attack. -1 falls back to all_ahead
pizz_dynamics = 60 # Percent of staccato dynamics compared to sustain notes
pizz_dyn_add = 0 # Add minimum dynamics after multiplying

# Tremolo adaptor
trem_import = 1 # Set to 0 to ignore tremolo keyswitches and program changes in source MIDI file and play as normal notes

# Transition types
vel_harsh = 118 # Velocity equal or above this value triggers harsh sustain
vel_immediate = 84 # Velocity equal or above this value triggers immediate sustain
vel_normal = 50 # Velocity equal or above this value triggers normal sustain
vel_gliss = 18 # Velocity below this value triggers glissando transition
vel_normal_minlen = 600 # Minimum note length (ms) that can have a normal or lower sustain
harsh_freq = 100 # Frequency of harsh sustain articulation in percent of all possible situations

# Gliss adaptor
gliss_minlen = 1000 # Minimum note length that can have a gliss transition
gliss_freq = 0 # Frequency of gliss articulation in percent

