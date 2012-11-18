product(){
    name=$1
    cd $(printf "%s\n" ~/code/products/*/*/* | # products tree
        grep -v /arc/ |                        # remove arc dirs from list
        grep "/$name""[^/]*\$" |               # leave only matching folders
        head -n1                               # leave just one line
    )
}

_product(){
    completions=($(printf "%s\n" ~/code/products/*/*/* | # products tree
        grep -v /arc/ |                                  # remove arc dirs from list
        sed "s/.*\///"                                   # leave only names
    ))
    compadd $completions
}
compdef _product product

p(){
    name=$1
    cd $(printf "%s\n" ~/code/products/*/$(date +%Y)/* | # products tree 
                                                         # for the last year
        grep -v /arc/ |                                  # remove arc dirs from list
        grep "/$name""[^/]*\$" |                         # leave only matching folders
        head -n1                                         # leave just one line
    )
}

_p(){
    completions=($(printf "%s\n" ~/code/products/*/$(date +%Y)/* | # products tree
        grep -v /arc/ |                                            # remove arc dirs from list
        sed "s/.*\///"                                             # leave only names
    ))
    compadd $completions
}
compdef _p p
