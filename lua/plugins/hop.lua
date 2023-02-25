
local M = {}

-- jump to a word
M.jump_word_forward = function ()
    require('hop').hint_words({
        direction = require'hop.hint'.HintDirection.AFTER_CURSOR,
        hint_position = require'hop.hint'.HintPosition.BEGIN,
        inclusive_jump = false
    })
end
M.jump_word_backward = function ()
    require('hop').hint_words({
        direction = require'hop.hint'.HintDirection.BEFORE_CURSOR,
        hint_position = require'hop.hint'.HintPosition.BEGIN,
        inclusive_jump = false
    })
end

-- jump to a char2
M.find_char2 = function ()
    require('hop').hint_char2({
        hint_position = require'hop.hint'.HintPosition.MIDDLE,
        current_line_only = true,
        inclusive_jump = false
    })
end
M.find_char2_forward = function ()
    require('hop').hint_char2({
        direction = require'hop.hint'.HintDirection.AFTER_CURSOR,
        hint_position = require'hop.hint'.HintPosition.MIDDLE,
        current_line_only = true,
        inclusive_jump = false
    })
end
M.find_char2_backward = function ()
    require('hop').hint_char2({
        direction = require'hop.hint'.HintDirection.BEFORE_CURSOR,
        hint_position = require'hop.hint'.HintPosition.BEGIN,
        current_line_only = true,
        inclusive_jump = true
    })
end

return {
    'phaazon/hop.nvim',
    config = function ()
        require('hop').setup({ keys = 'etovxqpdygfblzhckisuran' })
    end,
    fn = M,
}
