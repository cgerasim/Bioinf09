## How the Script Works

1. Folder Preparation
   The script begins by creating two folders named `phread33` and `phread64` if they don't already exist. These will be used to store the classified files.

2. Defining a Function to Get Minimum ASCII Value 
   A function is defined that scans a FASTQ file and extracts all the quality lines — these are every fourth line in the file.  
   It reads each character in those lines and determines the smallest (minimum) ASCII value found among them.

3. Reading Quality Scores
   The function reads only the quality lines using a filter that selects every fourth line. Then, it goes through each character of those lines and converts it to its ASCII number.

4. Determining the Encoding  
   - If the smallest ASCII value found in the file is less than 64, the file is assumed to be using **Phred+33** encoding.  
   - If the minimum ASCII value is 64 or greater, it's considered **Phred+64**.

5. Moving the Files
   Based on the encoding detected, the script moves the file into either the `phread33` folder or the `phread64` folder.

6. Processing All Files 
   This process repeats for every `.fastq` file in the directory, classifying and moving each one accordingly.
