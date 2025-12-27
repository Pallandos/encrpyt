#!/usr/bin/env bash
# Author : Pallandos
# -------------------------------------------------------
# encrypt.sh
#
# Usage: 
#   ./encrypt.sh [-p <pass_file>] -f <file_pattern>
#       -f : pattern from files to encrypt
#       -p : path to your passphrase file       
#
# Example:
#   ./encrypt -p pass.txt -f "*.tar.gz"
#
# -------------------------------------------------------

set -euo pipefail
# cd "$(dirname "${BASH_SOURCE[0]}")"

######################################
# ====== Constants and variables =====
######################################

GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[0;33m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

PASS_FILE=""

# ---- Helpers ----
error_exit() { # print an error message and exit
    echo -e "${RED}ERROR: $1${NC}" >&2
    exit 1
}

print_info() { # print an info message
    echo -e "${CYAN}INFO: $1${NC}"
}

print_warning() { # print a warning message
    echo -e "${YELLOW}WARNING: $1${NC}" >&2
}

print_success() { # print a success message
    echo -e "${GREEN}SUCCESS: $1${NC}"
}

######################################
# ============ Functions =============
######################################

encrypt_all() { #encrypt all file matching a pattern, in the current dir
    print_info "Encrypting files matching ""$1"" in current dir"

    count=$(find . -type f -name "$1" | wc -l)

    find . -type f -name "$1" -exec \
    gpg --batch --yes --passphrase-file "$PASS_FILE" --symmetric {} \;

    if [[ $count -eq 0 ]]; then
        print_warning "No files found"
    else
        print_success "$count files encrypted"
    fi
}

######################################
# =========== Main Logic =============
######################################

main() {
    file_type=""

    while getopts ":p:f:" opt; do
        case $opt in
            p) PASS_FILE="$OPTARG" ;;
            f) file_type="$OPTARG" ;;
            \?) error_exit "Invalid option: -${OPTARG:-$OPT}" ;;
        esac
    done

    # check if file_type is set
    if [[ -z "$file_type" ]]; then
        error_exit "Missing mandatory argument -f please specify a file pattern to encrypt"
    fi

    encrypt_all "$file_type"
}

main "$@"