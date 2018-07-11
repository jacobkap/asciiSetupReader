# asciiSetupReader

# 1.5.0
+ Adds function to create sps setup files.
+ Adds option to not coerce potentially numeric columns into numeric type.

# 1.4.0
+ Adds capacity to the SPSS reader to handle Missing Values    
+ Fixes bug where function fails if no value-labels are detected
    + Applies both when setup file has no value-labels and if only select columns that have no value-labels    
+ Adds a huge number of tests    
+ Changes factor column to character columns
