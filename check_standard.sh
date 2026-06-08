#!/usr/bin/env bash
#
# check_standard.sh
# -----------------
# Scans every .html, .css and .js file in the project for code patterns that
# are ABOVE the level defined in CODING_STANDARD.md. Each match is printed as
# file:line, and the script exits with code 1 if anything was found (so it can
# be used in GitHub Actions and as a pre-push check).
#
# IMPORTANT: This only flags techniques we have not learned in class. It does
# NOT prove code is correct, good, or "human-written". The real check is that
# you can explain every line you commit.
#
# Run it from the project folder:   bash check_standard.sh

set -u

# Collect the files we care about. The -print0 / read -d '' combo handles
# folder names that contain spaces (like "Code Standard").
FILES=()
while IFS= read -r -d '' f; do
  FILES+=("$f")
done < <(find . -type f \( -name '*.html' -o -name '*.css' -o -name '*.js' \) -not -path './.git/*' -print0)

if [ ${#FILES[@]} -eq 0 ]; then
  echo "No .html / .css / .js files found to check."
  exit 0
fi

violations=0

# check <regex> <message>
# Prints every line in any file that matches the regex.
check() {
  pattern="$1"
  message="$2"
  # /dev/null forces grep to always print the filename, even with one file.
  matches=$(grep -EnI "$pattern" "${FILES[@]}" /dev/null)
  if [ -n "$matches" ]; then
    echo "X  ABOVE OUR LEVEL: $message"
    printf '%s\n' "$matches" | sed 's/^/       /'
    echo
    violations=$((violations + 1))
  fi
}

echo "Checking code against CODING_STANDARD.md ..."
echo

# ---------- JavaScript ----------
check '=>'                                   'Arrow functions ( => ). Use a normal function() instead.'
check 'addEventListener'                     'addEventListener(). Use inline onclick / onchange in the HTML.'
check 'querySelector'                        'querySelector / querySelectorAll. Use document.getElementById.'
check '\bfetch[[:space:]]*\('               'fetch(). We do not do AJAX / network calls in JavaScript.'
check 'XMLHttpRequest'                       'XMLHttpRequest. We do not do AJAX in JavaScript.'
check '\b(async|await)\b'                    'async / await. We have not learned asynchronous JavaScript.'
check '\.(map|filter|forEach|reduce)[[:space:]]*\(' 'Array methods (.map/.filter/.forEach/.reduce). Use a for...of loop.'
check '(createElement|appendChild|innerHTML)' 'Building DOM in JS (createElement/appendChild/innerHTML). Write the HTML directly.'
check 'JSON\.(parse|stringify)'              'JSON.parse / JSON.stringify. We do not handle JSON.'
check '^[[:space:]]*(import|export)[[:space:]]' 'import / export modules. Not used in our project.'
check '`'                                    'Backtick template strings. Join text with + instead.'
check '\bclass[[:space:]]+[A-Za-z_$][A-Za-z0-9_$]*[[:space:]]*(\{|extends)' 'JavaScript class declaration. We do not use classes.'

# ---------- CSS ----------
check 'display[[:space:]]*:[[:space:]]*(flex|inline-flex)' 'Flexbox (display:flex). We have not learned it.'
check 'display[[:space:]]*:[[:space:]]*grid'              'CSS Grid (display:grid). We have not learned it.'
check 'position[[:space:]]*:[[:space:]]*(absolute|relative|fixed|sticky)' 'CSS position. We have not learned positioning.'
check '@media'                                            'Media queries (@media). No responsive breakpoints.'
check '(@keyframes|animation[[:space:]]*:|transition[[:space:]]*:|transform[[:space:]]*:)' 'CSS animation/transition/transform. Not learned.'
check '(var[[:space:]]*\([[:space:]]*--|--[a-zA-Z][a-zA-Z0-9-]*[[:space:]]*:)' 'CSS variables (--name / var()). Not learned.'
check '\bcalc[[:space:]]*\('                               'calc(). Not learned.'
check '::(before|after)'                                   'Pseudo-elements ::before / ::after. Not learned.'
check '(@import|@font-face)'                               'Importing fonts/files in CSS. Not learned.'

# ---------- HTML ----------
check '<(header|nav|main|footer|article|aside)\b' 'Semantic layout tags. Use <div> or <section> instead.'
check '\baria-'                                    'aria-* accessibility attributes. Not learned.'
check '\brole[[:space:]]*='                        'role= attribute. Not learned.'
check '\bdata-[a-zA-Z]'                            'data-* attributes. Not learned.'
check '<(canvas|svg|video|audio)\b'                'Media/graphics elements (canvas/svg/video/audio). Not learned.'

# ---------- Design / look (see DESIGN_STANDARD.md) ----------
check '(linear-gradient|radial-gradient|conic-gradient)' 'Gradients. Use a single flat colour (DESIGN_STANDARD.md).'
check 'fonts\.(googleapis|gstatic)\.com'         'Google Fonts. Use default system fonts only.'
check '(bootstrap|tailwind|bulma|materialize|font-?awesome)' 'A CSS framework / icon library. We write plain CSS only.'
check '(cdn\.jsdelivr|cdnjs\.cloudflare|unpkg\.com)' 'A CDN library link. Not allowed - plain CSS only.'
check '<link[^>]+href[[:space:]]*=[[:space:]]*["'"'"']https?://' 'External stylesheet from the internet. Use our own style.css only.'

echo "-----------------------------------------"
if [ "$violations" -eq 0 ]; then
  echo "OK  All clear - code matches our skill level."
  exit 0
else
  echo "X   Found $violations type(s) of code above our level (listed above)."
  echo "    Simplify them before committing, or ask the group first."
  exit 1
fi
