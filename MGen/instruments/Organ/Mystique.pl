# Main
Library = ProjectSAM Organ Mystique - Large Organ # For which library algorithm is optimized
Type = 0 # Instrument type

# Instrument parameters
n_min = C2 # Lowest note
n_max = F6 # Highest note
t_min = 20 # Shortest note in ms
t_max = 0 # Longest melody withot pauses in ms (0 = no limit). Decreases with dynamics
poly = 100 # Maximum number of simultaneous voices
#leap_t_min = 1 # Shortest note after leap
#dying = 5 # Seconds to fade out at mf
Volume = 100

# Lengroup adaptor
lengroup2 = 30 # Percent of grouping notes into groups of 2
lengroup3 = 30 # Percent of grouping notes into groups of 3
lengroup4 = 30 # Percent of grouping notes into groups of 4
lengroup_edt1 = 70 # delta to alter note ending time of all notes in group except for the last (ms)
lengroup_edt2 = -100 # delta to alter note ending time of last note in group (ms)

# Randomization
rand_pos = 8-8 # Randomize note starts-ends not greater than percent of note length 
rand_pos_max = 70-70 # Maximum shift in ms (start-end)
rnd_vel = 8 # Randomize note velocity not greater than this percent

# Delay adaptor
all_ahead = 70 # Time in ms to stretch sutain notes (not legato) back to cope with slow attack
