let root_notes = {}
let root_notes.path = '~/Sync/notes'
let root_notes.syntax = 'markdown'
let root_notes.ext = '.md'
let root_notes.auto_diary_index = 1

let personal_notes = {}
let personal_notes.path = '~/Sync/notes/personal'
let personal_notes.syntax = 'markdown'
let personal_notes.ext = '.md'

let linux_notes = {}
let linux_notes.path = '~/Sync/notes/linux'
let linux_notes.syntax = 'markdown'
let linux_notes.ext = '.md'

let g:vimwiki_list = []
call add(vimwiki_list, root_notes)
call add(vimwiki_list, personal_notes)
call add(vimwiki_list, linux_notes)

let g:vimwiki_key_mappings = {}
let g:vimwiki_key_mappings.headers = 0
