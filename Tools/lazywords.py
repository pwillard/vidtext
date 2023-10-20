import sys

# Check for the correct number of command-line arguments
if len(sys.argv) != 2:
    print("Usage: python Lazywords.py <input_file>")
    print("The first word in the file is the variable name.")
    sys.exit(1)

# Get the input file from the command-line argument
input_file = sys.argv[1]

# Read words from the input file
with open(input_file, "r") as file:
    first_word = file.readline().strip()
    words = [line.strip() for line in file]

# Open a file in UGBASIC format for writing
with open("UGBASIC_array.bas", "w") as UGBASIC_file:
    # Initialize UGBASIC array and loop through words
    for i, word in enumerate(words):
        UGBASIC_line = f'{first_word}$({i}) = "{word}"\n'
        UGBASIC_file.write(UGBASIC_line)

print("UGBASIC array entries written to UGBASIC_array.bas")