# Main
library = Samplemodeling Trumpet v3 # For which library algorithm is optimized
Type = 2 # Instrument type

# Instrument parameters
n_min = E3 # Lowest note
n_max = G6 # Highest note
t_min = 50 # Shortest note in ms
t_max = 12000 # Longest melody without pauses in ms (0 = no limit). Decreases with dynamics
poly = 1 # Maximum number of simultaneous voices
leap_t_min = 100 # Shortest note after leap in ms

# Automation parameters
CC_dynamics = 11
CC_dyn_ma = 1 # If we should use moving average to smooth CC dynamics curve before sending
CC_steps = 7 # Number of CC steps in one note step (please use only odd numbers)

# Legato adaptor
legato_ahead = 700 # Time in ms to stretch legato notes back to cope with legato delay
max_ahead_note = 16 # Maximum chromatic interval having ahead property
gliss_freq = 40 # Frequency of gliss articulation in percent

# Nonlegato adaptor
nonlegato_freq = 13 # Frequency (in percent) when legato can be replaced with non-legato by moving note end to the left
nonlegato_minlen = 200 # Minimum note length (in ms) allowed to convert to nonlegato

# Bell adaptor
bell_mindur = 300 # Minimum note duration (ms) that can have a bell
bell_start_mul = 0.2 # Multiply dynamics by this parameter at bell start
bell_end_mul = 0.2 # Multiply dynamics by this parameter at bell end
bell_start_len = 30 # Percent of notelength to use for slope at bell start
bell_end_len = 30 # Percent of notelength to use for slope at bell end

# This is not working yet
CC_vib_intens = 1
CC_vib_speed = 14
