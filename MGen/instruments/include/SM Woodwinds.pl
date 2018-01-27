# Samplemodeling Woodwinds

# Main
Type = 4 # Instrument type
poly = 1 # Maximum number of simultaneous voices

# Controls
Volume_default = 89 # default 127 (direct CC volume, should not be changed by user)
CC_Name = 11: "Dynamics"
CC_Name = 1:  "Vibrato intensity"
CC_Name = 19: "Vibrato speed"
CC_Name = 5: "Portamento time"
CC_Name = 24: "Harmonic structure"
CC_Name = 20: "Subharmonics" # Clarinet, Bass Clarinet, Oboe, English horn, Bassoon, Contrabassoon
CC_Name = 27: "PipeSplit" # Piccolo, Flute, Alto flute, Bass flute
CC_Name = 21: "Growl"
CC_Name = 23: "Flutter tongue"
CC_Name = 26: "Formant"
CC_Name = 25: "Breath noise"
CC_Name = 9: "Key noise"
CC_Name = 28: "Alt. fingering" # Piccolo, Flute, Alto flute, Bass flute
CC_Name = 8: "Dynamic pitch" # Clarinet, Bass Clarinet, Oboe, English horn, Bassoon, Contrabassoon 
CC_Name = 64: "Overblow on"
CC_Name = 31: "Microtuning on"

# Controls (need to map manually)
CC_Name = 12: "Reverb mix"
CC_Name = 7: "Volume"
CC_Name = 10: "Pan"

# Initial setup
InitCommand = "Flutter tongue: 0"
InitCommand = "Reverb mix: 0"

# Automation parameters
CC_dynamics = 11
CC_steps = 30 # Number of CC steps in one note step (please use only odd numbers)
CC_ma = 9 # Number of CC steps to moving average (please use only odd numbers)

# Nonlegato adaptor
all_ahead = 25 # Time in ms to stretch sutain notes (not legato) back to cope with slow attack
nonlegato_freq = 20 # Frequency (in percent) when legato can be replaced with non-legato by moving note end to the left
nonlegato_minlen = 400 # Minimum note length (in ms) allowed to convert to nonlegato
nonlegato_maxgap = 300 # Maximum gap between notes (in ms) introduced by automatic nonlegato 
nonlegato_mingap = 7 # Minimum distance between note ending and next note start to sound nonlegato
# For SM woodwinds real minimum distance for non-legato sample is 31 ms, but ahead is same for all and legato

# Retrigger adaptor
retrigger_freq = 50 # Percent to use non-legato when repeating notes
retrigger_min_len = 300 # Minimum next note length in ms to use retrigger
retrigger_rand_max = 300 # Maximum length in ms to move note end to the left in case of nonlegato retrigger
retrigger_rand_end = 40 # Maximum percent of note length to move note end to the left in case of nonlegato retrigger
retrigger_mingap = 30 # Minimum gap between notes to create during retrigger

# Bell adaptor
bell_mindur = 800 # Minimum note duration (ms) that can have a bell
bell_mul = 0.2-0.2 # Multiply dynamics by this parameter at bell start-end
bell_len = 30-30 # Percent of notelength to use for slope at bell start-end
bell_vel = 80-120 # Set belled note velocity to random between these percents of starting dynamics

# Reverse bell adaptor
rbell_freq = 80 # Frequency to apply reverse bell when all conditions met
rbell_dur = 1000-3000 # Minimum note duration (ms) that can have a reverse bell - that will have deepest reverse bell
rbell_mul = 0.9-0.2 # Multiply dynamics by this parameter at bell center with mindur - with longer dur
rbell_pos = 20-80 # Leftmost-rightmost minimum reverse bell position inside window (percent of window duration)

# Vibrato adaptor
CC_vib = 1 # CC number for vibrato intensity
CC_vibf = 19 # CC number for vibrato speed
vib_bell_top = 40-90 # Leftmost-rightmost maximum vibrato intensity position in note (percent of note duration)
vibf_bell_top = 20-60 # Leftmost-rightmost maximum vibrato speed in note (percent of note duration)
vib_bell_exp = 2 # Exponent to create non-linear bell shape
vibf_bell_exp = 2 # Exponent to create non-linear bell shape
vib_bell_freq = 100 # Frequency to apply vibrato bell when all conditions met
vib_bell_dur = 600-1200 # Minimum note duration (ms) that can have a vibrato bell - that can have highest vibrato bell
vib_bell = 30-90 # Maximum vibrato intensity in vibrato bell (for minimum and highest duration)
vibf_bell = 10-60 # Max vibrato frequency in vibrato bell (for minimum and highest duration)
rnd_vib = 100 # Randomize vibrato intensity not greater than this percent
rnd_vibf = 10 # Randomize vibrato speed not greater than this percent

# Randomization
rnd_vel = 20 # Randomize note velocity not greater than this percent
rnd_vel_repeat = 70 # Randomize note velocity not greater than this percent for note retriggers
rnd_dyn = 15 # Randomize step dynamics not greater than this percent
