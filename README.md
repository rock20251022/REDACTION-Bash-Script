# REDACTION-Bash-Script
command line redaction script using sed and bash.
This project implements a command-line redaction tool using only bash and sed, as required. The script processes one or more input files and performs in-place redaction and formatting of sensitive information for municipal document release.

The program removes or standardizes:

Driver’s license numbers
Credit card numbers
Texas vehicle license plates
Placeholder values for date and municipality name
Files Included:
assign2.bash
Main executable script. Handles input files and invokes sed.
assign2.sed
Contains all redaction and substitution rules.

Usage:

Make the script executable:

chmod +x assign2.bash

Run the script with one or more files:

./assign2.bash file1.txt file2.txt

All changes are performed in-place, meaning the original files are modified directly.

Redaction Rules:
1. Driver’s License Numbers
Format: XXDL ######## or XX DL ########
Where:
XX = state code (2 letters)
######## = 6–8 digits
Output:
DL <redacted>
2. Credit Card Numbers

Supports:
Visa (16 digits, starts with 4)
MasterCard (16 digits, starts with 5)
American Express (15 digits, starts with 34 or 37)
Discover (16 digits, starts with 6)

Formats may include:
No separators
Hyphens (-)
Spaces

Output format:

VISA-1234
MC-5678
AMEX-0005
DISC-4321

(Only the last 4 digits are preserved.)

3. Texas License Plates

Supported formats:
6 alphanumeric characters (e.g., 64Q7JL, 64Q-7JL)
3 letters + 4 digits (e.g., RYD3792, RYD-3792)
Optional space after TX

Output:
TX <redacted>
4. Date Placeholder
<date> is replaced with the current system date in:
MM/DD/YYYY
5. Municipality Name Placeholder
<mname> is replaced with:
Township of Kier, Pennsylvania

Testing:

Example:

./assign2.bash test.txt

To verify output:

diff test.txt expected.txt

If there is no output from diff, the results match exactly.

Constraints:

This project strictly adheres to the following requirements:

Only bash and sed are used
No use of:
grep
awk
find
Python or other languages
Exactly one sed script
At most one sed invocation per file

Notes:
Extended regular expressions (-E) are used
In-place editing is performed using sed -i
A non-standard delimiter (|) is used for date substitution to avoid conflicts with /

Author:
Andrew Teran
