{ ... }:
{
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set -g fish_greeting ""
      starship init fish | source

      # Smart backspace function for auto-paired characters
      function smart_backspace
          set -l cmdline (commandline)
          set -l cursor (commandline -C)
          
          if test $cursor -gt 0; and test (string length -- $cmdline) -ge 2
              set -l before (string sub -s $cursor -l 1 -- $cmdline)
              set -l after (string sub -s (math $cursor + 1) -l 1 -- $cmdline)
              
              set -l is_pair 0
              switch "$before$after"
                  case "()" "[]" "{}" "\"\""
                      set is_pair 1
                  case "${"''"}" "\`\`"
                      set is_pair 1
              end
              
              if test $is_pair -eq 1
                  # Handle edge case: pair at start of line (cursor = 1)
                  if test $cursor -eq 1
                      set -l after_pair (string sub -s 3 -- $cmdline)
                      commandline -r -- "$after_pair"
                      commandline -C 0
                  else
                      # Normal case: pair in middle or at end of line
                      set -l before_pair (string sub -e (math $cursor - 1) -- $cmdline)
                      set -l after_pair (string sub -s (math $cursor + 2) -- $cmdline)
                      commandline -r -- "$before_pair$after_pair"
                      commandline -C (math $cursor - 1)
                  end
                  return
              end
          end
          
          commandline -f backward-delete-char
      end

      # Auto-pair brackets and quotes
      bind '(' 'commandline -i "()" && commandline -C (math (commandline -C) - 1)'
      bind '[' 'commandline -i "[]" && commandline -C (math (commandline -C) - 1)'
      bind '{' 'commandline -i "{}" && commandline -C (math (commandline -C) - 1)'
      bind '"' 'commandline -i "\"\"" && commandline -C (math (commandline -C) - 1)'
      bind "'" "commandline -i \"${"''"}\" && commandline -C (math (commandline -C) - 1)"
      bind '`' 'commandline -i "``" && commandline -C (math (commandline -C) - 1)'

      # Bind backspace to smart backspace
      bind backspace smart_backspace
    '';

    shellAliases = {
      # leaving this blank for now
    };
  };
}
