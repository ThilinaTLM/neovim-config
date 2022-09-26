local hop = require'hop'
hop.setup({ keys = 'etovxqpdygfblzhckisuran' })

local M = {}

-- jump to a word
M.jump_word_forward = function ()
    hop.hint_words({
        direction = require'hop.hint'.HintDirection.AFTER_CURSOR,
        hint_position = require'hop.hint'.HintPosition.BEGIN,
        inclusive_jump = false
    })
end
M.jump_word_backward = function ()
    hop.hint_words({
        direction = require'hop.hint'.HintDirection.BEFORE_CURSOR,
        hint_position = require'hop.hint'.HintPosition.BEGIN,
        inclusive_jump = false
    })
end

-- jump to a char2
M.find_char2 = function ()
    hop.hint_char2({
        hint_position = require'hop.hint'.HintPosition.MIDDLE,
        current_line_only = true,
        inclusive_jump = false
    })
end
M.find_char2_forward = function ()
    hop.hint_char2({
        direction = require'hop.hint'.HintDirection.AFTER_CURSOR,
        hint_position = require'hop.hint'.HintPosition.MIDDLE,
        current_line_only = true,
        inclusive_jump = false
    })
end
M.find_char2_backward = function ()
    hop.hint_char2({
        direction = require'hop.hint'.HintDirection.BEFORE_CURSOR,
        hint_position = require'hop.hint'.HintPosition.BEGIN,
        current_line_only = true,
        inclusive_jump = true
    })
end

return M
