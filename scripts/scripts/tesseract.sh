#!/bin/bash

# Take screenshot
screencapture -i -t png -r /tmp/ocr_temp.png

# Check if screenshot was taken (user might have cancelled)
if [ -f /tmp/ocr_temp.png ]; then
    # Run OCR and copy to clipboard
    tesseract /tmp/ocr_temp.png stdout -l eng --psm 6 --oem 3 | pbcopy
    
    # Clean up
    rm /tmp/ocr_temp.png
    
    osascript -e 'display notification "Text copied to clipboard" with title "OCR Complete"'
fi
