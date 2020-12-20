#!/bin/bash

# The Makefile has trouble processing the single/double quote marks in the .sh file below, which is why these lines have been commented out; 
# "rm -f" is therefore used (instead of "rm") in order to suppress the error messages caused by attempting to delete non-existent files

# Before rebuilding the prop files, should delete any existing files in case the project is being re-compiled 
# (otherwise, the files will be appended instead of replaced / rebuilt)

while IFS=, read -r offset size input_filename output_filename insert_bitmap_header bitmap_header_filename image_width_hex image_height_hex
do
    #if test -f "$input_filename"; then
        rm -f $input_filename
        #echo "Deleted $input_filename"
    #fi
done < gzipped_images.csv

while IFS=, read -r offset input_filename output_filename
do
    dd bs=1 skip=$offset if=$input_filename | cat >> $output_filename
done < prop_files_to_merge.csv

