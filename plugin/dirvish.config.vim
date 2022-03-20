let g:dirvish_mode = ':sort ,^.*[\/],'
let g:dirvish_git_show_icons = 0

let modified = '#EAF27C'
let untracked = '#3EEA9A'
let error = '#D7263D'

silent exec 'hi DirvishGitUntracked    guifg=' . untracked
silent exec 'hi DirvishGitUntrackedDir guifg=' . untracked
silent exec 'hi DirvishGitModified     guifg=' . modified
silent exec 'hi DirvishGitStaged       guifg=' . modified
silent exec 'hi DirvishGitRenamed      guifg=' . modified
silent exec 'hi DirvishGitUnmerged     guifg=' . modified
