#Main
Library = "Embertone Intimate Strings" # For which library algorithm is optimized
Type = 1 # Instrument type

# Instrument parameters
poly = 1 # Maximum number of simultaneous voices

# Controls
Volume_default = 127 # default 127 (direct CC volume, should not be changed by user)
CC_Name = 1:  "Vibrato intensity"
CC_Name = 11: "Dynamics"
CC_Name = 14: "Vibrato speed"
CC_Name = 50: "Reverb level"
CC_Name = 51: "Bow noise reduction"
CC_Name = 52: "Transition attenuation"
CC_Name = 53: "Round-robin on"
CC_Name = 54: "Responsiveness"
CC_Name = 55: "Ensemble on"
CC_Name = 56: "Ensemble combine transitions"
CC_Name = 57: "Ensemble tightness"
CC_Name = 58: "Ensemble randomize"

# Map ensemble controls manually if you plan to use Ensemble mode
CC_Name = 3:  "Ensemble intonation"
CC_Name = 4:  "Ensemble L"
CC_Name = 19:  "Ensemble R"

# These controls should be mapped manually
CC_Name = 6:  "Transition speed lower"
CC_Name = 8:  "Transition speed upper"
CC_Name = 9:  "Solo intonation"
CC_Name = 13: "Shorts length control on"
CC_Name = 15: "Release samples on"
CC_Name = 17: "Portamento velocity threshold"
CC_Name = 18: "Dynamic KSW threshold"

# Techniques mapping to commands
Technique = "solo; Ensemble on: 0"
Technique = "tutti; Ensemble on" # Tutti mode in Viola requires gliss_freq=0 due to bug in virtual instrument. In Violin and Cello, setting gliss_freq to 10 or 0 is recommended

# Initial setup
InitCommand = "Reverb level: 0" # default: enabled

# Initial setup (can change)
InitCommand = "Transition attenuation: 0"
InitCommand = "Bow noise reduction: 0"
InitCommand = "Round-robin on"
InitTechnique = "solo"
Pan = 50 # default 50 (maximum left, 50 - default position, 100 - maximum right)
Volume = 100 # default 100 (relative volume from 0 to 100)

# Automation parameters
CC_dynamics = 11
CC_ma = 9 # Number of CC steps to moving average (please use only odd numbers)
CC_steps = 30 # Number of CC steps in one note step (please use only odd numbers)

# Staccato adaptor
stac_maxlen = 400 # Maximum note length (ms) to be converted to staccato in case of non-legato on both sides
stac_dynamics = 50 # Percent of staccato dynamics compared to sustain notes

# Vibrato adaptor
CC_vib = 1 # CC number for vibrato intensity
CC_vibf = 14 # CC number for vibrato speed

# Bell adaptor
bell_mindur = 7000 # Minimum note duration (ms) that can have a bell
bell_mul = 0.8-0.2 # Multiply dynamics by this parameter at bell start-end
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

