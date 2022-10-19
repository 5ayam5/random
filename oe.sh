function o() {
    xdg-open "$*"
}

function oe() {
    o "$*" && return
}

function codeE() {
    cd "$*" && code . && return
}

function pandocpdf() {
    [ "$*.md" -nt "$*.pdf" ] && pandoc "$*.md" -s -o "$*.pdf"
}

function list_notes() {
    if [ "$#" -ne 1 ]; then
        echo "Missing arguments"
        echo "Required: <course name>"
        return 0
    fi
    dir=`find "IITD Material/" -maxdepth 2 -type d -name $1`
    test -e "$dir" || return 1
    mkdir -p "$dir/Notes/"
    echo `find "$dir/Notes/" -type f -name "*.md" | sed 's@.*/@@' | sed 's@\..*@@'`
}

function edit_notes() {
    if [ "$#" -ne 2 ]; then
        echo "Missing arguments"
        echo "Required: <course name> <lecture number>"
        return 0
    fi
    dir=`find "IITD Material/" -maxdepth 2 -type d -name $1`
    test -e "$dir" || return 1
    mkdir -p "$dir/Notes/"
    test -e "$dir/Notes/L$2.md" || cp "IITD Material/notes_template.md" "$dir/Notes/L$2.md"
    vim "$dir/Notes/L$2.md"
    pandocpdf "$dir/Notes/L$2"
}

function view_notes() {
    if [ "$#" -ne 2 ]; then
        echo "Missing arguments"
        echo "Required: <course name> <lecture number>"
        return 0
    fi
    dir=`find "IITD Material/" -maxdepth 2 -type d -name $1`
    test -e "$dir" || return 1
    mkdir -p "$dir/Notes/"
    o "$dir/Notes/L$2.pdf"
}

function goto_course() {
    if [ "$#" -ne 1 ]; then
        echo "Missing arguments"
        echo "Required <course name>"
        return 0
    fi
    dir=`find "IITD Material/" -maxdepth 2 -type d -name "$1"`
    cd "$dir"
}
