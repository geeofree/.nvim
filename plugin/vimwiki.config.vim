let root_notes = {}
let root_notes.path = '~/Sync/notes'
let root_notes.syntax = 'markdown'
let root_notes.ext = '.md'
let root_notes.auto_diary_index = 1

let personal_notes = {}
let personal_notes.path = '~/Sync/notes/personal'
let personal_notes.syntax = 'markdown'
let personal_notes.ext = '.md'

let todo_notes = {}
let todo_notes.path = '~/Sync/notes/todo'
let todo_notes.syntax = 'markdown'
let todo_notes.ext = '.md'

let g:vimwiki_list = [root_notes, personal_notes, todo_notes]

let g:vimwiki_key_mappings = {}
let g:vimwiki_key_mappings.headers = 0
