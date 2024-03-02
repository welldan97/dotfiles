#!/bin/bash

set -eEo pipefail
# air 2880 × 1800 x 48
width=3456
width=2880
height=2234
height=1800
topbar_height=76
topbar_height=48
ratio1="50,50"
ratio2="100x0"

get_contrast_color() {
    color="$1"             # Replace with your background color in hexadecimal format
    contrast_threshold=128 # Adjust this threshold as needed (0-255)

    # Convert the background color to RGB components
    background_r=$(convert xc:"$color" -format "%[fx:int(255*r+.5)]" info:)
    background_g=$(convert xc:"$color" -format "%[fx:int(255*g+.5)]" info:)
    background_b=$(convert xc:"$color" -format "%[fx:int(255*b+.5)]" info:)

    # Calculate the contrast value (brightness) for the background color
    contrast_value=$(echo "scale=2; (${background_r}*299 + ${background_g}*587 + ${background_b}*114) / 1000" | bc)

    # Determine the contrasting color (black or white)
    if (($(echo "$contrast_value > $contrast_threshold" | bc -l))); then
        echo "0,0,0"
    else
        echo "255,255,255"
    fi
}

#!/bin/bash

annotate() {
    font="Helvetica-Bold"
    text_size=1440
    text="$1"
    image="$2"
    text_color="$3"
    convert "$image" -fill "rgba(${text_color},0.5)" -font "$font" -pointsize "$text_size" -gravity Center -annotate +0+0 "$text" "with_text.png"
}

main() {
    for i in {0..15}; do
        echo "Processing wallpaper ${i}"

        mkdir -p "result"
        image_file="source/${i}.png"
        result_file="result/${i}.png"
        color=$(jq -r ".colors[${i}]" colors.json)
        contrast_color=$(get_contrast_color "${color}")

        convert "${image_file}" -resize "${width}x${height}^" -gravity center -extent "${width}x${height}" "resized.png"
        annotate "$((i + 1))" "resized.png" "${contrast_color}"
        convert -size "${width}x${topbar_height}" xc:"${color}" stripe.png

        convert "with_text.png" stripe.png -geometry +0+0 -composite with_stripe.png

        convert "with_stripe.png" \
            \( +clone -fill "${color}" -colorize 100% \) \
            -compose blend -define "compose:args=${ratio1}" -composite \
            "first_blend.png"

        composite -blend "${ratio2}" "first_blend.png" "resized.png" "${result_file}"

        rm resized.png with_stripe.png stripe.png first_blend.png with_text.png
    done
}

main
