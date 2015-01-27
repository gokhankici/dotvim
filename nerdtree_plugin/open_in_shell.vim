"--- OPEN SHELL IN CURRENT NODE --------------------------------------------

"guard against sourcing the script twice
if exists("g:loaded_nerdtree_start_shell_mapping")
	finish
endif
let g:loaded_nerdtree_start_shell_mapping = 1

"bind 'S' to NERDTreeStartShell()
call NERDTreeAddKeyMap({
	\ 'key': 'S',
	\ 'callback': 'NERDTreeStartShell',
	\ 'quickhelpText': 'start a :shell in this dir' })

"change to the dir of the current node and start a :shell
function! NERDTreeStartShell()

	"grab the currently selected dir node (returns
	"the parent dir if a file is selected)
	let n = g:NERDTreeDirNode.GetSelected()

	"save the cwd so we can restore it after the :shell exits
	let oldCWD = getcwd()

	try

		":lcd to to the selected dir and :shell out
		exec 'lcd ' . n.path.str({'format': 'Cd'})
		redraw!
		"shell
		if executable("gnome-terminal")
			exec '!gnome-terminal ' . n.path.str({'format': 'Cd'}) . ' &'
		elseif executable("xfce4-terminal")
			exec '!xfce4-terminal --default-working-directory=' . n.path.str({'format': 'Cd'}) . ' &'
		endif

	"make sure we restore the cwd to its original state
	finally
		exec 'lcd ' . oldCWD
	endtry

endfunction


"bind 'V' to NERDTreeOpenWithDefault()
call NERDTreeAddKeyMap({
	\ 'key': 'V',
	\ 'callback': 'NERDTreeOpenWithDefault',
	\ 'quickhelpText': 'open the file with the default application using xdg-open' })

"change to the dir of the current node and start a :shell
function! NERDTreeOpenWithDefault()

	"grab the currently selected dir node (returns
	"the parent dir if a file is selected)
	let n = g:NERDTreeFileNode.GetSelected()

	if executable("xdg-open")
		exec '!xdg-open ' . n.path.str({'format': 'Cd'}) . ' &'
	else
		echo "No application to open file " . n.path.str({'format': 'Cd'})
	endif

endfunction

"-----------------------------------------------------------------------------
