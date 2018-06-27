include "include/CA2.pl"

# Analysis
Midi_file = "midi\Counterpoint\test\test-alterint.mid" # Path and file name of imported midi file

corrections = 1 # Number of corrections to show. Set to 0 to disable corrections. Does not work for swa.
max_correct_ms = 2000 # Maximum time in milliseconds to correct using window-scan (set to 0 to scan up to the end)
cor_ack = 1 # Acknowledge correction results by running both algorithms: SAS and ASWA
animate = 0 # Draw animation of preliminary result every X ms (0 to show each change, high to disable animation)
animate_delay = 0 # Delay in ms after each animation step
