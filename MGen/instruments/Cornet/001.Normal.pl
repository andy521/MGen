include "..\include\SM Brass.pl"

# Main
library = Samplemodeling Trumpet v3 # For which library algorithm is optimized

# Initial setup

# Initial setup (can change)

# Instrument parameters
n_min = E3 # Lowest note
n_max = G6 # Highest note
t_min = 20 # Shortest note in ms
t_max = 10000 # Longest note without pauses in ms (0 = no limit). Decreases with dynamics
#leap_t_min = 100 # Shortest note after leap in ms

# Legato adaptor
legato_ahead = 700 # Time in ms to stretch legato notes back to cope with legato delay
ks1 = 36 # First keyswitch position

# Mute adaptor
mute_import = 0 # Set to 0 to ignore mutes in source MIDI file and play as normal notes

# Note ending adaptor
end_sfl_dur = 140 # Duration of short fall ending
end_sfl_freq = 0 # Frequency of short fall ending
end_pbd_dur = 200 # Duration of pitch bend down ending
end_pbd_freq = 0 # Frequency of pitch bend down ending
end_vib2_dur = 240 # Duration of vibrato ending2
end_vib2_freq = 20 # Frequency of vibrato ending2
end_vib_dur = 445 # Duration of vibrato ending
end_vib_freq = 20 # Frequency of vibrato ending
