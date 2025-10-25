# Notes: Lab 4 – Brace Expansion and Globbing

## 🔍 Concepts
1. **Brace Expansion (`{}`)**  
   - Generates strings or filenames automatically.  
   - Examples:  
     - `{1..5}` → 1 2 3 4 5  
     - `{a,b,c}` → a b c  
     - `file_{a..c}.txt` → file_a.txt file_b.txt file_c.txt  

2. **Globbing (`*`, `?`, `[]`)**  
   - Matches *existing files* using wildcard patterns.  
   - `*` → zero or more characters  
   - `?` → exactly one character  
   - `[abc]` → any one of a, b, or c  
   - `[0-9]` → any one digit from 0 to 9  

3. **Combining Both**
   - `touch file_{a..d}{1..3}.tmp` creates file_a1.tmp to file_d3.tmp  
   - Then `mv file_[a-b]?.tmp backup/` moves files file_a1.tmp → file_b3.tmp  

## ⚡ Pro Tips
- Always test brace expansions with `echo` first.  
- Use `set -x` for debugging shell scripts.  
- Run `shopt -s extglob` for extended pattern matching if needed.  
- Combine brace expansion with command substitution for dynamic automation.  

## ✅ Summary
Brace expansion is for **creation**, globbing is for **selection**.  
Together, they’re essential tools for **efficient Bash automation**.
