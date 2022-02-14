local ls = require("luasnip")
-- require("friendly-snippets")

local function expand_or_jump()
    if ls.expand_or_jumpable() then
        ls.expand_or_jump()
    end
end

ls.snippets = {
    all = {
        ls.parser.parse_snippet("expand", "this is example of lua snippet")
    },
    lua = {
        ls.parser.parse_snippet("lf", "local $1 = function($2)\n    $0\nend"),
    }
}

return {
    expand_or_jump = expand_or_jump,
}
