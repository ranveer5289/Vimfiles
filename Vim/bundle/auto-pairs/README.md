Auto Pairs
==========
Insert or delete brackets, parens, quotes in pair.

Installation
------------
copy plugin/auto-pairs.vim to ~/.vim/plugin

Features
--------
*   Insert in pair

        input: [
        output: [|]

*   Delete in pair

        input: foo[<BS>
        output: foo

*   Insert new indented line after Return

        input: {|} (press <CR> at |)
        output: {
            |
        }

*   Insert spaces before closing characters, only for [], (), {}

        input: {|} (press <SPACE> at |)
        output: { | }

        input: {|} (press <SPACE>foo} at |)
        output: { foo }|

        input: '|' (press <SPACE> at |)
        output: ' |'

*   Skip ' when inside a word

        input: foo| (press ' at |)
        output: foo'

*   Skip closed bracket.

        input: []
        output: []

*   Ignore auto pair when previous character is \

        input: "\'
        output: "\'"

*   Fast Wrap

        input: |'hello' (press (<M-e> at|)
        output: ('hello')

*   Quick jump to closed pair.

        input:
        {
            something;|
        }

        (press } at |)

        output:
        {

        }|

*   Support ``` ''' and """

        input:
            '''

        output:
            '''

*  Fly Mode

        input: if(a[3)
        output: if(a[3])| (In Fly Mode)
        output: if(a[3)]) (Without Fly Mode)

        input:
        {
            hello();|
            world();
        }

        (press } at |)

        output:
        {
            hello();
            world();
        }|

        (then press <M-b> at | to do backinsert)
        output:
        {
            hello();}|
            world();
        }

        See Fly Mode section for details

Fly Mode
--------
Fly Mode will always force closed-pair jumping instead of inserting. only for ")", "}", "]"

If jumps in mistake, could use AutoPairsBackInsert(Default Key: <M-b>) to jump back and insert closed pair.

the most situation maybe want to insert single closed pair in the string, eg ")"

Fly Mode is DISABLED by default.

add **let g:AutoPairsFlyMode = 1** .vimrc to turn it on

Default Options:

    let g:AutoPairsFlyMode = 0
    let g:AutoPairsShortcutBackInsert = '<M-b>'

Shortcuts
---------

    System Shortcuts:
        <CR>  : Insert new indented line after return if cursor in blank brackets or quotes.
        <BS>  : Delete brackets in pair
        <M-p> : Toggle Autopairs (g:AutoPairsShortcutToggle)
        <M-e> : Fast Wrap (g:AutoPairsShortcutFastWrap)
        <M-n> : Jump to next closed pair (g:AutoPairsShortcutJump)
        <M-b> : BackInsert

    If <M-p> <M-e> or <M-n> conflict with another keys or want to bind to another keys, add

        let g:AutoPairShortcutToggle = '<another key>'

    to .vimrc, it the key is empty string '', then the shortcut will be disabled.

Options
-------
*   g:AutoPairs

        Default: {'(':')', '[':']', '{':'}',"'":"'",'"':'"', '`':'`'}

*   g:AutoPairsShortcutToggle

        Default: '<M-p>'

        The shortcut to toggle autopairs.

*   g:AutoPairsShortcutFastWrap

        Default: '<M-e>'

        Fast wrap the word. all pairs will be consider as a block (include <>).
        (|)'hello' after fast wrap at |, the word will be ('hello')
        (|)<hello> after fast wrap at |, the word will be (<hello>)

*   g:AutoPairsShortcutJump

        Default: '<M-n>'

        Jump to the next closed pair

*   g:AutoPairsMapBS

        Default : 1

        Map <BS> to delete brackets, quotes in pair
        execute 'inoremap <buffer> <silent> <BS> <C-R>=AutoPairsDelete()<CR>'

*   g:AutoPairsMapCR

        Default : 1

        Map <CR> to insert a new indented line if cursor in (|), {|} [|], '|', "|"
        execute 'inoremap <buffer> <silent> <CR> <C-R>=AutoPairsReturn()<CR>'

*   g:AutoPairsCenterLine

        Default : 1

        When g:AutoPairsMapCR is on, center current line after return if the line is at the bottom 1/3 of the window.

*   g:AutoPairsMapSpace

        Default : 1

        Map <space> to insert a space after the opening character and before the closing one.
        execute 'inoremap <buffer> <silent> <CR> <C-R>=AutoPairsSpace()<CR>'

*   g:AutoPairsFlyMode

        Default : 0

        set it to 1 to enable FlyMode.
        see FlyMode section for details.

*   g:AutoPairsShortcutBackInsert

        Default : <M-b>

        Work with FlyMode, insert the key at the Fly Mode jumped postion

TroubleShooting
---------------
    The script will remap keys ([{'"}]) <BS>,
    If auto pairs cannot work, use :imap ( to check if the map is corrected.
    The correct map should be <C-R>=AutoPairsInsert("\(")<CR>
    Or the plugin conflict with some other plugins.
    use command :call AutoPairsInit() to remap the keys.


* How to insert parens purely

    There are 3 ways

    1. use Ctrl-V ) to insert paren without trigger the plugin.

    2. use Alt-P to turn off the plugin.

    3. use DEL or <C-O>x to delete the character insert by plugin.


Contributors
------------
* [camthompson](https://github.com/camthompson)
