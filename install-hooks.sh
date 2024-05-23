#!/bin/bash

cd .git/hooks
if [ ! -f pre-commit ]; then
    cat << 'EOF' > pre-commit
#!/bin/sh

if git grep --cached -q 'TODO'; then
    echo 'Your commit contains TODO comments. Resolve them before committing.'
    exit 1
fi

EOF
chmod +x pre-commit
fi
