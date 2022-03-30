local lush = require("lush")
local hsl = lush.hsl
local hsluv = lush.hsluv

---@diagnostic disable
local theme = lush(function()
  return {
    SpecialKey                                                { fg="cyan", }, -- SpecialKey     xxx ctermfg=81 guifg=Cyan
    EndOfBuffer                                               { fg="#282c34", }, -- EndOfBuffer    xxx guifg=#282c34
    TermCursor                                                { bg="#c678dd", }, -- TermCursor     xxx cterm=reverse guibg=#c678dd
    GitSignsAddInline                                         { TermCursor }, -- GitSignsAddInline xxx links to TermCursor
    GitSignsDeleteInline                                      { TermCursor }, -- GitSignsDeleteInline xxx links to TermCursor
    GitSignsChangeInline                                      { TermCursor }, -- GitSignsChangeInline xxx links to TermCursor
    TermCursorNC                                              { bg="#5c6370", }, -- TermCursorNC   xxx guibg=#5c6370
    NonText                                                   { bg="#282c34", fg="#5c6370", }, -- NonText        xxx ctermfg=12 guifg=#5c6370 guibg=#282c34
    TelescopePromptCounter                                    { NonText }, -- TelescopePromptCounter xxx links to NonText
    TelescopePreviewHyphen                                    { NonText }, -- TelescopePreviewHyphen xxx links to NonText
    TelescopeResultsDiffUntracked                             { NonText }, -- TelescopeResultsDiffUntracked xxx links to NonText
    GitSignsCurrentLineBlame                                  { NonText }, -- GitSignsCurrentLineBlame xxx links to NonText
    Directory                                                 { fg="#61afef", }, -- Directory      xxx ctermfg=159 guifg=#61afef
    TelescopePreviewDirectory                                 { Directory }, -- TelescopePreviewDirectory xxx links to Directory
    TelescopePreviewDate                                      { Directory }, -- TelescopePreviewDate xxx links to Directory
    ErrorMsg                                                  { fg="#e06c75", }, -- ErrorMsg       xxx ctermfg=15 ctermbg=1 guifg=#e06c75
    NvimInvalidSpacing                                        { ErrorMsg }, -- NvimInvalidSpacing xxx links to ErrorMsg
    IncSearch                                                 { bg="#53565d", fg="#e5c07b", }, -- IncSearch      xxx cterm=reverse guifg=#e5c07b guibg=#53565D
    Search                                                    { bg="#53565d", fg="#e5c07b", }, -- Search         xxx ctermfg=0 ctermbg=11 guifg=#e5c07b guibg=#53565D
    LspSagaFinderSelection                                    { Search }, -- LspSagaFinderSelection xxx links to Search
    TelescopePreviewMatch                                     { Search }, -- TelescopePreviewMatch xxx links to Search
    MoreMsg                                                   { fg="#98c379", }, -- MoreMsg        xxx ctermfg=121 guifg=#98c379
    ModeMsg                                                   { gui="bold", }, -- ModeMsg        xxx cterm=bold gui=bold
    MsgSeparator                                              { ModeMsg }, -- MsgSeparator   xxx links to ModeMsg
    MsgArea                                                   { ModeMsg }, -- MsgArea        xxx links to ModeMsg
    LineNr                                                    { bg="#282c34", fg="#5c6370", }, -- LineNr         xxx ctermfg=11 guifg=#5c6370 guibg=#282c34
    LineNrAbove                                               { LineNr }, -- LineNrAbove    xxx links to LineNr
    LineNrBelow                                               { LineNr }, -- LineNrBelow    xxx links to LineNr
    TelescopeResultsLineNr                                    { LineNr }, -- TelescopeResultsLineNr xxx links to LineNr
    CursorLineNr                                              { bg="#282c34", fg="#c678dd", }, -- CursorLineNr   xxx cterm=underline ctermfg=11 guifg=#c678dd guibg=#282c34
    Question                                                  { bg="#282c34", fg="#5c6370", }, -- Question       xxx ctermfg=121 guifg=#5c6370 guibg=#282c34
    StatusLine                                                { bg="#282c34", fg="#abb2bf", }, -- StatusLine     xxx cterm=bold,reverse guifg=#abb2bf guibg=#282c34
    StatusLineNC                                              { bg="#282c34", fg="#abb2bf", }, -- StatusLineNC   xxx cterm=reverse guifg=#abb2bf guibg=#282c34
    WinSeparator                                              { bg="#282c34", fg="#5c6370", }, -- WinSeparator   xxx guifg=#5c6370 guibg=#282c34
    VertSplit                                                 { bg="#282c34", fg="#5c6370", }, -- VertSplit      xxx cterm=reverse guifg=#5c6370 guibg=#282c34
    Title                                                     { fg="#98c379", }, -- Title          xxx ctermfg=225 guifg=#98c379
    LspSagaBorderTitle                                        { Title }, -- LspSagaBorderTitle xxx links to Title
    LspSagaCodeActionTitle                                    { Title }, -- LspSagaCodeActionTitle xxx links to Title
    ReferencesCount                                           { Title }, -- ReferencesCount xxx links to Title
    DefinitionCount                                           { Title }, -- DefinitionCount xxx links to Title
    DefinitionPreviewTitle                                    { Title }, -- DefinitionPreviewTitle xxx links to Title
    Visual                                                    { bg="#53565d", }, -- Visual         xxx ctermbg=242 guibg=#53565D
    VisualNOS                                                 { Visual }, -- VisualNOS      xxx links to Visual
    TelescopePreviewLine                                      { Visual }, -- TelescopePreviewLine xxx links to Visual
    WarningMsg                                                { fg="#e5c07b", }, -- WarningMsg     xxx ctermfg=224 guifg=#e5c07b
    WildMenu                                                  { bg="#61afef", fg="#282c34", }, -- WildMenu       xxx ctermfg=0 ctermbg=11 guifg=#282c34 guibg=#61afef
    Folded                                                    { bg="#282c34", fg="#5c6370", }, -- Folded         xxx ctermfg=14 ctermbg=242 guifg=#5c6370 guibg=#282c34
    FoldColumn                                                { bg="grey", fg="cyan", }, -- FoldColumn     xxx ctermfg=14 ctermbg=242 guifg=Cyan guibg=Grey
    CursorLineFold                                            { FoldColumn }, -- CursorLineFold xxx links to FoldColumn
    DiffAdd                                                   { bg="#003e4a", }, -- DiffAdd        xxx ctermbg=4 guibg=#003e4a
    TelescopeResultsDiffAdd                                   { DiffAdd }, -- TelescopeResultsDiffAdd xxx links to DiffAdd
    GitSignsAddLn                                             { DiffAdd }, -- GitSignsAddLn  xxx links to DiffAdd
    DiffChange                                                { }, -- DiffChange     xxx ctermbg=5
    TelescopeResultsDiffChange                                { DiffChange }, -- TelescopeResultsDiffChange xxx links to DiffChange
    GitSignsChangeLn                                          { DiffChange }, -- GitSignsChangeLn xxx links to DiffChange
    DiffDelete                                                { bg="#501b20", }, -- DiffDelete     xxx ctermfg=12 ctermbg=6 guibg=#501b20
    TelescopeResultsDiffDelete                                { DiffDelete }, -- TelescopeResultsDiffDelete xxx links to DiffDelete
    GitSignsDeleteLn                                          { DiffDelete }, -- GitSignsDeleteLn xxx links to DiffDelete
    DiffText                                                  { bg="#005869", }, -- DiffText       xxx cterm=bold ctermbg=9 guibg=#005869
    SignColumn                                                { bg="#282c34", }, -- SignColumn     xxx ctermfg=14 ctermbg=242 guibg=#282c34
    CursorLineSign                                            { SignColumn }, -- CursorLineSign xxx links to SignColumn
    Conceal                                                   { bg="darkgrey", fg="lightgrey", }, -- Conceal        xxx ctermfg=7 ctermbg=242 guifg=LightGrey guibg=DarkGrey
    SpellBad                                                  { sp="red", gui="undercurl", }, -- SpellBad       xxx ctermbg=9 gui=undercurl guisp=Red
    SpellCap                                                  { sp="blue", gui="undercurl", }, -- SpellCap       xxx ctermbg=12 gui=undercurl guisp=Blue
    SpellRare                                                 { sp="magenta", gui="undercurl", }, -- SpellRare      xxx ctermbg=13 gui=undercurl guisp=Magenta
    SpellLocal                                                { sp="cyan", gui="undercurl", }, -- SpellLocal     xxx ctermbg=14 gui=undercurl guisp=Cyan
    Pmenu                                                     { bg="#3d4148", }, -- Pmenu          xxx ctermfg=0 ctermbg=13 guibg=#3D4148
    PmenuSel                                                  { bg="#61afef", fg="#282c34", }, -- PmenuSel       xxx ctermfg=242 ctermbg=0 guifg=#282c34 guibg=#61afef
    PmenuSbar                                                 { bg="#33373e", }, -- PmenuSbar      xxx ctermbg=248 guibg=#33373E
    PmenuThumb                                                { bg="#4e8cbf", }, -- PmenuThumb     xxx ctermbg=15 guibg=#4E8CBF
    TabLine                                                   { bg="#282c34", }, -- TabLine        xxx cterm=underline ctermfg=15 ctermbg=242 guibg=#282c34
    TabLineSel                                                { bg="#7d828d", fg="#c678dd", }, -- TabLineSel     xxx cterm=bold guifg=#c678dd guibg=#7D828D
    TabLineFill                                               { bg="#282c34", fg="#abb2bf", }, -- TabLineFill    xxx cterm=reverse guifg=#abb2bf guibg=#282c34
    CursorColumn                                              { bg="#5c6370", }, -- CursorColumn   xxx ctermbg=242 guibg=#5c6370
    CursorLine                                                { bg="#282c34", }, -- CursorLine     xxx cterm=underline guibg=#282c34
    NeoTreeCursorLine                                         { CursorLine }, -- NeoTreeCursorLine xxx links to CursorLine
    ColorColumn                                               { bg="#2e323a", }, -- ColorColumn    xxx ctermbg=1 guibg=#2E323A
    QuickFixLine                                              { bg="#282c34", }, -- QuickFixLine   xxx guibg=#282c34
    Whitespace                                                { fg="#7d828d", }, -- Whitespace     xxx guifg=#7D828D
    NormalNC                                                  { bg="#282c34", fg="#abb2bf", }, -- NormalNC       xxx guifg=#abb2bf guibg=#282c34
    LspFloatWinBorder                                         { NormalNC }, -- LspFloatWinBorder xxx links to NormalNC
    LspSagaDiagnosticBorder                                   { NormalNC }, -- LspSagaDiagnosticBorder xxx links to NormalNC
    LspSagaDiagnosticTruncateLine                             { NormalNC }, -- LspSagaDiagnosticTruncateLine xxx links to NormalNC
    ProviderTruncateLine                                      { NormalNC }, -- ProviderTruncateLine xxx links to NormalNC
    DiagnosticTruncateLine                                    { NormalNC }, -- DiagnosticTruncateLine xxx links to NormalNC
    LspSagaShTruncateLine                                     { NormalNC }, -- LspSagaShTruncateLine xxx links to NormalNC
    LspSagaDocTruncateLine                                    { NormalNC }, -- LspSagaDocTruncateLine xxx links to NormalNC
    LineDiagTuncateLine                                       { NormalNC }, -- LineDiagTuncateLine xxx links to NormalNC
    LspSagaCodeActionTruncateLine                             { NormalNC }, -- LspSagaCodeActionTruncateLine xxx links to NormalNC
    FloatBorder                                               { bg="#282c34", fg="#5c6370", }, -- FloatBorder    xxx guifg=#5c6370 guibg=#282c34
    NeoTreeFloatBorder                                        { FloatBorder }, -- NeoTreeFloatBorder xxx links to FloatBorder
    RedrawDebugNormal                                         { gui="reverse", }, -- RedrawDebugNormal xxx cterm=reverse gui=reverse
    RedrawDebugClear                                          { bg="yellow", }, -- RedrawDebugClear xxx ctermbg=11 guibg=Yellow
    RedrawDebugComposed                                       { bg="green", }, -- RedrawDebugComposed xxx ctermbg=10 guibg=Green
    RedrawDebugRecompose                                      { bg="red", }, -- RedrawDebugRecompose xxx ctermbg=9 guibg=Red
    Cursor                                                    { bg="#282c34", fg="#282c34", }, -- Cursor         xxx guifg=#282c34 guibg=#282c34
    HopCursor                                                 { Cursor }, -- HopCursor      xxx links to Cursor
    lCursor                                                   { bg="fg", fg="bg", }, -- lCursor        xxx guifg=bg guibg=fg
    Normal                                                    { bg="#151415", fg="#abb2bf", }, -- Normal         xxx guifg=#abb2bf guibg=#282c34
    NormalFloat                                               { Normal }, -- NormalFloat    xxx links to Normal
    NvimSpacing                                               { Normal }, -- NvimSpacing    xxx links to Normal
    NeoTreeNormal                                             { Normal }, -- NeoTreeNormal  xxx links to Normal
    LspSagaCodeActionContent                                  { Normal }, -- LspSagaCodeActionContent xxx links to Normal
    cssMediaComma                                             { Normal }, -- cssMediaComma  xxx links to Normal
    Substitute                                                { bg="#e5c07b", fg="#282c34", }, -- Substitute     xxx guifg=#282c34 guibg=#e5c07b
    FloatShadow                                               { blend="80", bg="black", }, -- FloatShadow    xxx guibg=Black blend=80
    FloatShadowThrough                                        { blend="100", bg="black", }, -- FloatShadowThrough xxx guibg=Black blend=100
    Error                                                     { fg="#e06c75", }, -- Error          xxx ctermfg=15 ctermbg=9 guifg=#e06c75
    NvimInvalid                                               { Error }, -- NvimInvalid    xxx links to Error
    TargetWord                                                { Error }, -- TargetWord     xxx links to Error
    htmlError                                                 { Error }, -- htmlError      xxx links to Error
    htmlPreError                                              { Error }, -- htmlPreError   xxx links to Error
    htmlPreProcAttrError                                      { Error }, -- htmlPreProcAttrError xxx links to Error
    javaScriptError                                           { Error }, -- javaScriptError xxx links to Error
    vbError                                                   { Error }, -- vbError        xxx links to Error
    cssError                                                  { Error }, -- cssError       xxx links to Error
    cssBraceError                                             { Error }, -- cssBraceError  xxx links to Error
    cssDeprecated                                             { Error }, -- cssDeprecated  xxx links to Error
    markdownError                                             { Error }, -- markdownError  xxx links to Error
    luaParenError                                             { Error }, -- luaParenError  xxx links to Error
    luaBraceError                                             { Error }, -- luaBraceError  xxx links to Error
    luaError                                                  { Error }, -- luaError       xxx links to Error
    LspDiagnosticsDefaultError                                { Error }, -- LspDiagnosticsDefaultError xxx links to Error
    TSError                                                   { Error }, -- TSError        xxx links to Error
    Todo                                                      { fg="#c678dd", }, -- Todo           xxx ctermfg=0 ctermbg=11 guifg=#c678dd
    javaScriptCommentTodo                                     { Todo }, -- javaScriptCommentTodo xxx links to Todo
    vbTodo                                                    { Todo }, -- vbTodo         xxx links to Todo
    luaTodo                                                   { Todo }, -- luaTodo        xxx links to Todo
    String                                                    { fg="#98c379", }, -- String         xxx guifg=#98c379
    NvimString                                                { String }, -- NvimString     xxx links to String
    TelescopePreviewExecute                                   { String }, -- TelescopePreviewExecute xxx links to String
    TelescopePreviewSize                                      { String }, -- TelescopePreviewSize xxx links to String
    htmlString                                                { String }, -- htmlString     xxx links to String
    htmlValue                                                 { String }, -- htmlValue      xxx links to String
    htmlPreAttr                                               { String }, -- htmlPreAttr    xxx links to String
    javaScriptStringD                                         { String }, -- javaScriptStringD xxx links to String
    javaScriptStringS                                         { String }, -- javaScriptStringS xxx links to String
    javaScriptStringT                                         { String }, -- javaScriptStringT xxx links to String
    javaScriptRegexpString                                    { String }, -- javaScriptRegexpString xxx links to String
    vbString                                                  { String }, -- vbString       xxx links to String
    cssStringQ                                                { String }, -- cssStringQ     xxx links to String
    cssStringQQ                                               { String }, -- cssStringQQ    xxx links to String
    cssURL                                                    { String }, -- cssURL         xxx links to String
    markdownUrlTitle                                          { String }, -- markdownUrlTitle xxx links to String
    luaString2                                                { String }, -- luaString2     xxx links to String
    luaString                                                 { String }, -- luaString      xxx links to String
    Constant                                                  { fg="#d19a66", }, -- Constant       xxx ctermfg=13 guifg=#d19a66
    TSConstant                                                { Constant }, -- TSConstant     xxx links to Constant
    TSConstMacro                                              { Constant }, -- TSConstMacro   xxx links to Constant
    TelescopePreviewPipe                                      { Constant }, -- TelescopePreviewPipe xxx links to Constant
    TelescopePreviewCharDev                                   { Constant }, -- TelescopePreviewCharDev xxx links to Constant
    TelescopePreviewBlock                                     { Constant }, -- TelescopePreviewBlock xxx links to Constant
    TelescopePreviewRead                                      { Constant }, -- TelescopePreviewRead xxx links to Constant
    TelescopePreviewUser                                      { Constant }, -- TelescopePreviewUser xxx links to Constant
    TelescopePreviewGroup                                     { Constant }, -- TelescopePreviewGroup xxx links to Constant
    TelescopeResultsConstant                                  { Constant }, -- TelescopeResultsConstant xxx links to Constant
    vbConst                                                   { Constant }, -- vbConst        xxx links to Constant
    vbDefine                                                  { Constant }, -- vbDefine       xxx links to Constant
    cssColor                                                  { Constant }, -- cssColor       xxx links to Constant
    cssFunction                                               { Constant }, -- cssFunction    xxx links to Constant
    cssKeyFrameProp                                           { Constant }, -- cssKeyFrameProp xxx links to Constant
    cssAttr                                                   { Constant }, -- cssAttr        xxx links to Constant
    cssPseudoClassLang                                        { Constant }, -- cssPseudoClassLang xxx links to Constant
    cssUnicodeRange                                           { Constant }, -- cssUnicodeRange xxx links to Constant
    luaConstant                                               { Constant }, -- luaConstant    xxx links to Constant
    Character                                                 { fg="#98c379", }, -- Character      xxx guifg=#98c379
    TSCharacter                                               { Character }, -- TSCharacter    xxx links to Character
    javaScriptCharacter                                       { Character }, -- javaScriptCharacter xxx links to Character
    Number                                                    { fg="#d19a66", }, -- Number         xxx guifg=#d19a66
    NvimNumber                                                { Number }, -- NvimNumber     xxx links to Number
    TSNumber                                                  { Number }, -- TSNumber       xxx links to Number
    TelescopeResultsNumber                                    { Number }, -- TelescopeResultsNumber xxx links to Number
    javaScriptNumber                                          { Number }, -- javaScriptNumber xxx links to Number
    vbNumber                                                  { Number }, -- vbNumber       xxx links to Number
    cssUnitDecorators                                         { Number }, -- cssUnitDecorators xxx links to Number
    cssValueInteger                                           { Number }, -- cssValueInteger xxx links to Number
    cssValueNumber                                            { Number }, -- cssValueNumber xxx links to Number
    cssValueLength                                            { Number }, -- cssValueLength xxx links to Number
    cssValueAngle                                             { Number }, -- cssValueAngle  xxx links to Number
    cssValueTime                                              { Number }, -- cssValueTime   xxx links to Number
    cssValueFrequency                                         { Number }, -- cssValueFrequency xxx links to Number
    luaNumber                                                 { Number }, -- luaNumber      xxx links to Number
    jsonNumber                                                { Number }, -- jsonNumber     xxx links to Number
    Boolean                                                   { fg="#d19a66", }, -- Boolean        xxx guifg=#d19a66
    TSBoolean                                                 { Boolean }, -- TSBoolean      xxx links to Boolean
    javaScriptBoolean                                         { Boolean }, -- javaScriptBoolean xxx links to Boolean
    vbBoolean                                                 { Boolean }, -- vbBoolean      xxx links to Boolean
    jsonBoolean                                               { Boolean }, -- jsonBoolean    xxx links to Boolean
    Float                                                     { fg="#d19a66", }, -- Float          xxx guifg=#d19a66
    TSFloat                                                   { Float }, -- TSFloat        xxx links to Float
    vbFloat                                                   { Float }, -- vbFloat        xxx links to Float
    Function                                                  { fg="#61afef", }, -- Function       xxx guifg=#61afef
    TelescopeResultsClass                                     { Function }, -- TelescopeResultsClass xxx links to Function
    TelescopeResultsField                                     { Function }, -- TelescopeResultsField xxx links to Function
    TelescopeResultsFunction                                  { Function }, -- TelescopeResultsFunction xxx links to Function
    cssFunctionComma                                          { Function }, -- cssFunctionComma xxx links to Function
    luaFunction                                               { Function }, -- luaFunction    xxx links to Function
    Identifier                                                { fg="#e06c75", }, -- Identifier     xxx cterm=bold ctermfg=14 guifg=#e06c75
    NvimIdentifier                                            { Identifier }, -- NvimIdentifier xxx links to Identifier
    TelescopeMultiIcon                                        { Identifier }, -- TelescopeMultiIcon xxx links to Identifier
    TelescopeResultsIdentifier                                { Identifier }, -- TelescopeResultsIdentifier xxx links to Identifier
    vbFunction                                                { Identifier }, -- vbFunction     xxx links to Identifier
    vbIdentifier                                              { Identifier }, -- vbIdentifier   xxx links to Identifier
    luaFunc                                                   { Identifier }, -- luaFunc        xxx links to Identifier
    Conditional                                               { fg="#c678dd", }, -- Conditional    xxx guifg=#c678dd
    TSConditional                                             { Conditional }, -- TSConditional  xxx links to Conditional
    javaScriptConditional                                     { Conditional }, -- javaScriptConditional xxx links to Conditional
    javaScriptBranch                                          { Conditional }, -- javaScriptBranch xxx links to Conditional
    vbConditional                                             { Conditional }, -- vbConditional  xxx links to Conditional
    luaElse                                                   { Conditional }, -- luaElse        xxx links to Conditional
    luaCond                                                   { Conditional }, -- luaCond        xxx links to Conditional
    Statement                                                 { fg="#c678dd", }, -- Statement      xxx ctermfg=11 guifg=#c678dd
    TelescopePreviewSocket                                    { Statement }, -- TelescopePreviewSocket xxx links to Statement
    TelescopePreviewWrite                                     { Statement }, -- TelescopePreviewWrite xxx links to Statement
    javaScriptStatement                                       { Statement }, -- javaScriptStatement xxx links to Statement
    vbStatement                                               { Statement }, -- vbStatement    xxx links to Statement
    vbKeyword                                                 { Statement }, -- vbKeyword      xxx links to Statement
    cssAtRuleLogical                                          { Statement }, -- cssAtRuleLogical xxx links to Statement
    htmlStatement                                             { Statement }, -- htmlStatement  xxx links to Statement
    luaStatement                                              { Statement }, -- luaStatement   xxx links to Statement
    Repeat                                                    { fg="#c678dd", }, -- Repeat         xxx guifg=#c678dd
    javaScriptRepeat                                          { Repeat }, -- javaScriptRepeat xxx links to Repeat
    vbRepeat                                                  { Repeat }, -- vbRepeat       xxx links to Repeat
    luaRepeat                                                 { Repeat }, -- luaRepeat      xxx links to Repeat
    luaFor                                                    { Repeat }, -- luaFor         xxx links to Repeat
    Label                                                     { fg="#e06c75", }, -- Label          xxx guifg=#e06c75
    javaScriptLabel                                           { Label }, -- javaScriptLabel xxx links to Label
    javaScriptConstant                                        { Label }, -- javaScriptConstant xxx links to Label
    luaLabel                                                  { Label }, -- luaLabel       xxx links to Label
    Operator                                                  { fg="#56b6c2", }, -- Operator       xxx guifg=#56b6c2
    NvimAssignment                                            { Operator }, -- NvimAssignment xxx links to Operator
    NvimOperator                                              { Operator }, -- NvimOperator   xxx links to Operator
    TSOperator                                                { Operator }, -- TSOperator     xxx links to Operator
    TelescopeResultsOperator                                  { Operator }, -- TelescopeResultsOperator xxx links to Operator
    javaScriptOperator                                        { Operator }, -- javaScriptOperator xxx links to Operator
    vbOperator                                                { Operator }, -- vbOperator     xxx links to Operator
    luaIn                                                     { Operator }, -- luaIn          xxx links to Operator
    luaOperator                                               { Operator }, -- luaOperator    xxx links to Operator
    Keyword                                                   { fg="#c678dd", }, -- Keyword        xxx guifg=#c678dd
    TelescopePreviewSticky                                    { Keyword }, -- TelescopePreviewSticky xxx links to Keyword
    javaScriptMessage                                         { Keyword }, -- javaScriptMessage xxx links to Keyword
    javaScriptGlobal                                          { Keyword }, -- javaScriptGlobal xxx links to Keyword
    javaScriptMember                                          { Keyword }, -- javaScriptMember xxx links to Keyword
    Exception                                                 { fg="#c678dd", }, -- Exception      xxx guifg=#c678dd
    TSException                                               { Exception }, -- TSException    xxx links to Exception
    javaScriptException                                       { Exception }, -- javaScriptException xxx links to Exception
    javaScriptDeprecated                                      { Exception }, -- javaScriptDeprecated xxx links to Exception
    Include                                                   { fg="#c678dd", }, -- Include        xxx guifg=#c678dd
    cssAtRule                                                 { Include }, -- cssAtRule      xxx links to Include
    PreProc                                                   { fg="#e5c07b", }, -- PreProc        xxx ctermfg=81 guifg=#e5c07b
    htmlPreStmt                                               { PreProc }, -- htmlPreStmt    xxx links to PreProc
    htmlPreProc                                               { PreProc }, -- htmlPreProc    xxx links to PreProc
    htmlPreProcAttrName                                       { PreProc }, -- htmlPreProcAttrName xxx links to PreProc
    htmlHead                                                  { PreProc }, -- htmlHead       xxx links to PreProc
    vbMethods                                                 { PreProc }, -- vbMethods      xxx links to PreProc
    vbPreProc                                                 { PreProc }, -- vbPreProc      xxx links to PreProc
    cssAtKeyword                                              { PreProc }, -- cssAtKeyword   xxx links to PreProc
    cssPagePseudo                                             { PreProc }, -- cssPagePseudo  xxx links to PreProc
    Define                                                    { fg="#c678dd", }, -- Define         xxx guifg=#c678dd
    Macro                                                     { fg="#61afef", }, -- Macro          xxx guifg=#61afef
    TSEnvironment                                             { Macro }, -- TSEnvironment  xxx links to Macro
    PreCondit                                                 { fg="#e5c07b", }, -- PreCondit      xxx guifg=#e5c07b
    StorageClass                                              { fg="#e5c07b", }, -- StorageClass   xxx guifg=#e5c07b
    Type                                                      { fg="#e5c07b", }, -- Type           xxx ctermfg=121 guifg=#e5c07b
    NvimNumberPrefix                                          { Type }, -- NvimNumberPrefix xxx links to Type
    NvimOptionSigil                                           { Type }, -- NvimOptionSigil xxx links to Type
    TSEnvironmentName                                         { Type }, -- TSEnvironmentName xxx links to Type
    javaScriptType                                            { Type }, -- javaScriptType xxx links to Type
    vbTypes                                                   { Type }, -- vbTypes        xxx links to Type
    vbTypeSpecifier                                           { Type }, -- vbTypeSpecifier xxx links to Type
    Structure                                                 { fg="#c678dd", }, -- Structure      xxx guifg=#c678dd
    luaTable                                                  { Structure }, -- luaTable       xxx links to Structure
    Typedef                                                   { fg="#c678dd", }, -- Typedef        xxx guifg=#c678dd
    markdownFootnote                                          { Typedef }, -- markdownFootnote xxx links to Typedef
    markdownFootnoteDefinition                                { Typedef }, -- markdownFootnoteDefinition xxx links to Typedef
    Special                                                   { fg="#61afef", }, -- Special        xxx ctermfg=224 guifg=#61afef
    Tag                                                       { Special }, -- Tag            xxx links to Special
    Debug                                                     { Special }, -- Debug          xxx links to Special
    DefinitionIcon                                            { Special }, -- DefinitionIcon xxx links to Special
    ReferencesIcon                                            { Special }, -- ReferencesIcon xxx links to Special
    NvimTreeSpecialFile                                       { Special }, -- NvimTreeSpecialFile xxx links to Special
    TSStringSpecial                                           { Special }, -- TSStringSpecial xxx links to Special
    TelescopePreviewLink                                      { Special }, -- TelescopePreviewLink xxx links to Special
    htmlCssDefinition                                         { Special }, -- htmlCssDefinition xxx links to Special
    javaScript                                                { Special }, -- javaScript     xxx links to Special
    javaScriptSpecial                                         { Special }, -- javaScriptSpecial xxx links to Special
    javaScriptEmbed                                           { Special }, -- javaScriptEmbed xxx links to Special
    vbEvents                                                  { Special }, -- vbEvents       xxx links to Special
    cssUnicodeEscape                                          { Special }, -- cssUnicodeEscape xxx links to Special
    cssCustomProp                                             { Special }, -- cssCustomProp  xxx links to Special
    markdownEscape                                            { Special }, -- markdownEscape xxx links to Special
    SpecialChar                                               { fg="#d19a66", }, -- SpecialChar    xxx guifg=#d19a66
    NvimRegister                                              { SpecialChar }, -- NvimRegister   xxx links to SpecialChar
    NvimStringSpecial                                         { SpecialChar }, -- NvimStringSpecial xxx links to SpecialChar
    NeoTreeBufferNumber                                       { SpecialChar }, -- NeoTreeBufferNumber xxx links to SpecialChar
    NeoTreeFilterTerm                                         { SpecialChar }, -- NeoTreeFilterTerm xxx links to SpecialChar
    TelescopeResultsVariable                                  { SpecialChar }, -- TelescopeResultsVariable xxx links to SpecialChar
    htmlSpecialChar                                           { SpecialChar }, -- htmlSpecialChar xxx links to SpecialChar
    luaSpecial                                                { SpecialChar }, -- luaSpecial     xxx links to SpecialChar
    Delimiter                                                 { fg="#abb2bf", }, -- Delimiter      xxx guifg=#abb2bf
    NvimParenthesis                                           { Delimiter }, -- NvimParenthesis xxx links to Delimiter
    NvimColon                                                 { Delimiter }, -- NvimColon      xxx links to Delimiter
    NvimComma                                                 { Delimiter }, -- NvimComma      xxx links to Delimiter
    NvimArrow                                                 { Delimiter }, -- NvimArrow      xxx links to Delimiter
    TSPunctDelimiter                                          { Delimiter }, -- TSPunctDelimiter xxx links to Delimiter
    TSTagDelimiter                                            { Delimiter }, -- TSTagDelimiter xxx links to Delimiter
    markdownUrlTitleDelimiter                                 { Delimiter }, -- markdownUrlTitleDelimiter xxx links to Delimiter
    SpecialComment                                            { fg="#7d828d", }, -- SpecialComment xxx guifg=#7D828D
    TelescopeResultsSpecialComment                            { SpecialComment }, -- TelescopeResultsSpecialComment xxx links to SpecialComment
    DiagnosticError                                           { fg="red", }, -- DiagnosticError xxx ctermfg=1 guifg=Red
    DiagnosticFloatingError                                   { DiagnosticError }, -- DiagnosticFloatingError xxx links to DiagnosticError
    DiagnosticWarn                                            { fg="orange", }, -- DiagnosticWarn xxx ctermfg=3 guifg=Orange
    DiagnosticFloatingWarn                                    { DiagnosticWarn }, -- DiagnosticFloatingWarn xxx links to DiagnosticWarn
    DiagnosticInfo                                            { fg="lightblue", }, -- DiagnosticInfo xxx ctermfg=4 guifg=LightBlue
    DiagnosticFloatingInfo                                    { DiagnosticInfo }, -- DiagnosticFloatingInfo xxx links to DiagnosticInfo
    DiagnosticHint                                            { fg="lightgrey", }, -- DiagnosticHint xxx ctermfg=7 guifg=LightGrey
    DiagnosticFloatingHint                                    { DiagnosticHint }, -- DiagnosticFloatingHint xxx links to DiagnosticHint
    DiagnosticUnderlineError                                  { sp="red", gui="underline", }, -- DiagnosticUnderlineError xxx cterm=underline gui=underline guisp=Red
    DiagnosticUnderlineWarn                                   { sp="orange", gui="underline", }, -- DiagnosticUnderlineWarn xxx cterm=underline gui=underline guisp=Orange
    DiagnosticUnderlineInfo                                   { sp="lightblue", gui="underline", }, -- DiagnosticUnderlineInfo xxx cterm=underline gui=underline guisp=LightBlue
    DiagnosticUnderlineHint                                   { sp="lightgrey", gui="underline", }, -- DiagnosticUnderlineHint xxx cterm=underline gui=underline guisp=LightGrey
    MatchParen                                                { fg="#56b6c2", }, -- MatchParen     xxx ctermbg=6 guifg=#56b6c2
    Comment                                                   { fg="#7d828d", }, -- Comment        xxx ctermfg=14 guifg=#7D828D
    TSComment                                                 { Comment }, -- TSComment      xxx links to Comment
    TelescopeResultsComment                                   { Comment }, -- TelescopeResultsComment xxx links to Comment
    htmlComment                                               { Comment }, -- htmlComment    xxx links to Comment
    javaScriptLineComment                                     { Comment }, -- javaScriptLineComment xxx links to Comment
    javaScriptComment                                         { Comment }, -- javaScriptComment xxx links to Comment
    htmlCssStyleComment                                       { Comment }, -- htmlCssStyleComment xxx links to Comment
    vbComment                                                 { Comment }, -- vbComment      xxx links to Comment
    vbLineLabel                                               { Comment }, -- vbLineLabel    xxx links to Comment
    vbLineNumber                                              { Comment }, -- vbLineNumber   xxx links to Comment
    cssComment                                                { Comment }, -- cssComment     xxx links to Comment
    cssVendor                                                 { Comment }, -- cssVendor      xxx links to Comment
    cssHacks                                                  { Comment }, -- cssHacks       xxx links to Comment
    luaComment                                                { Comment }, -- luaComment     xxx links to Comment
    Underlined                                                { }, -- Underlined     xxx cterm=underline ctermfg=81
    Ignore                                                    { fg="bg", }, -- Ignore         xxx ctermfg=0 guifg=bg
    NvimInternalError                                         { bg="red", fg="red", }, -- NvimInternalError xxx ctermfg=9 ctermbg=9 guifg=Red guibg=Red
    NvimFigureBrace                                           { NvimInternalError }, -- NvimFigureBrace xxx links to NvimInternalError
    NvimSingleQuotedUnknownEscape                             { NvimInternalError }, -- NvimSingleQuotedUnknownEscape xxx links to NvimInternalError
    NvimInvalidSingleQuotedUnknownEscape                      { NvimInternalError }, -- NvimInvalidSingleQuotedUnknownEscape xxx links to NvimInternalError
    NeoTreeNormalNC                                           { bg="#282c34", }, -- NeoTreeNormalNC xxx guibg=#282c34
    NeoTreeFloatTitle                                         { bg="#282c34", fg="#abb2bf", }, -- NeoTreeFloatTitle xxx guifg=#abb2bf guibg=#282c34
    NeoTreeTitleBar                                           { bg="#5c6370", fg="#282c34", }, -- NeoTreeTitleBar xxx guifg=#282c34 guibg=#5c6370
    NeoTreeDimText                                            { fg="#505050", }, -- NeoTreeDimText xxx guifg=#505050
    NeoTreeExpander                                           { NeoTreeDimText }, -- NeoTreeExpander xxx links to NeoTreeDimText
    NeoTreeDotfile                                            { fg="#626262", }, -- NeoTreeDotfile xxx guifg=#626262
    NeoTreeHiddenByName                                       { NeoTreeDotfile }, -- NeoTreeHiddenByName xxx links to NeoTreeDotfile
    NeoTreeGitIgnored                                         { NeoTreeDotfile }, -- NeoTreeGitIgnored xxx links to NeoTreeDotfile
    NeoTreeDirectoryName                                      { fg="#61afef", }, -- NeoTreeDirectoryName xxx guifg=#61afef
    NeoTreeDirectoryIcon                                      { fg="#c678dd", }, -- NeoTreeDirectoryIcon xxx guifg=#c678dd
    NeoTreeFileIcon                                           { fg="#61afef", }, -- NeoTreeFileIcon xxx guifg=#61afef
    NeoTreeFileName                                           { fg="#abb2bf", }, -- NeoTreeFileName xxx guifg=#abb2bf
    NeoTreeFileNameOpened                                     { fg="#c678dd", }, -- NeoTreeFileNameOpened xxx guifg=#c678dd
    NeoTreeSymbolicLinkTarget                                 { fg="#56b6c2", }, -- NeoTreeSymbolicLinkTarget xxx guifg=#56b6c2
    NeoTreeRootName                                           { fg="#c678dd", }, -- NeoTreeRootName xxx guifg=#c678dd
    NeoTreeIndentMarker                                       { fg="#5c6370", }, -- NeoTreeIndentMarker xxx guifg=#5c6370
    NeoTreeGitConflict                                        { fg="#ff8700", gui="bold,italic", }, -- NeoTreeGitConflict xxx gui=bold,italic guifg=#ff8700
    NeoTreeGitUntracked                                       { fg="#ff8700", gui="italic", }, -- NeoTreeGitUntracked xxx gui=italic guifg=#ff8700
    lualine_a_replace                                         { bg="#d16969", fg="#262626", gui="bold", }, -- lualine_a_replace xxx gui=bold guifg=#262626 guibg=#D16969
    lualine_c_replace                                         { bg="#262626", fg="#d4d4d4", }, -- lualine_c_replace xxx guifg=#D4D4D4 guibg=#262626
    lualine_b_replace                                         { bg="#262626", fg="#d16969", }, -- lualine_b_replace xxx guifg=#D16969 guibg=#262626
    lualine_a_inactive                                        { bg="#3c3c3c", fg="#d4d4d4", gui="bold", }, -- lualine_a_inactive xxx gui=bold guifg=#D4D4D4 guibg=#3C3C3C
    lualine_b_inactive                                        { bg="#569cd6", fg="#262626", }, -- lualine_b_inactive xxx guifg=#262626 guibg=#569CD6
    lualine_a_insert                                          { bg="#569cd6", fg="#262626", gui="bold", }, -- lualine_a_insert xxx gui=bold guifg=#262626 guibg=#569CD6
    lualine_c_insert                                          { bg="#262626", fg="#d4d4d4", }, -- lualine_c_insert xxx guifg=#D4D4D4 guibg=#262626
    lualine_b_insert                                          { bg="#262626", fg="#569cd6", }, -- lualine_b_insert xxx guifg=#569CD6 guibg=#262626
    lualine_a_visual                                          { bg="#c586c0", fg="#262626", gui="bold", }, -- lualine_a_visual xxx gui=bold guifg=#262626 guibg=#C586C0
    lualine_b_visual                                          { bg="#262626", fg="#c586c0", }, -- lualine_b_visual xxx guifg=#C586C0 guibg=#262626
    lualine_a_normal                                          { bg="#608b4e", fg="#262626", gui="bold", }, -- lualine_a_normal xxx gui=bold guifg=#262626 guibg=#608B4E
    lualine_c_normal                                          { bg="#262626", fg="#d4d4d4", }, -- lualine_c_normal xxx guifg=#D4D4D4 guibg=#262626
    lualine_b_normal                                          { bg="#262626", fg="#608b4e", }, -- lualine_b_normal xxx guifg=#608B4E guibg=#262626
    lualine_x_diagnostics_error_normal                        { bg="#262626", fg="#ff0000", }, -- lualine_x_diagnostics_error_normal xxx guifg=#ff0000 guibg=#262626
    lualine_x_diagnostics_error_insert                        { bg="#262626", fg="#ff0000", }, -- lualine_x_diagnostics_error_insert xxx guifg=#ff0000 guibg=#262626
    lualine_x_diagnostics_error_visual                        { bg="#262626", fg="#ff0000", }, -- lualine_x_diagnostics_error_visual xxx guifg=#ff0000 guibg=#262626
    lualine_x_diagnostics_error_replace                       { bg="#262626", fg="#ff0000", }, -- lualine_x_diagnostics_error_replace xxx guifg=#ff0000 guibg=#262626
    lualine_x_diagnostics_error_command                       { bg="#262626", fg="#ff0000", }, -- lualine_x_diagnostics_error_command xxx guifg=#ff0000 guibg=#262626
    lualine_x_diagnostics_error_terminal                      { bg="#262626", fg="#ff0000", }, -- lualine_x_diagnostics_error_terminal xxx guifg=#ff0000 guibg=#262626
    lualine_x_diagnostics_error_inactive                      { bg="#262626", fg="#ff0000", }, -- lualine_x_diagnostics_error_inactive xxx guifg=#ff0000 guibg=#262626
    lualine_x_diagnostics_warn_normal                         { bg="#262626", fg="#ffa500", }, -- lualine_x_diagnostics_warn_normal xxx guifg=#ffa500 guibg=#262626
    lualine_x_diagnostics_warn_insert                         { bg="#262626", fg="#ffa500", }, -- lualine_x_diagnostics_warn_insert xxx guifg=#ffa500 guibg=#262626
    lualine_x_diagnostics_warn_visual                         { bg="#262626", fg="#ffa500", }, -- lualine_x_diagnostics_warn_visual xxx guifg=#ffa500 guibg=#262626
    lualine_x_diagnostics_warn_replace                        { bg="#262626", fg="#ffa500", }, -- lualine_x_diagnostics_warn_replace xxx guifg=#ffa500 guibg=#262626
    lualine_x_diagnostics_warn_command                        { bg="#262626", fg="#ffa500", }, -- lualine_x_diagnostics_warn_command xxx guifg=#ffa500 guibg=#262626
    lualine_x_diagnostics_warn_terminal                       { bg="#262626", fg="#ffa500", }, -- lualine_x_diagnostics_warn_terminal xxx guifg=#ffa500 guibg=#262626
    lualine_x_diagnostics_warn_inactive                       { bg="#262626", fg="#ffa500", }, -- lualine_x_diagnostics_warn_inactive xxx guifg=#ffa500 guibg=#262626
    lualine_x_diagnostics_info_normal                         { bg="#262626", fg="#add8e6", }, -- lualine_x_diagnostics_info_normal xxx guifg=#add8e6 guibg=#262626
    lualine_x_diagnostics_info_insert                         { bg="#262626", fg="#add8e6", }, -- lualine_x_diagnostics_info_insert xxx guifg=#add8e6 guibg=#262626
    lualine_x_diagnostics_info_visual                         { bg="#262626", fg="#add8e6", }, -- lualine_x_diagnostics_info_visual xxx guifg=#add8e6 guibg=#262626
    lualine_x_diagnostics_info_replace                        { bg="#262626", fg="#add8e6", }, -- lualine_x_diagnostics_info_replace xxx guifg=#add8e6 guibg=#262626
    lualine_x_diagnostics_info_command                        { bg="#262626", fg="#add8e6", }, -- lualine_x_diagnostics_info_command xxx guifg=#add8e6 guibg=#262626
    lualine_x_diagnostics_info_terminal                       { bg="#262626", fg="#add8e6", }, -- lualine_x_diagnostics_info_terminal xxx guifg=#add8e6 guibg=#262626
    lualine_x_diagnostics_info_inactive                       { bg="#262626", fg="#add8e6", }, -- lualine_x_diagnostics_info_inactive xxx guifg=#add8e6 guibg=#262626
    lualine_x_diagnostics_hint_normal                         { bg="#262626", fg="#d3d3d3", }, -- lualine_x_diagnostics_hint_normal xxx guifg=#d3d3d3 guibg=#262626
    lualine_x_diagnostics_hint_insert                         { bg="#262626", fg="#d3d3d3", }, -- lualine_x_diagnostics_hint_insert xxx guifg=#d3d3d3 guibg=#262626
    lualine_x_diagnostics_hint_visual                         { bg="#262626", fg="#d3d3d3", }, -- lualine_x_diagnostics_hint_visual xxx guifg=#d3d3d3 guibg=#262626
    lualine_x_diagnostics_hint_replace                        { bg="#262626", fg="#d3d3d3", }, -- lualine_x_diagnostics_hint_replace xxx guifg=#d3d3d3 guibg=#262626
    lualine_x_diagnostics_hint_command                        { bg="#262626", fg="#d3d3d3", }, -- lualine_x_diagnostics_hint_command xxx guifg=#d3d3d3 guibg=#262626
    lualine_x_diagnostics_hint_terminal                       { bg="#262626", fg="#d3d3d3", }, -- lualine_x_diagnostics_hint_terminal xxx guifg=#d3d3d3 guibg=#262626
    lualine_x_diagnostics_hint_inactive                       { bg="#262626", fg="#d3d3d3", }, -- lualine_x_diagnostics_hint_inactive xxx guifg=#d3d3d3 guibg=#262626
    DarkenedPanel                                             { bg="#1c1e24", }, -- DarkenedPanel  xxx guibg=#1c1e24
    DarkenedStatusline                                        { bg="#1c1e24", }, -- DarkenedStatusline xxx guibg=#1c1e24
    DarkenedStatuslineNC                                      { bg="#1c1e24", }, -- DarkenedStatuslineNC xxx cterm=italic guibg=#1c1e24
    htmlH1                                                    { fg="#e06c75", }, -- htmlH1         xxx guifg=#e06c75
    htmlH2                                                    { htmlH1 }, -- htmlH2         xxx links to htmlH1
    htmlH3                                                    { htmlH1 }, -- htmlH3         xxx links to htmlH1
    htmlH4                                                    { htmlH1 }, -- htmlH4         xxx links to htmlH1
    htmlH5                                                    { htmlH1 }, -- htmlH5         xxx links to htmlH1
    htmlH6                                                    { htmlH1 }, -- htmlH6         xxx links to htmlH1
    markdownHeadingDelimiter                                  { fg="#e06c75", }, -- markdownHeadingDelimiter xxx guifg=#e06c75
    markdownH1Delimiter                                       { markdownHeadingDelimiter }, -- markdownH1Delimiter xxx links to markdownHeadingDelimiter
    markdownH2Delimiter                                       { markdownHeadingDelimiter }, -- markdownH2Delimiter xxx links to markdownHeadingDelimiter
    markdownH3Delimiter                                       { markdownHeadingDelimiter }, -- markdownH3Delimiter xxx links to markdownHeadingDelimiter
    markdownH4Delimiter                                       { markdownHeadingDelimiter }, -- markdownH4Delimiter xxx links to markdownHeadingDelimiter
    markdownH5Delimiter                                       { markdownHeadingDelimiter }, -- markdownH5Delimiter xxx links to markdownHeadingDelimiter
    markdownH6Delimiter                                       { markdownHeadingDelimiter }, -- markdownH6Delimiter xxx links to markdownHeadingDelimiter
    markdownCode                                              { fg="#98c379", }, -- markdownCode   xxx guifg=#98c379
    markdownCodeBlock                                         { markdownCode }, -- markdownCodeBlock xxx links to markdownCode
    markdownCodeDelimiter                                     { markdownCode }, -- markdownCodeDelimiter xxx links to markdownCode
    markdownH1                                                { fg="#e06c75", }, -- markdownH1     xxx guifg=#e06c75
    markdownH2                                                { markdownH1 }, -- markdownH2     xxx links to markdownH1
    markdownH3                                                { markdownH1 }, -- markdownH3     xxx links to markdownH1
    markdownH4                                                { markdownH1 }, -- markdownH4     xxx links to markdownH1
    markdownH5                                                { markdownH1 }, -- markdownH5     xxx links to markdownH1
    markdownH6                                                { markdownH1 }, -- markdownH6     xxx links to markdownH1
    debugBreakpoint                                           { fg="#e06c75", }, -- debugBreakpoint xxx guifg=#e06c75
    markdownLinkText                                          { fg="#61afef", }, -- markdownLinkText xxx guifg=#61afef
    LspReferenceText                                          { bg="#53565d", }, -- LspReferenceText xxx guibg=#53565D
    LspReferenceWrite                                         { LspReferenceText }, -- LspReferenceWrite xxx links to LspReferenceText
    LspReferenceRead                                          { LspReferenceText }, -- LspReferenceRead xxx links to LspReferenceText
    TSField                                                   { fg="#abb2bf", }, -- TSField        xxx guifg=#abb2bf
    TSParameter                                               { fg="#e06c75", }, -- TSParameter    xxx guifg=#e06c75
    DashboardFooter                                           { fg="#61afef", }, -- DashboardFooter xxx guifg=#61afef
    TSProperty                                                { fg="#e06c75", }, -- TSProperty     xxx guifg=#e06c75
    TSTagAttribute                                            { TSProperty }, -- TSTagAttribute xxx links to TSProperty
    WhichKeyGroup                                             { fg="#61afef", }, -- WhichKeyGroup  xxx guifg=#61afef
    WhichKeyDesc                                              { fg="#abb2bf", }, -- WhichKeyDesc   xxx guifg=#abb2bf
    TSVariableBuiltin                                         { fg="#e5c07b", }, -- TSVariableBuiltin xxx guifg=#e5c07b
    WhichKeySeparator                                         { fg="#98c379", }, -- WhichKeySeparator xxx guifg=#98c379
    WhichKeyFloat                                             { bg="#282c34", }, -- WhichKeyFloat  xxx guibg=#282c34
    BufferLineIndicatorSelected                               { bg="#282c34", fg="#7d828d", }, -- BufferLineIndicatorSelected xxx guifg=#7d828d guibg=#282c34
    BufferLineFill                                            { bg="#16181c", fg="#7d828d", }, -- BufferLineFill xxx guifg=#7d828d guibg=#16181c
    BufferCurrent                                             { bg="#282c34", fg="#c678dd", }, -- BufferCurrent  xxx guifg=#c678dd guibg=#282c34
    BufferCurrentIndex                                        { BufferCurrent }, -- BufferCurrentIndex xxx links to BufferCurrent
    BufferCurrentMod                                          { fg="#c678dd", }, -- BufferCurrentMod xxx guifg=#c678dd
    BufferCurrentSign                                         { BufferCurrentMod }, -- BufferCurrentSign xxx links to BufferCurrentMod
    BufferCurrentIcon                                         { BufferCurrentMod }, -- BufferCurrentIcon xxx links to BufferCurrentMod
    BufferCurrentTarget                                       { bg="#282c34", fg="#61afef", }, -- BufferCurrentTarget xxx guifg=#61afef guibg=#282c34
    BufferVisibleTarget                                       { BufferCurrentTarget }, -- BufferVisibleTarget xxx links to BufferCurrentTarget
    BufferInactiveTarget                                      { BufferCurrentTarget }, -- BufferInactiveTarget xxx links to BufferCurrentTarget
    BufferVisible                                             { fg="#5c6370", }, -- BufferVisible  xxx guifg=#5c6370
    BufferVisibleIndex                                        { BufferVisible }, -- BufferVisibleIndex xxx links to BufferVisible
    BufferVisibleMod                                          { BufferVisible }, -- BufferVisibleMod xxx links to BufferVisible
    BufferInactive                                            { BufferVisible }, -- BufferInactive xxx links to BufferVisible
    BufferInactiveSign                                        { fg="#282c34", }, -- BufferInactiveSign xxx guifg=#282c34
    BufferTabpages                                            { fg="#c678dd", }, -- BufferTabpages xxx guifg=#c678dd
    HopNextKey                                                { bg="#98c379", fg="#282c34", }, -- HopNextKey     xxx guifg=#282c34 guibg=#98c379
    HopNextKey1                                               { bg="#e5c07b", fg="#282c34", }, -- HopNextKey1    xxx guifg=#282c34 guibg=#e5c07b
    HopNextKey2                                               { HopNextKey1 }, -- HopNextKey2    xxx links to HopNextKey1
    CmpItemKindSnippet                                        { fg="#98c379", }, -- CmpItemKindSnippet xxx guifg=#98c379
    HopUnmatched                                              { fg="#5c6370", }, -- HopUnmatched   xxx guifg=#5c6370
    diffAdded                                                 { fg="#98c379", }, -- diffAdded      xxx guifg=#98c379
    GitSignsAdd                                               { diffAdded }, -- GitSignsAdd    xxx links to diffAdded
    diffChanged                                               { fg="#e5c07b", }, -- diffChanged    xxx guifg=#e5c07b
    GitSignsChange                                            { diffChanged }, -- GitSignsChange xxx links to diffChanged
    diffRemoved                                               { fg="#e06c75", }, -- diffRemoved    xxx guifg=#e06c75
    GitSignsDelete                                            { diffRemoved }, -- GitSignsDelete xxx links to diffRemoved
    CmpItemAbbrMatchFuzzy                                     { fg="#e5c07b", }, -- CmpItemAbbrMatchFuzzy xxx guifg=#e5c07b
    CmpItemAbbrMatch                                          { fg="#56b6c2", gui="bold,italic", }, -- CmpItemAbbrMatch xxx gui=bold,italic guifg=#56b6c2
    CmpItemKindField                                          { fg="#abb2bf", }, -- CmpItemKindField xxx guifg=#abb2bf
    CmpItemKindProperty                                       { fg="#e06c75", }, -- CmpItemKindProperty xxx guifg=#e06c75
    CmpItemKindStruct                                         { fg="#e5c07b", }, -- CmpItemKindStruct xxx guifg=#e5c07b
    CmpItemKindClass                                          { fg="#e5c07b", }, -- CmpItemKindClass xxx guifg=#e5c07b
    CmpItemKindInterface                                      { CmpItemKindClass }, -- CmpItemKindInterface xxx links to CmpItemKindClass
    CmpItemKindConstructor                                    { fg="#56b6c2", }, -- CmpItemKindConstructor xxx guifg=#56b6c2
    CmpItemKindMethod                                         { fg="#61afef", }, -- CmpItemKindMethod xxx guifg=#61afef
    CmpItemKindFunction                                       { CmpItemKindMethod }, -- CmpItemKindFunction xxx links to CmpItemKindMethod
    CmpItemKindValue                                          { fg="#d19a66", }, -- CmpItemKindValue xxx guifg=#d19a66
    CmpItemKindConstant                                       { fg="#98c379", }, -- CmpItemKindConstant xxx guifg=#98c379
    CmpItemKindVariable                                       { fg="#e06c75", }, -- CmpItemKindVariable xxx guifg=#e06c75
    CmpItemKindKeyword                                        { fg="#c678dd", }, -- CmpItemKindKeyword xxx guifg=#c678dd
    CmpItemMenu                                               { fg="#abb2bf", }, -- CmpItemMenu    xxx guifg=#abb2bf
    CmpItemKindDefault                                        { fg="#61afef", }, -- CmpItemKindDefault xxx guifg=#61afef
    CmpItemAbbr                                               { fg="#abb2bf", }, -- CmpItemAbbr    xxx guifg=#abb2bf
    CmpDocumentationBorder                                    { bg="#3d4148", fg="#abb2bf", }, -- CmpDocumentationBorder xxx guifg=#abb2bf guibg=#3D4148
    CmpDocumentation                                          { bg="#3d4148", fg="#abb2bf", }, -- CmpDocumentation xxx guifg=#abb2bf guibg=#3D4148
    WhichKey                                                  { fg="#c678dd", }, -- WhichKey       xxx guifg=#c678dd
    DashboardCenter                                           { fg="#c678dd", }, -- DashboardCenter xxx guifg=#c678dd
    TSNote                                                    { fg="#abb2bf", }, -- TSNote         xxx guifg=#abb2bf
    TSWarning                                                 { fg="#e5c07b", }, -- TSWarning      xxx guifg=#e5c07b
    TSDanger                                                  { fg="#e06c75", }, -- TSDanger       xxx guifg=#e06c75
    TSConstructor                                             { fg="#e5c07b", }, -- TSConstructor  xxx guifg=#e5c07b
    TSKeyword                                                 { fg="#c678dd", }, -- TSKeyword      xxx guifg=#c678dd
    TSKeywordReturn                                           { TSKeyword }, -- TSKeywordReturn xxx links to TSKeyword
    TSKeywordFunction                                         { fg="#c678dd", }, -- TSKeywordFunction xxx guifg=#c678dd
    TSLabel                                                   { fg="#c678dd", }, -- TSLabel        xxx guifg=#c678dd
    TSPunctBracket                                            { fg="#abb2bf", }, -- TSPunctBracket xxx guifg=#abb2bf
    TSPunctSpecial                                            { fg="#abb2bf", }, -- TSPunctSpecial xxx guifg=#abb2bf
    TSStringRegex                                             { fg="#98c379", }, -- TSStringRegex  xxx guifg=#98c379
    TelescopeBorder                                           { fg="#7d828d", }, -- TelescopeBorder xxx guifg=#7D828D
    TelescopePromptBorder                                     { TelescopeBorder }, -- TelescopePromptBorder xxx links to TelescopeBorder
    TelescopeResultsBorder                                    { TelescopeBorder }, -- TelescopeResultsBorder xxx links to TelescopeBorder
    TelescopePreviewBorder                                    { TelescopeBorder }, -- TelescopePreviewBorder xxx links to TelescopeBorder
    TelescopeTitle                                            { TelescopeBorder }, -- TelescopeTitle xxx links to TelescopeBorder
    TSStringEscape                                            { fg="#56b6c2", }, -- TSStringEscape xxx guifg=#56b6c2
    TSVariable                                                { fg="#e06c75", }, -- TSVariable     xxx guifg=#e06c75
    diffNewFile                                               { fg="#e5c07b", }, -- diffNewFile    xxx guifg=#e5c07b
    diffFile                                                  { fg="#e5c07b", }, -- diffFile       xxx guifg=#e5c07b
    diffLine                                                  { fg="#61afef", }, -- diffLine       xxx guifg=#61afef
    TelescopeNormal                                           { fg="#abb2bf", }, -- TelescopeNormal xxx guifg=#abb2bf
    TelescopePreviewNormal                                    { TelescopeNormal }, -- TelescopePreviewNormal xxx links to TelescopeNormal
    TelescopePromptNormal                                     { TelescopeNormal }, -- TelescopePromptNormal xxx links to TelescopeNormal
    TelescopeResultsNormal                                    { TelescopeNormal }, -- TelescopeResultsNormal xxx links to TelescopeNormal
    TelescopePrompt                                           { TelescopeNormal }, -- TelescopePrompt xxx links to TelescopeNormal
    NvimTreeNormalNC                                          { bg="#282c34", }, -- NvimTreeNormalNC xxx guibg=#282c34
    NvimTreeRootFolder                                        { fg="#c678dd", }, -- NvimTreeRootFolder xxx guifg=#c678dd
    NvimTreeGitDirty                                          { fg="#e06c75", }, -- NvimTreeGitDirty xxx guifg=#e06c75
    NvimTreeGitNew                                            { fg="#98c379", }, -- NvimTreeGitNew xxx guifg=#98c379
    NvimTreeGitDeleted                                        { fg="#e06c75", }, -- NvimTreeGitDeleted xxx guifg=#e06c75
    NvimTreeIndentMarker                                      { fg="#5c6370", }, -- NvimTreeIndentMarker xxx guifg=#5c6370
    NvimTreeSymlink                                           { fg="#56b6c2", }, -- NvimTreeSymlink xxx guifg=#56b6c2
    CopilotSuggestion                                         { fg="#808080", }, -- CopilotSuggestion xxx ctermfg=244 guifg=#808080
    CmpItemAbbrDeprecatedDefault                              { fg="#7d828d", }, -- CmpItemAbbrDeprecatedDefault xxx guifg=#7d828d
    CmpItemKind                                               { fg="#61afef", }, -- CmpItemKind    xxx guifg=#61afef
    CmpItemKindStructDefault                                  { CmpItemKind }, -- CmpItemKindStructDefault xxx links to CmpItemKind
    CmpItemKindSnippetDefault                                 { CmpItemKind }, -- CmpItemKindSnippetDefault xxx links to CmpItemKind
    CmpItemKindClassDefault                                   { CmpItemKind }, -- CmpItemKindClassDefault xxx links to CmpItemKind
    CmpItemKindTextDefault                                    { CmpItemKind }, -- CmpItemKindTextDefault xxx links to CmpItemKind
    CmpItemKindFieldDefault                                   { CmpItemKind }, -- CmpItemKindFieldDefault xxx links to CmpItemKind
    CmpItemKindEventDefault                                   { CmpItemKind }, -- CmpItemKindEventDefault xxx links to CmpItemKind
    CmpItemKindFunctionDefault                                { CmpItemKind }, -- CmpItemKindFunctionDefault xxx links to CmpItemKind
    CmpItemKindMethodDefault                                  { CmpItemKind }, -- CmpItemKindMethodDefault xxx links to CmpItemKind
    CmpItemKindTypeParameterDefault                           { CmpItemKind }, -- CmpItemKindTypeParameterDefault xxx links to CmpItemKind
    CmpItemKindInterfaceDefault                               { CmpItemKind }, -- CmpItemKindInterfaceDefault xxx links to CmpItemKind
    CmpItemKindKeywordDefault                                 { CmpItemKind }, -- CmpItemKindKeywordDefault xxx links to CmpItemKind
    CmpItemKindUnitDefault                                    { CmpItemKind }, -- CmpItemKindUnitDefault xxx links to CmpItemKind
    CmpItemKindValueDefault                                   { CmpItemKind }, -- CmpItemKindValueDefault xxx links to CmpItemKind
    CmpItemKindEnumDefault                                    { CmpItemKind }, -- CmpItemKindEnumDefault xxx links to CmpItemKind
    CmpItemKindColorDefault                                   { CmpItemKind }, -- CmpItemKindColorDefault xxx links to CmpItemKind
    CmpItemKindFileDefault                                    { CmpItemKind }, -- CmpItemKindFileDefault xxx links to CmpItemKind
    CmpItemKindReferenceDefault                               { CmpItemKind }, -- CmpItemKindReferenceDefault xxx links to CmpItemKind
    CmpItemKindFolderDefault                                  { CmpItemKind }, -- CmpItemKindFolderDefault xxx links to CmpItemKind
    CmpItemKindEnumMemberDefault                              { CmpItemKind }, -- CmpItemKindEnumMemberDefault xxx links to CmpItemKind
    CmpItemKindOperatorDefault                                { CmpItemKind }, -- CmpItemKindOperatorDefault xxx links to CmpItemKind
    CmpItemKindModuleDefault                                  { CmpItemKind }, -- CmpItemKindModuleDefault xxx links to CmpItemKind
    CmpItemKindVariableDefault                                { CmpItemKind }, -- CmpItemKindVariableDefault xxx links to CmpItemKind
    CmpItemKindPropertyDefault                                { CmpItemKind }, -- CmpItemKindPropertyDefault xxx links to CmpItemKind
    CmpItemKindConstantDefault                                { CmpItemKind }, -- CmpItemKindConstantDefault xxx links to CmpItemKind
    CmpItemKindConstructorDefault                             { CmpItemKind }, -- CmpItemKindConstructorDefault xxx links to CmpItemKind
    CmpItemKindText                                           { fg="#abb2bf", }, -- CmpItemKindText xxx guifg=#abb2bf
    TSConstBuiltin                                            { fg="#c678dd", }, -- TSConstBuiltin xxx guifg=#c678dd
    TSString                                                  { fg="#98c379", }, -- TSString       xxx guifg=#98c379
    TSFunction                                                { fg="#61afef", }, -- TSFunction     xxx guifg=#61afef
    TSFuncBuiltin                                             { fg="#e5c07b", }, -- TSFuncBuiltin  xxx guifg=#e5c07b
    TSFuncMacro                                               { fg="#61afef", }, -- TSFuncMacro    xxx guifg=#61afef
    TSParameterReference                                      { fg="#e06c75", }, -- TSParameterReference xxx guifg=#e06c75
    TSMethod                                                  { fg="#61afef", }, -- TSMethod       xxx guifg=#61afef
    TSAnnotation                                              { fg="#e06c75", }, -- TSAnnotation   xxx guifg=#e06c75
    TSAttribute                                               { fg="#c678dd", }, -- TSAttribute    xxx guifg=#c678dd
    TSNamespace                                               { fg="#e5c07b", }, -- TSNamespace    xxx guifg=#e5c07b
    TSSymbol                                                  { fg="#e06c75", }, -- TSSymbol       xxx guifg=#e06c75
    TSRepeat                                                  { fg="#c678dd", }, -- TSRepeat       xxx guifg=#c678dd
    TSKeywordOperator                                         { fg="#c678dd", }, -- TSKeywordOperator xxx guifg=#c678dd
    TSType                                                    { fg="#e5c07b", }, -- TSType         xxx guifg=#e5c07b
    TSTypeBuiltin                                             { fg="#e5c07b", }, -- TSTypeBuiltin  xxx guifg=#e5c07b
    TSInclude                                                 { fg="#c678dd", }, -- TSInclude      xxx guifg=#c678dd
    TSText                                                    { fg="#abb2bf", }, -- TSText         xxx guifg=#abb2bf
    TSTextReference                                           { TSText }, -- TSTextReference xxx links to TSText
    TSStrong                                                  { fg="#abb2bf", }, -- TSStrong       xxx guifg=#abb2bf
    TSEmphasis                                                { fg="#abb2bf", }, -- TSEmphasis     xxx guifg=#abb2bf
    TSUnderline                                               { fg="#abb2bf", }, -- TSUnderline    xxx guifg=#abb2bf
    TSStrike                                                  { fg="#abb2bf", }, -- TSStrike       xxx guifg=#abb2bf
    TSMath                                                    { fg="#abb2bf", }, -- TSMath         xxx guifg=#abb2bf
    TSTitle                                                   { fg="#abb2bf", }, -- TSTitle        xxx guifg=#abb2bf
    TSLiteral                                                 { fg="#abb2bf", }, -- TSLiteral      xxx guifg=#abb2bf
    TSURI                                                     { fg="#61afef", }, -- TSURI          xxx guifg=#61afef
    TSTag                                                     { fg="#e06c75", }, -- TSTag          xxx guifg=#e06c75
    htmlTag                                                   { TSTag }, -- htmlTag        xxx links to TSTag
    TelescopeSelection                                        { bg="#282c34", fg="#c678dd", }, -- TelescopeSelection xxx guifg=#c678dd guibg=#282c34
    TelescopeSelectionCaret                                   { fg="#c678dd", }, -- TelescopeSelectionCaret xxx guifg=#c678dd
    TelescopeMultiSelection                                   { bg="#282c34", fg="#7d828d", }, -- TelescopeMultiSelection xxx guifg=#7D828D guibg=#282c34
    TelescopeMatching                                         { fg="#98c379", }, -- TelescopeMatching xxx guifg=#98c379
    TelescopePromptPrefix                                     { fg="#c678dd", }, -- TelescopePromptPrefix xxx guifg=#c678dd
    BufferLineError                                           { bg="#1e2127", fg="#7d828d", sp="#e06c75", }, -- BufferLineError xxx guifg=#7d828d guibg=#1e2127 guisp=#e06c75
    BufferLineWarning                                         { bg="#1e2127", fg="#7d828d", sp="#e5c07b", }, -- BufferLineWarning xxx guifg=#7d828d guibg=#1e2127 guisp=#e5c07b
    BufferLineSeparator                                       { bg="#1e2127", fg="#16181c", }, -- BufferLineSeparator xxx guifg=#16181c guibg=#1e2127
    BufferLineBuffer                                          { bg="#1e2127", fg="#7d828d", }, -- BufferLineBuffer xxx guifg=#7d828d guibg=#1e2127
    BufferLineWarningDiagnostic                               { bg="#1e2127", fg="#5d6169", sp="#ab905c", }, -- BufferLineWarningDiagnostic xxx guifg=#5d6169 guibg=#1e2127 guisp=#ab905c
    BufferLineBackground                                      { bg="#1e2127", fg="#7d828d", }, -- BufferLineBackground xxx guifg=#7d828d guibg=#1e2127
    BufferLineWarningVisible                                  { bg="#24282f", fg="#7d828d", }, -- BufferLineWarningVisible xxx guifg=#7d828d guibg=#24282f
    BufferLineInfoDiagnosticSelected                          { bg="#282c34", fg="#4883b3", sp="#4883b3", gui="bold,italic", }, -- BufferLineInfoDiagnosticSelected xxx gui=bold,italic guifg=#4883b3 guibg=#282c34 guisp=#4883b3
    BufferLineInfoDiagnosticVisible                           { bg="#24282f", fg="#5d6169", }, -- BufferLineInfoDiagnosticVisible xxx guifg=#5d6169 guibg=#24282f
    BufferLineInfoDiagnostic                                  { bg="#1e2127", fg="#5d6169", sp="#4883b3", }, -- BufferLineInfoDiagnostic xxx guifg=#5d6169 guibg=#1e2127 guisp=#4883b3
    BufferLineModified                                        { bg="#1e2127", fg="#98c379", }, -- BufferLineModified xxx guifg=#98c379 guibg=#1e2127
    BufferLineInfo                                            { bg="#1e2127", fg="#7d828d", sp="#61afef", }, -- BufferLineInfo xxx guifg=#7d828d guibg=#1e2127 guisp=#61afef
    BufferLineCloseButton                                     { bg="#1e2127", fg="#7d828d", }, -- BufferLineCloseButton xxx guifg=#7d828d guibg=#1e2127
    BufferLineTabClose                                        { bg="#1e2127", fg="#7d828d", }, -- BufferLineTabClose xxx guifg=#7d828d guibg=#1e2127
    BufferLineHintVisible                                     { bg="#24282f", fg="#7d828d", }, -- BufferLineHintVisible xxx guifg=#7d828d guibg=#24282f
    BufferLineHintSelected                                    { bg="#282c34", fg="#56b6c2", sp="#56b6c2", gui="bold,italic", }, -- BufferLineHintSelected xxx gui=bold,italic guifg=#56b6c2 guibg=#282c34 guisp=#56b6c2
    BufferLineHintDiagnostic                                  { bg="#1e2127", fg="#5d6169", sp="#408891", }, -- BufferLineHintDiagnostic xxx guifg=#5d6169 guibg=#1e2127 guisp=#408891
    BufferLineHintDiagnosticVisible                           { bg="#24282f", fg="#5d6169", }, -- BufferLineHintDiagnosticVisible xxx guifg=#5d6169 guibg=#24282f
    BufferLineHintDiagnosticSelected                          { bg="#282c34", fg="#408891", sp="#408891", gui="bold,italic", }, -- BufferLineHintDiagnosticSelected xxx gui=bold,italic guifg=#408891 guibg=#282c34 guisp=#408891
    BufferLineInfoVisible                                     { bg="#24282f", fg="#7d828d", }, -- BufferLineInfoVisible xxx guifg=#7d828d guibg=#24282f
    BufferLineInfoSelected                                    { bg="#282c34", fg="#61afef", sp="#61afef", gui="bold,italic", }, -- BufferLineInfoSelected xxx gui=bold,italic guifg=#61afef guibg=#282c34 guisp=#61afef
    BufferLineCloseButtonVisible                              { bg="#24282f", fg="#7d828d", }, -- BufferLineCloseButtonVisible xxx guifg=#7d828d guibg=#24282f
    BufferLineCloseButtonSelected                             { bg="#282c34", fg="#abb2bf", }, -- BufferLineCloseButtonSelected xxx guifg=#abb2bf guibg=#282c34
    BufferLineBufferVisible                                   { bg="#24282f", fg="#7d828d", }, -- BufferLineBufferVisible xxx guifg=#7d828d guibg=#24282f
    BufferLineBufferSelected                                  { bg="#282c34", fg="#abb2bf", gui="bold,italic", }, -- BufferLineBufferSelected xxx gui=bold,italic guifg=#abb2bf guibg=#282c34
    BufferLineDiagnosticVisible                               { bg="#24282f", fg="#5d6169", }, -- BufferLineDiagnosticVisible xxx guifg=#5d6169 guibg=#24282f
    BufferLineDiagnosticSelected                              { bg="#282c34", fg="#80858f", gui="bold,italic", }, -- BufferLineDiagnosticSelected xxx gui=bold,italic guifg=#80858f guibg=#282c34
    BufferLineWarningDiagnosticVisible                        { bg="#24282f", fg="#5d6169", }, -- BufferLineWarningDiagnosticVisible xxx guifg=#5d6169 guibg=#24282f
    BufferLineWarningDiagnosticSelected                       { bg="#282c34", fg="#ab905c", sp="#ab905c", gui="bold,italic", }, -- BufferLineWarningDiagnosticSelected xxx gui=bold,italic guifg=#ab905c guibg=#282c34 guisp=#ab905c
    BufferLineErrorVisible                                    { bg="#24282f", fg="#7d828d", }, -- BufferLineErrorVisible xxx guifg=#7d828d guibg=#24282f
    BufferLineErrorSelected                                   { bg="#282c34", fg="#e06c75", sp="#e06c75", gui="bold,italic", }, -- BufferLineErrorSelected xxx gui=bold,italic guifg=#e06c75 guibg=#282c34 guisp=#e06c75
    BufferLineErrorDiagnostic                                 { bg="#1e2127", fg="#5d6169", sp="#a85157", }, -- BufferLineErrorDiagnostic xxx guifg=#5d6169 guibg=#1e2127 guisp=#a85157
    BufferLineErrorDiagnosticVisible                          { bg="#24282f", fg="#5d6169", }, -- BufferLineErrorDiagnosticVisible xxx guifg=#5d6169 guibg=#24282f
    BufferLineErrorDiagnosticSelected                         { bg="#282c34", fg="#a85157", sp="#a85157", gui="bold,italic", }, -- BufferLineErrorDiagnosticSelected xxx gui=bold,italic guifg=#a85157 guibg=#282c34 guisp=#a85157
    BufferLineModifiedVisible                                 { bg="#24282f", fg="#98c379", }, -- BufferLineModifiedVisible xxx guifg=#98c379 guibg=#24282f
    BufferLineModifiedSelected                                { bg="#282c34", fg="#98c379", }, -- BufferLineModifiedSelected xxx guifg=#98c379 guibg=#282c34
    BufferLineDuplicateSelected                               { bg="#282c34", fg="#767b85", gui="italic", }, -- BufferLineDuplicateSelected xxx gui=italic guifg=#767b85 guibg=#282c34
    BufferLineDuplicateVisible                                { bg="#24282f", fg="#767b85", gui="italic", }, -- BufferLineDuplicateVisible xxx gui=italic guifg=#767b85 guibg=#24282f
    BufferLineSeparatorSelected                               { bg="#282c34", fg="#16181c", }, -- BufferLineSeparatorSelected xxx guifg=#16181c guibg=#282c34
    BufferLineSeparatorVisible                                { bg="#24282f", fg="#16181c", }, -- BufferLineSeparatorVisible xxx guifg=#16181c guibg=#24282f
    BufferLinePickSelected                                    { bg="#282c34", fg="#e06c75", gui="bold,italic", }, -- BufferLinePickSelected xxx gui=bold,italic guifg=#e06c75 guibg=#282c34
    BufferLinePickVisible                                     { bg="#24282f", fg="#e06c75", gui="bold,italic", }, -- BufferLinePickVisible xxx gui=bold,italic guifg=#e06c75 guibg=#24282f
    BufferLineTab                                             { bg="#1e2127", fg="#7d828d", }, -- BufferLineTab  xxx guifg=#7d828d guibg=#1e2127
    BufferLinePick                                            { bg="#1e2127", fg="#e06c75", gui="bold,italic", }, -- BufferLinePick xxx gui=bold,italic guifg=#e06c75 guibg=#1e2127
    BufferLineDiagnostic                                      { bg="#1e2127", fg="#5d6169", }, -- BufferLineDiagnostic xxx guifg=#5d6169 guibg=#1e2127
    BufferLineTabSelected                                     { bg="#282c34", fg="#7d828d", }, -- BufferLineTabSelected xxx guifg=#7d828d guibg=#282c34
    BufferLineGroupLabel                                      { bg="#7d828d", fg="#16181c", }, -- BufferLineGroupLabel xxx guifg=#16181c guibg=#7d828d
    BufferLineGroupSeparator                                  { bg="#16181c", fg="#7d828d", }, -- BufferLineGroupSeparator xxx guifg=#7d828d guibg=#16181c
    BufferLineWarningSelected                                 { bg="#282c34", fg="#e5c07b", sp="#e5c07b", gui="bold,italic", }, -- BufferLineWarningSelected xxx gui=bold,italic guifg=#e5c07b guibg=#282c34 guisp=#e5c07b
    BufferLineDuplicate                                       { bg="#1e2127", fg="#767b85", gui="italic", }, -- BufferLineDuplicate xxx gui=italic guifg=#767b85 guibg=#1e2127
    BufferLineHint                                            { bg="#1e2127", fg="#7d828d", sp="#56b6c2", }, -- BufferLineHint xxx guifg=#7d828d guibg=#1e2127 guisp=#56b6c2
    DevIconKotlin                                             { fg="#f88a02", }, -- DevIconKotlin  xxx ctermfg=208 guifg=#F88A02
    DevIconPng                                                { fg="#a074c4", }, -- DevIconPng     xxx ctermfg=140 guifg=#a074c4
    DevIconLeex                                               { fg="#a074c4", }, -- DevIconLeex    xxx ctermfg=140 guifg=#a074c4
    DevIconCobol                                              { fg="#005ca5", }, -- DevIconCobol   xxx ctermfg=25 guifg=#005ca5
    DevIconLess                                               { fg="#563d7c", }, -- DevIconLess    xxx ctermfg=60 guifg=#563d7c
    DevIconTs                                                 { fg="#519aba", }, -- DevIconTs      xxx ctermfg=67 guifg=#519aba
    DevIconLicense                                            { fg="#cbcb41", }, -- DevIconLicense xxx ctermfg=185 guifg=#cbcb41
    DevIconDefault                                            { fg="#6d8086", }, -- DevIconDefault xxx ctermfg=66 guifg=#6d8086
    DevIconMakefile                                           { fg="#6d8086", }, -- DevIconMakefile xxx ctermfg=66 guifg=#6d8086
    DevIconMaterial                                           { fg="#b83998", }, -- DevIconMaterial xxx ctermfg=132 guifg=#B83998
    DevIconPsb                                                { fg="#519aba", }, -- DevIconPsb     xxx ctermfg=67 guifg=#519aba
    DevIconMd                                                 { fg="#519aba", }, -- DevIconMd      xxx ctermfg=67 guifg=#519aba
    DevIconMdx                                                { fg="#519aba", }, -- DevIconMdx     xxx ctermfg=67 guifg=#519aba
    DevIconMint                                               { fg="#87c095", }, -- DevIconMint    xxx ctermfg=108 guifg=#87c095
    DevIconPyc                                                { fg="#ffe291", }, -- DevIconPyc     xxx ctermfg=67 guifg=#ffe291
    DevIconD                                                  { fg="#427819", }, -- DevIconD       xxx ctermfg=64 guifg=#427819
    DevIconMixLock                                            { fg="#a074c4", }, -- DevIconMixLock xxx ctermfg=140 guifg=#a074c4
    DevIconPyd                                                { fg="#ffe291", }, -- DevIconPyd     xxx ctermfg=67 guifg=#ffe291
    DevIconMjs                                                { fg="#f1e05a", }, -- DevIconMjs     xxx ctermfg=221 guifg=#f1e05a
    DevIconPyo                                                { fg="#ffe291", }, -- DevIconPyo     xxx ctermfg=67 guifg=#ffe291
    DevIconMl                                                 { fg="#e37933", }, -- DevIconMl      xxx ctermfg=173 guifg=#e37933
    DevIconRake                                               { fg="#701516", }, -- DevIconRake    xxx ctermfg=52 guifg=#701516
    DevIconDockerfile                                         { fg="#384d54", }, -- DevIconDockerfile xxx ctermfg=59 guifg=#384d54
    DevIconRakefile                                           { fg="#701516", }, -- DevIconRakefile xxx ctermfg=52 guifg=#701516
    DevIconMli                                                { fg="#e37933", }, -- DevIconMli     xxx ctermfg=173 guifg=#e37933
    DevIconCMakeLists                                         { fg="#6d8086", }, -- DevIconCMakeLists xxx ctermfg=66 guifg=#6d8086
    DevIconMustache                                           { fg="#e37933", }, -- DevIconMustache xxx ctermfg=173 guifg=#e37933
    DevIconNim                                                { fg="#f3d400", }, -- DevIconNim     xxx ctermfg=220 guifg=#f3d400
    DevIconGitLogo                                            { fg="#f14c28", }, -- DevIconGitLogo xxx ctermfg=202 guifg=#F14C28
    DevIconRproj                                              { fg="#358a5b", }, -- DevIconRproj   xxx ctermfg=65 guifg=#358a5b
    DevIconRs                                                 { fg="#dea584", }, -- DevIconRs      xxx ctermfg=180 guifg=#dea584
    DevIconLhs                                                { fg="#a074c4", }, -- DevIconLhs     xxx ctermfg=140 guifg=#a074c4
    DevIconFish                                               { fg="#4d5a5e", }, -- DevIconFish    xxx ctermfg=59 guifg=#4d5a5e
    DevIconOPUS                                               { fg="#f88a02", }, -- DevIconOPUS    xxx ctermfg=208 guifg=#F88A02
    DevIconSass                                               { fg="#f55385", }, -- DevIconSass    xxx ctermfg=204 guifg=#f55385
    DevIconPhp                                                { fg="#a074c4", }, -- DevIconPhp     xxx ctermfg=140 guifg=#a074c4
    DevIconGitIgnore                                          { fg="#41535b", }, -- DevIconGitIgnore xxx ctermfg=59 guifg=#41535b
    DevIconJava                                               { fg="#cc3e44", }, -- DevIconJava    xxx ctermfg=167 guifg=#cc3e44
    DevIconPackageLockJson                                    { fg="#7a0d21", }, -- DevIconPackageLockJson xxx guifg=#7a0d21
    DevIconSig                                                { fg="#e37933", }, -- DevIconSig     xxx ctermfg=173 guifg=#e37933
    DevIconPackedResource                                     { fg="#6d8086", }, -- DevIconPackedResource xxx ctermfg=66 guifg=#6d8086
    DevIconPdf                                                { fg="#b30b00", }, -- DevIconPdf     xxx ctermfg=124 guifg=#b30b00
    DevIconSml                                                { fg="#e37933", }, -- DevIconSml     xxx ctermfg=173 guifg=#e37933
    DevIconCss                                                { fg="#563d7c", }, -- DevIconCss     xxx ctermfg=60 guifg=#563d7c
    DevIconSql                                                { fg="#dad8d8", }, -- DevIconSql     xxx ctermfg=188 guifg=#dad8d8
    DevIconScss                                               { fg="#f55385", }, -- DevIconScss    xxx ctermfg=204 guifg=#f55385
    DevIconPl                                                 { fg="#519aba", }, -- DevIconPl      xxx ctermfg=67 guifg=#519aba
    DevIconDump                                               { fg="#dad8d8", }, -- DevIconDump    xxx ctermfg=188 guifg=#dad8d8
    DevIconSuo                                                { fg="#e37933", }, -- DevIconSuo     xxx ctermfg=98 guifg=#e37933
    DevIconSvg                                                { fg="#ffb13b", }, -- DevIconSvg     xxx ctermfg=215 guifg=#FFB13B
    DevIconEex                                                { fg="#a074c4", }, -- DevIconEex     xxx ctermfg=140 guifg=#a074c4
    DevIconHeex                                               { fg="#a074c4", }, -- DevIconHeex    xxx ctermfg=140 guifg=#a074c4
    DevIconZsh                                                { fg="#89e051", }, -- DevIconZsh     xxx ctermfg=113 guifg=#89e051
    DevIconTextResource                                       { fg="#cbcb41", }, -- DevIconTextResource xxx ctermfg=185 guifg=#cbcb41
    DevIconSwift                                              { fg="#e37933", }, -- DevIconSwift   xxx ctermfg=173 guifg=#e37933
    DevIconTextScene                                          { fg="#a074c4", }, -- DevIconTextScene xxx ctermfg=140 guifg=#a074c4
    DevIconCs                                                 { fg="#596706", }, -- DevIconCs      xxx ctermfg=58 guifg=#596706
    DevIconTwig                                               { fg="#8dc149", }, -- DevIconTwig    xxx ctermfg=107 guifg=#8dc149
    DevIconTxt                                                { fg="#89e051", }, -- DevIconTxt     xxx ctermfg=113 guifg=#89e051
    DevIconPsd                                                { fg="#519aba", }, -- DevIconPsd     xxx ctermfg=67 guifg=#519aba
    DevIconCPlusPlus                                          { fg="#f34b7d", }, -- DevIconCPlusPlus xxx ctermfg=204 guifg=#f34b7d
    DevIconWebmanifest                                        { fg="#f1e05a", }, -- DevIconWebmanifest xxx ctermfg=221 guifg=#f1e05a
    DevIconPp                                                 { fg="#ffa61a", }, -- DevIconPp      xxx guifg=#FFA61A
    DevIconWebp                                               { fg="#a074c4", }, -- DevIconWebp    xxx ctermfg=140 guifg=#a074c4
    DevIconClojure                                            { fg="#8dc149", }, -- DevIconClojure xxx ctermfg=107 guifg=#8dc149
    DevIconWebpack                                            { fg="#519aba", }, -- DevIconWebpack xxx ctermfg=67 guifg=#519aba
    DevIconCsv                                                { fg="#89e051", }, -- DevIconCsv     xxx ctermfg=113 guifg=#89e051
    DevIconXml                                                { fg="#e37933", }, -- DevIconXml     xxx ctermfg=173 guifg=#e37933
    DevIconAi                                                 { fg="#cbcb41", }, -- DevIconAi      xxx ctermfg=185 guifg=#cbcb41
    DevIconDart                                               { fg="#03589c", }, -- DevIconDart    xxx ctermfg=25 guifg=#03589C
    DevIconXls                                                { fg="#207245", }, -- DevIconXls     xxx ctermfg=23 guifg=#207245
    DevIconPm                                                 { fg="#519aba", }, -- DevIconPm      xxx ctermfg=67 guifg=#519aba
    DevIconEpp                                                { fg="#ffa61a", }, -- DevIconEpp     xxx guifg=#FFA61A
    DevIconClojureC                                           { fg="#8dc149", }, -- DevIconClojureC xxx ctermfg=107 guifg=#8dc149
    DevIconSlim                                               { fg="#e34c26", }, -- DevIconSlim    xxx ctermfg=166 guifg=#e34c26
    DevIconClojureJS                                          { fg="#519aba", }, -- DevIconClojureJS xxx ctermfg=67 guifg=#519aba
    DevIconXul                                                { fg="#e37933", }, -- DevIconXul     xxx ctermfg=173 guifg=#e37933
    DevIconGruntfile                                          { fg="#e37933", }, -- DevIconGruntfile xxx ctermfg=173 guifg=#e37933
    DevIconTerminal                                           { fg="#31b53e", }, -- DevIconTerminal xxx ctermfg=71 guifg=#31B53E
    DevIconDesktopEntry                                       { fg="#563d7c", }, -- DevIconDesktopEntry xxx ctermfg=60 guifg=#563d7c
    DevIconYml                                                { fg="#6d8086", }, -- DevIconYml     xxx ctermfg=66 guifg=#6d8086
    DevIconCoffee                                             { fg="#cbcb41", }, -- DevIconCoffee  xxx ctermfg=185 guifg=#cbcb41
    DevIconJpg                                                { fg="#a074c4", }, -- DevIconJpg     xxx ctermfg=140 guifg=#a074c4
    DevIconGodotProject                                       { fg="#6d8086", }, -- DevIconGodotProject xxx ctermfg=66 guifg=#6d8086
    DevIconGitCommit                                          { fg="#41535b", }, -- DevIconGitCommit xxx ctermfg=59 guifg=#41535b
    DevIconConfigRu                                           { fg="#701516", }, -- DevIconConfigRu xxx ctermfg=52 guifg=#701516
    DevIconJpeg                                               { fg="#a074c4", }, -- DevIconJpeg    xxx ctermfg=140 guifg=#a074c4
    DevIconDropbox                                            { fg="#0061fe", }, -- DevIconDropbox xxx ctermfg=27 guifg=#0061FE
    DevIconEjs                                                { fg="#cbcb41", }, -- DevIconEjs     xxx ctermfg=185 guifg=#cbcb41
    DevIconCrystal                                            { fg="#000000", }, -- DevIconCrystal xxx ctermfg=16 guifg=#000000
    DevIconFsi                                                { fg="#519aba", }, -- DevIconFsi     xxx ctermfg=67 guifg=#519aba
    DevIconEdn                                                { fg="#519aba", }, -- DevIconEdn     xxx ctermfg=67 guifg=#519aba
    DevIconHtml                                               { fg="#e34c26", }, -- DevIconHtml    xxx ctermfg=166 guifg=#e34c26
    DevIconRb                                                 { fg="#701516", }, -- DevIconRb      xxx ctermfg=52 guifg=#701516
    DevIconGemfile                                            { fg="#701516", }, -- DevIconGemfile xxx ctermfg=52 guifg=#701516
    DevIconGDScript                                           { fg="#6d8086", }, -- DevIconGDScript xxx ctermfg=66 guifg=#6d8086
    DevIconJl                                                 { fg="#a270ba", }, -- DevIconJl      xxx ctermfg=133 guifg=#a270ba
    DevIconYaml                                               { fg="#6d8086", }, -- DevIconYaml    xxx ctermfg=66 guifg=#6d8086
    DevIconConf                                               { fg="#6d8086", }, -- DevIconConf    xxx ctermfg=66 guifg=#6d8086
    DevIconCson                                               { fg="#cbcb41", }, -- DevIconCson    xxx ctermfg=185 guifg=#cbcb41
    DevIconBabelrc                                            { fg="#cbcb41", }, -- DevIconBabelrc xxx ctermfg=185 guifg=#cbcb41
    DevIconScala                                              { fg="#cc3e44", }, -- DevIconScala   xxx ctermfg=167 guifg=#cc3e44
    DevIconVimrc                                              { fg="#019833", }, -- DevIconVimrc   xxx ctermfg=29 guifg=#019833
    DevIconErb                                                { fg="#701516", }, -- DevIconErb     xxx ctermfg=52 guifg=#701516
    DevIconIni                                                { fg="#6d8086", }, -- DevIconIni     xxx ctermfg=66 guifg=#6d8086
    DevIconBashProfile                                        { fg="#89e051", }, -- DevIconBashProfile xxx ctermfg=113 guifg=#89e051
    DevIconElm                                                { fg="#519aba", }, -- DevIconElm     xxx ctermfg=67 guifg=#519aba
    DevIconFs                                                 { fg="#519aba", }, -- DevIconFs      xxx ctermfg=67 guifg=#519aba
    DevIconMarkdown                                           { fg="#519aba", }, -- DevIconMarkdown xxx ctermfg=67 guifg=#519aba
    DevIconDiff                                               { fg="#41535b", }, -- DevIconDiff    xxx ctermfg=59 guifg=#41535b
    DevIconExs                                                { fg="#a074c4", }, -- DevIconExs     xxx ctermfg=140 guifg=#a074c4
    DevIconR                                                  { fg="#358a5b", }, -- DevIconR       xxx ctermfg=65 guifg=#358a5b
    DevIconFsharp                                             { fg="#519aba", }, -- DevIconFsharp  xxx ctermfg=67 guifg=#519aba
    DevIconProcfile                                           { fg="#a074c4", }, -- DevIconProcfile xxx ctermfg=140 guifg=#a074c4
    DevIconGitAttributes                                      { fg="#41535b", }, -- DevIconGitAttributes xxx ctermfg=59 guifg=#41535b
    DevIconFavicon                                            { fg="#cbcb41", }, -- DevIconFavicon xxx ctermfg=185 guifg=#cbcb41
    DevIconHh                                                 { fg="#a074c4", }, -- DevIconHh      xxx ctermfg=140 guifg=#a074c4
    DevIconGitConfig                                          { fg="#41535b", }, -- DevIconGitConfig xxx ctermfg=59 guifg=#41535b
    DevIconDoc                                                { fg="#185abd", }, -- DevIconDoc     xxx ctermfg=25 guifg=#185abd
    DevIconProlog                                             { fg="#e4b854", }, -- DevIconProlog  xxx ctermfg=179 guifg=#e4b854
    DevIconGitlabCI                                           { fg="#e24329", }, -- DevIconGitlabCI xxx ctermfg=166 guifg=#e24329
    DevIconH                                                  { fg="#a074c4", }, -- DevIconH       xxx ctermfg=140 guifg=#a074c4
    DevIconFsscript                                           { fg="#519aba", }, -- DevIconFsscript xxx ctermfg=67 guifg=#519aba
    DevIconRmd                                                { fg="#519aba", }, -- DevIconRmd     xxx ctermfg=67 guifg=#519aba
    DevIconFsx                                                { fg="#519aba", }, -- DevIconFsx     xxx ctermfg=67 guifg=#519aba
    DevIconGitModules                                         { fg="#41535b", }, -- DevIconGitModules xxx ctermfg=59 guifg=#41535b
    DevIconPpt                                                { fg="#cb4a32", }, -- DevIconPpt     xxx ctermfg=167 guifg=#cb4a32
    DevIconGemspec                                            { fg="#701516", }, -- DevIconGemspec xxx ctermfg=52 guifg=#701516
    DevIconJson                                               { fg="#cbcb41", }, -- DevIconJson    xxx ctermfg=185 guifg=#cbcb41
    DevIconVim                                                { fg="#019833", }, -- DevIconVim     xxx ctermfg=29 guifg=#019833
    DevIconConfiguration                                      { fg="#ececec", }, -- DevIconConfiguration xxx ctermfg=231 guifg=#ECECEC
    DevIconBashrc                                             { fg="#89e051", }, -- DevIconBashrc  xxx ctermfg=113 guifg=#89e051
    DevIconNPMIgnore                                          { fg="#e8274b", }, -- DevIconNPMIgnore xxx ctermfg=161 guifg=#E8274B
    DevIconNodeModules                                        { fg="#e8274b", }, -- DevIconNodeModules xxx ctermfg=161 guifg=#E8274B
    DevIconBinaryGLTF                                         { fg="#ffb13b", }, -- DevIconBinaryGLTF xxx ctermfg=215 guifg=#FFB13B
    DevIconGo                                                 { fg="#519aba", }, -- DevIconGo      xxx ctermfg=67 guifg=#519aba
    DevIconErl                                                { fg="#b83998", }, -- DevIconErl     xxx ctermfg=132 guifg=#B83998
    DevIconSettingsJson                                       { fg="#854cc7", }, -- DevIconSettingsJson xxx ctermfg=98 guifg=#854CC7
    DevIconGvimrc                                             { fg="#019833", }, -- DevIconGvimrc  xxx ctermfg=29 guifg=#019833
    DevIconEx                                                 { fg="#a074c4", }, -- DevIconEx      xxx ctermfg=140 guifg=#a074c4
    DevIconPy                                                 { fg="#ffbc03", }, -- DevIconPy      xxx ctermfg=61 guifg=#ffbc03
    DevIconLua                                                { fg="#51a0cf", }, -- DevIconLua     xxx ctermfg=74 guifg=#51a0cf
    DevIconZshprofile                                         { fg="#89e051", }, -- DevIconZshprofile xxx ctermfg=113 guifg=#89e051
    DevIconBash                                               { fg="#89e051", }, -- DevIconBash    xxx ctermfg=113 guifg=#89e051
    DevIconZshenv                                             { fg="#89e051", }, -- DevIconZshenv  xxx ctermfg=113 guifg=#89e051
    DevIconPromptPs1                                          { fg="#4d5a5e", }, -- DevIconPromptPs1 xxx ctermfg=59 guifg=#4d5a5e
    DevIconZshrc                                              { fg="#89e051", }, -- DevIconZshrc   xxx ctermfg=113 guifg=#89e051
    DevIconC                                                  { fg="#599eff", }, -- DevIconC       xxx ctermfg=75 guifg=#599eff
    DevIconBrewfile                                           { fg="#701516", }, -- DevIconBrewfile xxx ctermfg=52 guifg=#701516
    DevIconDb                                                 { fg="#dad8d8", }, -- DevIconDb      xxx ctermfg=188 guifg=#dad8d8
    DevIconDsStore                                            { fg="#41535b", }, -- DevIconDsStore xxx ctermfg=59 guifg=#41535b
    DevIconHaml                                               { fg="#eaeae1", }, -- DevIconHaml    xxx ctermfg=188 guifg=#eaeae1
    DevIconNPMrc                                              { fg="#e8274b", }, -- DevIconNPMrc   xxx ctermfg=161 guifg=#E8274B
    DevIconHbs                                                { fg="#f0772b", }, -- DevIconHbs     xxx ctermfg=208 guifg=#f0772b
    DevIconAwk                                                { fg="#4d5a5e", }, -- DevIconAwk     xxx ctermfg=59 guifg=#4d5a5e
    DevIconStyl                                               { fg="#8dc149", }, -- DevIconStyl    xxx ctermfg=107 guifg=#8dc149
    DevIconCxx                                                { fg="#519aba", }, -- DevIconCxx     xxx ctermfg=67 guifg=#519aba
    DevIconHpp                                                { fg="#a074c4", }, -- DevIconHpp     xxx ctermfg=140 guifg=#a074c4
    DevIconCp                                                 { fg="#519aba", }, -- DevIconCp      xxx ctermfg=67 guifg=#519aba
    DevIconHrl                                                { fg="#b83998", }, -- DevIconHrl     xxx ctermfg=132 guifg=#B83998
    DevIconGulpfile                                           { fg="#cc3e44", }, -- DevIconGulpfile xxx ctermfg=167 guifg=#cc3e44
    DevIconHs                                                 { fg="#a074c4", }, -- DevIconHs      xxx ctermfg=140 guifg=#a074c4
    DevIconNix                                                { fg="#7ebae4", }, -- DevIconNix     xxx ctermfg=110 guifg=#7ebae4
    DevIconHtm                                                { fg="#e34c26", }, -- DevIconHtm     xxx ctermfg=166 guifg=#e34c26
    DevIconPackageJson                                        { fg="#e8274b", }, -- DevIconPackageJson xxx guifg=#e8274b
    DevIconJs                                                 { fg="#cbcb41", }, -- DevIconJs      xxx ctermfg=185 guifg=#cbcb41
    DevIconSvelte                                             { fg="#ff3e00", }, -- DevIconSvelte  xxx ctermfg=202 guifg=#ff3e00
    DevIconHxx                                                { fg="#a074c4", }, -- DevIconHxx     xxx ctermfg=140 guifg=#a074c4
    DevIconGif                                                { fg="#a074c4", }, -- DevIconGif     xxx ctermfg=140 guifg=#a074c4
    DevIconIco                                                { fg="#cbcb41", }, -- DevIconIco     xxx ctermfg=185 guifg=#cbcb41
    DevIconVagrantfile                                        { fg="#1563ff", }, -- DevIconVagrantfile xxx ctermfg=27 guifg=#1563FF
    DevIconImportConfiguration                                { fg="#ececec", }, -- DevIconImportConfiguration xxx ctermfg=231 guifg=#ECECEC
    DevIconCpp                                                { fg="#519aba", }, -- DevIconCpp     xxx ctermfg=67 guifg=#519aba
    DevIconXcPlayground                                       { fg="#e37933", }, -- DevIconXcPlayground xxx ctermfg=173 guifg=#e37933
    DevIconTor                                                { fg="#519aba", }, -- DevIconTor     xxx ctermfg=67 guifg=#519aba
    DevIconJsx                                                { fg="#519aba", }, -- DevIconJsx     xxx ctermfg=67 guifg=#519aba
    DevIconTex                                                { fg="#3d6117", }, -- DevIconTex     xxx ctermfg=58 guifg=#3D6117
    DevIconSolidity                                           { fg="#519aba", }, -- DevIconSolidity xxx ctermfg=67 guifg=#519aba
    DevIconVue                                                { fg="#8dc149", }, -- DevIconVue     xxx ctermfg=107 guifg=#8dc149
    DevIconZig                                                { fg="#f69a1b", }, -- DevIconZig     xxx ctermfg=208 guifg=#f69a1b
    DevIconToml                                               { fg="#6d8086", }, -- DevIconToml    xxx ctermfg=66 guifg=#6d8086
    DevIconTsx                                                { fg="#519aba", }, -- DevIconTsx     xxx ctermfg=67 guifg=#519aba
    DevIconBat                                                { fg="#c1f12e", }, -- DevIconBat     xxx ctermfg=154 guifg=#C1F12E
    DevIconCsh                                                { fg="#4d5a5e", }, -- DevIconCsh     xxx ctermfg=59 guifg=#4d5a5e
    DevIconCMake                                              { fg="#6d8086", }, -- DevIconCMake   xxx ctermfg=66 guifg=#6d8086
    DevIconSln                                                { fg="#854cc7", }, -- DevIconSln     xxx ctermfg=98 guifg=#854CC7
    DevIconBmp                                                { fg="#a074c4", }, -- DevIconBmp     xxx ctermfg=140 guifg=#a074c4
    DevIconSh                                                 { fg="#4d5a5e", }, -- DevIconSh      xxx ctermfg=59 guifg=#4d5a5e
    DevIconRss                                                { fg="#fb9d3b", }, -- DevIconRss     xxx ctermfg=215 guifg=#FB9D3B
    DevIconRlib                                               { fg="#dea584", }, -- DevIconRlib    xxx ctermfg=180 guifg=#dea584
    DevIconOpenTypeFont                                       { fg="#ececec", }, -- DevIconOpenTypeFont xxx ctermfg=231 guifg=#ECECEC
    DevIconKsh                                                { fg="#4d5a5e", }, -- DevIconKsh     xxx ctermfg=59 guifg=#4d5a5e
    lualine_transitional_lualine_a_normal_to_lualine_b_normal { bg="#262626", fg="#608b4e", }, -- lualine_transitional_lualine_a_normal_to_lualine_b_normal xxx guifg=#608B4E guibg=#262626
    lualine_transitional_lualine_a_insert_to_lualine_b_insert { bg="#262626", fg="#569cd6", }, -- lualine_transitional_lualine_a_insert_to_lualine_b_insert xxx guifg=#569CD6 guibg=#262626
    htmlTagN                                                  { fg="#e06c75", }, -- htmlTagN       xxx guifg=#e06c75
    htmlArg                                                   { fg="#c678dd", gui="bold,italic", }, -- htmlArg        xxx gui=bold,italic guifg=#c678dd
    htmlTagName                                               { fg="#e06c75", }, -- htmlTagName    xxx guifg=#e06c75
    htmlSpecialTagName                                        { fg="#e06c75", }, -- htmlSpecialTagName xxx guifg=#e06c75
    htmlLink                                                  { fg="#56b6c2", }, -- htmlLink       xxx guifg=#56b6c2
    htmlBold                                                  { fg="#d19a66", }, -- htmlBold       xxx guifg=#d19a66
    htmlItalic                                                { fg="#c678dd", }, -- htmlItalic     xxx guifg=#c678dd
    htmlTitle                                                 { fg="#abb2bf", }, -- htmlTitle      xxx guifg=#abb2bf
    javaScriptNull                                            { fg="#d19a66", }, -- javaScriptNull xxx guifg=#d19a66
    javaScriptIdentifier                                      { fg="#c678dd", }, -- javaScriptIdentifier xxx guifg=#c678dd
    javaScriptReserved                                        { fg="#c678dd", }, -- javaScriptReserved xxx guifg=#c678dd
    javaScriptFunction                                        { fg="#c678dd", }, -- javaScriptFunction xxx guifg=#c678dd
    javaScriptBraces                                          { fg="#e06c75", }, -- javaScriptBraces xxx guifg=#e06c75
    cssTagName                                                { fg="#e06c75", }, -- cssTagName     xxx guifg=#e06c75
    cssAttributeSelector                                      { fg="#98c379", }, -- cssAttributeSelector xxx guifg=#98c379
    cssClassNameDot                                           { fg="#d19a66", }, -- cssClassNameDot xxx guifg=#d19a66
    cssClassName                                              { fg="#d19a66", }, -- cssClassName   xxx guifg=#d19a66
    cssIdentifier                                             { fg="#61afef", }, -- cssIdentifier  xxx guifg=#61afef
    cssFunctionName                                           { fg="#61afef", }, -- cssFunctionName xxx guifg=#61afef
    cssFontAttr                                               { fg="#d19a66", }, -- cssFontAttr    xxx guifg=#d19a66
    cssDefinition                                             { fg="#c678dd", gui="bold,italic", }, -- cssDefinition  xxx gui=bold,italic guifg=#c678dd
    cssSelectorOp                                             { cssDefinition }, -- cssSelectorOp  xxx links to cssDefinition
    cssSelectorOp2                                            { cssDefinition }, -- cssSelectorOp2 xxx links to cssDefinition
    cssImportant                                              { cssDefinition }, -- cssImportant   xxx links to cssDefinition
    cssFontDescriptor                                         { cssDefinition }, -- cssFontDescriptor xxx links to cssDefinition
    cssIncludeKeyword                                         { cssDefinition }, -- cssIncludeKeyword xxx links to cssDefinition
    cssBraces                                                 { fg="#e06c75", }, -- cssBraces      xxx guifg=#e06c75
    cssAttrComma                                              { fg="#c678dd", }, -- cssAttrComma   xxx guifg=#c678dd
    cssPseudoClassId                                          { fg="#d19a66", }, -- cssPseudoClassId xxx guifg=#d19a66
    cssMediaType                                              { fg="#d19a66", }, -- cssMediaType   xxx guifg=#d19a66
    cssProp                                                   { fg="#abb2bf", }, -- cssProp        xxx guifg=#abb2bf
    cssAnimationProp                                          { cssProp }, -- cssAnimationProp xxx links to cssProp
    cssBackgroundProp                                         { cssProp }, -- cssBackgroundProp xxx links to cssProp
    cssBorderProp                                             { cssProp }, -- cssBorderProp  xxx links to cssProp
    cssBoxProp                                                { cssProp }, -- cssBoxProp     xxx links to cssProp
    cssCascadeProp                                            { cssProp }, -- cssCascadeProp xxx links to cssProp
    cssColorProp                                              { cssProp }, -- cssColorProp   xxx links to cssProp
    cssDimensionProp                                          { cssProp }, -- cssDimensionProp xxx links to cssProp
    cssFlexibleBoxProp                                        { cssProp }, -- cssFlexibleBoxProp xxx links to cssProp
    cssFontProp                                               { cssProp }, -- cssFontProp    xxx links to cssProp
    cssMultiColumnProp                                        { cssProp }, -- cssMultiColumnProp xxx links to cssProp
    cssInteractProp                                           { cssProp }, -- cssInteractProp xxx links to cssProp
    cssGeneratedContentProp                                   { cssProp }, -- cssGeneratedContentProp xxx links to cssProp
    cssGridProp                                               { cssProp }, -- cssGridProp    xxx links to cssProp
    cssHyerlinkProp                                           { cssProp }, -- cssHyerlinkProp xxx links to cssProp
    cssListProp                                               { cssProp }, -- cssListProp    xxx links to cssProp
    cssObjectProp                                             { cssProp }, -- cssObjectProp  xxx links to cssProp
    cssPositioningProp                                        { cssProp }, -- cssPositioningProp xxx links to cssProp
    cssTableProp                                              { cssProp }, -- cssTableProp   xxx links to cssProp
    cssTextProp                                               { cssProp }, -- cssTextProp    xxx links to cssProp
    cssTransformProp                                          { cssProp }, -- cssTransformProp xxx links to cssProp
    cssTransitionProp                                         { cssProp }, -- cssTransitionProp xxx links to cssProp
    cssUIProp                                                 { cssProp }, -- cssUIProp      xxx links to cssProp
    cssIEUIProp                                               { cssProp }, -- cssIEUIProp    xxx links to cssProp
    cssAuralProp                                              { cssProp }, -- cssAuralProp   xxx links to cssProp
    cssMobileTextProp                                         { cssProp }, -- cssMobileTextProp xxx links to cssProp
    cssMediaProp                                              { cssProp }, -- cssMediaProp   xxx links to cssProp
    cssPageProp                                               { cssProp }, -- cssPageProp    xxx links to cssProp
    cssFontDescriptorProp                                     { cssProp }, -- cssFontDescriptorProp xxx links to cssProp
    cssContentForPagedMediaProp                               { cssProp }, -- cssContentForPagedMediaProp xxx links to cssProp
    cssLineboxProp                                            { cssProp }, -- cssLineboxProp xxx links to cssProp
    cssMarqueeProp                                            { cssProp }, -- cssMarqueeProp xxx links to cssProp
    cssPagedMediaProp                                         { cssProp }, -- cssPagedMediaProp xxx links to cssProp
    cssPrintProp                                              { cssProp }, -- cssPrintProp   xxx links to cssProp
    cssRubyProp                                               { cssProp }, -- cssRubyProp    xxx links to cssProp
    cssSpeechProp                                             { cssProp }, -- cssSpeechProp  xxx links to cssProp
    cssRenderProp                                             { cssProp }, -- cssRenderProp  xxx links to cssProp
    markdownBlockquote                                        { fg="#7d828d", }, -- markdownBlockquote xxx guifg=#7D828D
    markdownRule                                              { markdownBlockquote }, -- markdownRule   xxx links to markdownBlockquote
    markdownHeadingRule                                       { markdownBlockquote }, -- markdownHeadingRule xxx links to markdownBlockquote
    markdownListMarker                                        { fg="#e06c75", }, -- markdownListMarker xxx guifg=#e06c75
    markdownOrderedListMarker                                 { markdownListMarker }, -- markdownOrderedListMarker xxx links to markdownListMarker
    markdownItalic                                            { fg="#c678dd", }, -- markdownItalic xxx guifg=#c678dd
    markdownItalicDelimiter                                   { markdownItalic }, -- markdownItalicDelimiter xxx links to markdownItalic
    markdownBold                                              { fg="#d19a66", }, -- markdownBold   xxx guifg=#d19a66
    markdownBoldDelimiter                                     { markdownBold }, -- markdownBoldDelimiter xxx links to markdownBold
    markdownLinkDelimiter                                     { fg="#c678dd", }, -- markdownLinkDelimiter xxx guifg=#c678dd
    markdownUrl                                               { fg="#56b6c2", }, -- markdownUrl    xxx guifg=#56b6c2
    markdownAutomaticLink                                     { markdownUrl }, -- markdownAutomaticLink xxx links to markdownUrl
    markdownIdDeclaration                                     { fg="#61afef", }, -- markdownIdDeclaration xxx guifg=#61afef
    markdownId                                                { fg="#c678dd", gui="bold,italic", }, -- markdownId     xxx gui=bold,italic guifg=#c678dd
    markdownIdDelimiter                                       { markdownId }, -- markdownIdDelimiter xxx links to markdownId
    BufferLineDevIconLuaSelected                              { bg="#282c34", fg="#51a0cf", }, -- BufferLineDevIconLuaSelected xxx guifg=#51a0cf guibg=#282c34
    lualine_y_DevIconLua_normal                               { bg="#262626", fg="#51a0cf", }, -- lualine_y_DevIconLua_normal xxx guifg=#51a0cf guibg=#262626
    lualine_y_DevIconLua_insert                               { bg="#262626", fg="#51a0cf", }, -- lualine_y_DevIconLua_insert xxx guifg=#51a0cf guibg=#262626
    lualine_y_DevIconLua_visual                               { bg="#262626", fg="#51a0cf", }, -- lualine_y_DevIconLua_visual xxx guifg=#51a0cf guibg=#262626
    lualine_y_DevIconLua_replace                              { bg="#262626", fg="#51a0cf", }, -- lualine_y_DevIconLua_replace xxx guifg=#51a0cf guibg=#262626
    lualine_y_DevIconLua_command                              { bg="#262626", fg="#51a0cf", }, -- lualine_y_DevIconLua_command xxx guifg=#51a0cf guibg=#262626
    lualine_y_DevIconLua_terminal                             { bg="#262626", fg="#51a0cf", }, -- lualine_y_DevIconLua_terminal xxx guifg=#51a0cf guibg=#262626
    lualine_y_DevIconLua_inactive                             { bg="#569cd6", fg="#51a0cf", }, -- lualine_y_DevIconLua_inactive xxx guifg=#51a0cf guibg=#569CD6
    cssInclude                                                { fg="#abb2bf", }, -- cssInclude     xxx guifg=#abb2bf
    ToggleTerm                                                { bg="#282c34", fg="#abb2bf", }, -- ToggleTerm     xxx guifg=#abb2bf guibg=#282c34
    LspDiagnosticsDefaultInformation                          { fg="#61afef", }, -- LspDiagnosticsDefaultInformation xxx guifg=#61afef
    DiagnosticInformation                                     { LspDiagnosticsDefaultInformation }, -- DiagnosticInformation xxx links to LspDiagnosticsDefaultInformation
    LspDiagnosticsSignInformation                             { LspDiagnosticsDefaultInformation }, -- LspDiagnosticsSignInformation xxx links to LspDiagnosticsDefaultInformation
    LspDiagnosticsVirtualTextInformation                      { LspDiagnosticsDefaultInformation }, -- LspDiagnosticsVirtualTextInformation xxx links to LspDiagnosticsDefaultInformation
    javaScriptRequire                                         { fg="#56b6c2", }, -- javaScriptRequire xxx guifg=#56b6c2
    jsArrowFunction                                           { fg="#c678dd", gui="bold,italic", }, -- jsArrowFunction xxx gui=bold,italic guifg=#c678dd
    jsClassMethodType                                         { jsArrowFunction }, -- jsClassMethodType xxx links to jsArrowFunction
    jsClassKeyword                                            { jsArrowFunction }, -- jsClassKeyword xxx links to jsArrowFunction
    jsExport                                                  { jsArrowFunction }, -- jsExport       xxx links to jsArrowFunction
    jsFunction                                                { jsArrowFunction }, -- jsFunction     xxx links to jsArrowFunction
    jsDocParam                                                { fg="#61afef", }, -- jsDocParam     xxx guifg=#61afef
    jsFuncCall                                                { fg="#61afef", }, -- jsFuncCall     xxx guifg=#61afef
    jsGenerator                                               { fg="#e5c07b", }, -- jsGenerator    xxx guifg=#e5c07b
    jsGlobalObjects                                           { jsGenerator }, -- jsGlobalObjects xxx links to jsGenerator
    jsNull                                                    { fg="#d19a66", }, -- jsNull         xxx guifg=#d19a66
    jsOperator                                                { fg="#c678dd", }, -- jsOperator     xxx guifg=#c678dd
    jsSuper                                                   { fg="#e06c75", }, -- jsSuper        xxx guifg=#e06c75
    jsTemplateBraces                                          { fg="#e06c75", }, -- jsTemplateBraces xxx guifg=#e06c75
    jsTemplateVar                                             { fg="#98c379", }, -- jsTemplateVar  xxx guifg=#98c379
    jsThis                                                    { fg="#e06c75", }, -- jsThis         xxx guifg=#e06c75
    jsUndefined                                               { fg="#d19a66", }, -- jsUndefined    xxx guifg=#d19a66
    jsonCommentError                                          { fg="#abb2bf", }, -- jsonCommentError xxx guifg=#abb2bf
    jsonKeyword                                               { fg="#e06c75", }, -- jsonKeyword    xxx guifg=#e06c75
    jsonMissingCommaError                                     { fg="#e06c75", gui="reverse", }, -- jsonMissingCommaError xxx gui=reverse guifg=#e06c75
    jsonSemicolonError                                        { jsonMissingCommaError }, -- jsonSemicolonError xxx links to jsonMissingCommaError
    jsonStringSQError                                         { jsonMissingCommaError }, -- jsonStringSQError xxx links to jsonMissingCommaError
    jsonNumError                                              { jsonMissingCommaError }, -- jsonNumError   xxx links to jsonMissingCommaError
    jsonNoQuotesError                                         { jsonMissingCommaError }, -- jsonNoQuotesError xxx links to jsonMissingCommaError
    pythonNone                                                { fg="#e5c07b", }, -- pythonNone     xxx guifg=#e5c07b
    pythonBoolean                                             { pythonNone }, -- pythonBoolean  xxx links to pythonNone
    pythonClass                                               { fg="#e5c07b", }, -- pythonClass    xxx guifg=#e5c07b
    pythonParens                                              { fg="#e06c75", }, -- pythonParens   xxx guifg=#e06c75
    pythonBuiltinObj                                          { fg="#56b6c2", }, -- pythonBuiltinObj xxx guifg=#56b6c2
    pythonSpaceError                                          { bg="#e06c75", fg="#abb2bf", }, -- pythonSpaceError xxx guifg=#abb2bf guibg=#e06c75
    pythonString                                              { fg="#98c379", }, -- pythonString   xxx guifg=#98c379
    pythonDot                                                 { fg="#abb2bf", }, -- pythonDot      xxx guifg=#abb2bf
    pythonImport                                              { fg="#c678dd", gui="bold,italic", }, -- pythonImport   xxx gui=bold,italic guifg=#c678dd
    pythonRepeat                                              { pythonImport }, -- pythonRepeat   xxx links to pythonImport
    pythonStatement                                           { pythonImport }, -- pythonStatement xxx links to pythonImport
    pythonOperator                                            { pythonImport }, -- pythonOperator xxx links to pythonImport
    rubyBlockParameter                                        { fg="#e06c75", }, -- rubyBlockParameter xxx guifg=#e06c75
    rubyBlockParameterList                                    { rubyBlockParameter }, -- rubyBlockParameterList xxx links to rubyBlockParameter
    rubyClass                                                 { fg="#c678dd", gui="bold,italic", }, -- rubyClass      xxx gui=bold,italic guifg=#c678dd
    rubyControl                                               { rubyClass }, -- rubyControl    xxx links to rubyClass
    rubyConstant                                              { fg="#e5c07b", }, -- rubyConstant   xxx guifg=#e5c07b
    rubyEscape                                                { fg="#e06c75", }, -- rubyEscape     xxx guifg=#e06c75
    rubyFunction                                              { fg="#61afef", }, -- rubyFunction   xxx guifg=#61afef
    rubyGlobalVariable                                        { fg="#e06c75", }, -- rubyGlobalVariable xxx guifg=#e06c75
    rubyIncluderubyGlobalVariable                             { rubyGlobalVariable }, -- rubyIncluderubyGlobalVariable xxx links to rubyGlobalVariable
    rubyInstanceVariable                                      { rubyGlobalVariable }, -- rubyInstanceVariable xxx links to rubyGlobalVariable
    rubyInclude                                               { fg="#61afef", }, -- rubyInclude    xxx guifg=#61afef
    rubyInterpolation                                         { fg="#56b6c2", }, -- rubyInterpolation xxx guifg=#56b6c2
    rubyInterpolationDelimiter                                { fg="#e06c75", }, -- rubyInterpolationDelimiter xxx guifg=#e06c75
    rubyRegexp                                                { fg="#56b6c2", }, -- rubyRegexp     xxx guifg=#56b6c2
    rubyRegexpDelimiter                                       { rubyRegexp }, -- rubyRegexpDelimiter xxx links to rubyRegexp
    rubyStringDelimiter                                       { fg="#98c379", }, -- rubyStringDelimiter xxx guifg=#98c379
    rubySymbol                                                { fg="#56b6c2", }, -- rubySymbol     xxx guifg=#56b6c2
    sassidChar                                                { fg="#e06c75", }, -- sassidChar     xxx guifg=#e06c75
    sassClassChar                                             { fg="#d19a66", }, -- sassClassChar  xxx guifg=#d19a66
    sassInclude                                               { fg="#c678dd", gui="bold,italic", }, -- sassInclude    xxx gui=bold,italic guifg=#c678dd
    sassMixing                                                { sassInclude }, -- sassMixing     xxx links to sassInclude
    scssExtend                                                { sassInclude }, -- scssExtend     xxx links to sassInclude
    scssImport                                                { sassInclude }, -- scssImport     xxx links to sassInclude
    sassMixinName                                             { fg="#61afef", }, -- sassMixinName  xxx guifg=#61afef
    scssSelectorName                                          { fg="#d19a66", }, -- scssSelectorName xxx guifg=#d19a66
    StartifyBracket                                           { fg="#abb2bf", }, -- StartifyBracket xxx guifg=#abb2bf
    StartifyFile                                              { fg="#c678dd", }, -- StartifyFile   xxx guifg=#c678dd
    StartifyFooter                                            { fg="#abb2bf", }, -- StartifyFooter xxx guifg=#abb2bf
    StartifyHeader                                            { fg="#98c379", }, -- StartifyHeader xxx guifg=#98c379
    StartifyNumber                                            { fg="#e5c07b", }, -- StartifyNumber xxx guifg=#e5c07b
    StartifyPath                                              { fg="#5c6370", }, -- StartifyPath   xxx guifg=#5c6370
    StartifySection                                           { fg="#61afef", gui="bold,italic", }, -- StartifySection xxx gui=bold,italic guifg=#61afef
    StartifySelect                                            { fg="#56b6c2", }, -- StartifySelect xxx guifg=#56b6c2
    StartifySlash                                             { fg="#5c6370", }, -- StartifySlash  xxx guifg=#5c6370
    StartifySpecial                                           { fg="#e06c75", }, -- StartifySpecial xxx guifg=#e06c75
    MarkSignHL                                                { fg="#c678dd", }, -- MarkSignHL     xxx guifg=#c678dd
    MarkVirtTextHL                                            { fg="#5c6370", }, -- MarkVirtTextHL xxx guifg=#5c6370
    UltestPass                                                { fg="#98c379", }, -- UltestPass     xxx guifg=#98c379
    UltestFail                                                { fg="#e06c75", }, -- UltestFail     xxx guifg=#e06c75
    UltestRunning                                             { fg="#e5c07b", }, -- UltestRunning  xxx guifg=#e5c07b
    UltestBorder                                              { fg="#7d828d", }, -- UltestBorder   xxx guifg=#7D828D
    UltestInfo                                                { fg="#c678dd", }, -- UltestInfo     xxx guifg=#c678dd
    BufferTabpageFill                                         { fg="#282c34", }, -- BufferTabpageFill xxx guifg=#282c34
    TroubleCount                                              { fg="#c678dd", }, -- TroubleCount   xxx guifg=#c678dd
    TroubleFile                                               { fg="#56b6c2", }, -- TroubleFile    xxx guifg=#56b6c2
    TroubleFoldIcon                                           { fg="#abb2bf", }, -- TroubleFoldIcon xxx guifg=#abb2bf
    TroubleLocation                                           { fg="#56b6c2", }, -- TroubleLocation xxx guifg=#56b6c2
    LspSagaDiagnosticHeader                                   { fg="#c678dd", }, -- LspSagaDiagnosticHeader xxx guifg=#c678dd
    TargetFileName                                            { fg="#7d828d", }, -- TargetFileName xxx guifg=#7D828D
    LspSagaRenamePromptPrefix                                 { fg="#c678dd", }, -- LspSagaRenamePromptPrefix xxx guifg=#c678dd
    AerialClass                                               { fg="#c678dd", gui="bold,italic", }, -- AerialClass    xxx gui=bold,italic guifg=#c678dd
    LspDiagnosticsDefaultWarning                              { fg="#e5c07b", }, -- LspDiagnosticsDefaultWarning xxx guifg=#e5c07b
    DiagnosticWarning                                         { LspDiagnosticsDefaultWarning }, -- DiagnosticWarning xxx links to LspDiagnosticsDefaultWarning
    LspDiagnosticsSignWarning                                 { LspDiagnosticsDefaultWarning }, -- LspDiagnosticsSignWarning xxx links to LspDiagnosticsDefaultWarning
    LspDiagnosticsVirtualTextWarning                          { LspDiagnosticsDefaultWarning }, -- LspDiagnosticsVirtualTextWarning xxx links to LspDiagnosticsDefaultWarning
    LspDiagnosticsDefaultHint                                 { fg="#56b6c2", }, -- LspDiagnosticsDefaultHint xxx guifg=#56b6c2
    LspDiagnosticsSignHint                                    { LspDiagnosticsDefaultHint }, -- LspDiagnosticsSignHint xxx links to LspDiagnosticsDefaultHint
    LspDiagnosticsVirtualTextHint                             { LspDiagnosticsDefaultHint }, -- LspDiagnosticsVirtualTextHint xxx links to LspDiagnosticsDefaultHint
    LspDiagnosticsUnderlineError                              { fg="#e06c75", }, -- LspDiagnosticsUnderlineError xxx guifg=#e06c75
    LspDiagnosticsUnderlineWarning                            { fg="#e5c07b", }, -- LspDiagnosticsUnderlineWarning xxx guifg=#e5c07b
    LspDiagnosticsUnderlineInformation                        { fg="#61afef", }, -- LspDiagnosticsUnderlineInformation xxx guifg=#61afef
    NotifyERRORBorder                                         { fg="#e06c75", }, -- NotifyERRORBorder xxx guifg=#e06c75
    NotifyERRORIcon                                           { fg="#e06c75", }, -- NotifyERRORIcon xxx guifg=#e06c75
    NotifyERRORTitle                                          { fg="#e06c75", gui="italic", }, -- NotifyERRORTitle xxx gui=italic guifg=#e06c75
    NotifyWARNBorder                                          { fg="#e5c07b", }, -- NotifyWARNBorder xxx guifg=#e5c07b
    NotifyWARNIcon                                            { fg="#e5c07b", }, -- NotifyWARNIcon xxx guifg=#e5c07b
    NotifyWARNTitle                                           { fg="#e5c07b", gui="italic", }, -- NotifyWARNTitle xxx gui=italic guifg=#e5c07b
    packerFail                                                { fg="#e06c75", }, -- packerFail     xxx guifg=#e06c75
    packerSuccess                                             { fg="#98c379", }, -- packerSuccess  xxx guifg=#98c379
    packerWorking                                             { fg="#e5c07b", }, -- packerWorking  xxx guifg=#e5c07b
    packerOutput                                              { fg="#61afef", }, -- packerOutput   xxx guifg=#61afef
    packerStatusFail                                          { fg="#e06c75", }, -- packerStatusFail xxx guifg=#e06c75
    packerStatusSuccess                                       { fg="#98c379", }, -- packerStatusSuccess xxx guifg=#98c379
    NotifyTRACEBorder                                         { fg="#d19a66", }, -- NotifyTRACEBorder xxx guifg=#d19a66
    NotifyTRACEIcon                                           { fg="#d19a66", }, -- NotifyTRACEIcon xxx guifg=#d19a66
    NotifyTRACETitle                                          { fg="#d19a66", gui="italic", }, -- NotifyTRACETitle xxx gui=italic guifg=#d19a66
    ToggleTermBorder                                          { fg="#5c6370", }, -- ToggleTermBorder xxx guifg=#5c6370
    IndentLine                                                { fg="#373b42", }, -- IndentLine     xxx guifg=#373B42
    IndentBlanklineChar                                       { IndentLine }, -- IndentBlanklineChar xxx links to IndentLine
    IndentBlanklineSpaceChar                                  { IndentLine }, -- IndentBlanklineSpaceChar xxx links to IndentLine
    IndentBlanklineSpaceCharBlankline                         { IndentLine }, -- IndentBlanklineSpaceCharBlankline xxx links to IndentLine
    IndentBlanklineContextChar                                { fg="#c678dd", }, -- IndentBlanklineContextChar xxx guifg=#c678dd
    IndentBlanklineContextStart                               { gui="underline", }, -- IndentBlanklineContextStart xxx gui=underline
    NvimTreeExecFile                                          { fg="#98c379", }, -- NvimTreeExecFile xxx guifg=#98c379
    rainbowcol7                                               { fg="#c678dd", }, -- rainbowcol7    xxx guifg=#c678dd
    rainbowcol6                                               { fg="#56b6c2", }, -- rainbowcol6    xxx guifg=#56b6c2
    rainbowcol5                                               { fg="#61afef", }, -- rainbowcol5    xxx guifg=#61afef
    HlSearchNear                                              { bg="#e2be7d", fg="#282c34", }, -- HlSearchNear   xxx guifg=#282c34 guibg=#e2be7d
    HlSearchFloat                                             { HlSearchNear }, -- HlSearchFloat  xxx links to HlSearchNear
    HlSearchLensNear                                          { HlSearchNear }, -- HlSearchLensNear xxx links to HlSearchNear
    NvimTreeYamlIcon                                          { fg="#e5c07b", }, -- NvimTreeYamlIcon xxx guifg=#e5c07b
    NvimTreeEmptyFolderName                                   { fg="#7d828d", }, -- NvimTreeEmptyFolderName xxx guifg=#7D828D
    jsonString                                                { fg="#98c379", }, -- jsonString     xxx guifg=#98c379
    NvimTreeGitignoreIcon                                     { fg="#e06c75", }, -- NvimTreeGitignoreIcon xxx guifg=#e06c75
    NvimTreeJsonIcon                                          { fg="#98c379", }, -- NvimTreeJsonIcon xxx guifg=#98c379
    NvimTreeLicenseIcon                                       { fg="#e5c07b", }, -- NvimTreeLicenseIcon xxx guifg=#e5c07b
    jsonQuote                                                 { fg="#abb2bf", }, -- jsonQuote      xxx guifg=#abb2bf
    NvimTreeFolderIcon                                        { fg="#c678dd", }, -- NvimTreeFolderIcon xxx guifg=#c678dd
    DapUIWatchesError                                         { fg="#e06c75", }, -- DapUIWatchesError xxx guifg=#e06c75
    DapUIWatchesValue                                         { fg="#e06c75", }, -- DapUIWatchesValue xxx guifg=#e06c75
    DapUIWatchesEmpty                                         { bg="#e06c75", fg="#282c34", }, -- DapUIWatchesEmpty xxx guifg=#282c34 guibg=#e06c75
    DapUIBreakpointsPath                                      { bg="#e5c07b", fg="#282c34", }, -- DapUIBreakpointsPath xxx guifg=#282c34 guibg=#e5c07b
    DapUISource                                               { fg="#c678dd", }, -- DapUISource    xxx guifg=#c678dd
    NvimTreeTomlIcon                                          { fg="#e5c07b", }, -- NvimTreeTomlIcon xxx guifg=#e5c07b
    NvimDapVirtualText                                        { fg="#56b6c2", }, -- NvimDapVirtualText xxx guifg=#56b6c2
    DebugHighlightLine                                        { fg="#c678dd", }, -- DebugHighlightLine xxx guifg=#c678dd
    HlSearchLens                                              { bg="#5c6370", }, -- HlSearchLens   xxx guibg=#5c6370
    NotifyDEBUGIcon                                           { fg="#c678dd", }, -- NotifyDEBUGIcon xxx guifg=#c678dd
    NotifyDEBUGTitle                                          { fg="#c678dd", gui="italic", }, -- NotifyDEBUGTitle xxx gui=italic guifg=#c678dd
    NotifyDEBUGBorder                                         { fg="#c678dd", }, -- NotifyDEBUGBorder xxx guifg=#c678dd
    NotifyINFOTitle                                           { fg="#61afef", gui="italic", }, -- NotifyINFOTitle xxx gui=italic guifg=#61afef
    NotifyINFOIcon                                            { fg="#61afef", }, -- NotifyINFOIcon xxx guifg=#61afef
    NotifyINFOBorder                                          { fg="#61afef", }, -- NotifyINFOBorder xxx guifg=#61afef
    DebugBreakpointLine                                       { fg="#e06c75", }, -- DebugBreakpointLine xxx guifg=#e06c75
    DebugHighlight                                            { fg="#61afef", }, -- DebugHighlight xxx guifg=#61afef
    DapUIScope                                                { bg="#61afef", fg="#282c34", }, -- DapUIScope     xxx guifg=#282c34 guibg=#61afef
    DapUIType                                                 { fg="#61afef", }, -- DapUIType      xxx guifg=#61afef
    DapUIDecoration                                           { fg="#61afef", }, -- DapUIDecoration xxx guifg=#61afef
    DapUIThread                                               { fg="#c678dd", }, -- DapUIThread    xxx guifg=#c678dd
    DapUIStoppedThread                                        { bg="#c678dd", fg="#282c34", }, -- DapUIStoppedThread xxx guifg=#282c34 guibg=#c678dd
    DapUIFrameName                                            { fg="#abb2bf", }, -- DapUIFrameName xxx guifg=#abb2bf
    DapUIBreakpointsInfo                                      { fg="#abb2bf", }, -- DapUIBreakpointsInfo xxx guifg=#abb2bf
    DapUIBreakpointsCurrentLine                               { fg="#e5c07b", }, -- DapUIBreakpointsCurrentLine xxx guifg=#e5c07b
    DapUIBreakpointsLine                                      { DapUIBreakpointsCurrentLine }, -- DapUIBreakpointsLine xxx links to DapUIBreakpointsCurrentLine
    jsDocTags                                                 { fg="#c678dd", }, -- jsDocTags      xxx guifg=#c678dd
    NvimTreeFolderName                                        { fg="#61afef", }, -- NvimTreeFolderName xxx guifg=#61afef
    NvimTreeLuaIcon                                           { fg="#61afef", }, -- NvimTreeLuaIcon xxx guifg=#61afef
    NvimTreeOpenedFolderName                                  { fg="#c678dd", }, -- NvimTreeOpenedFolderName xxx guifg=#c678dd
    NvimTreeOpenedFile                                        { fg="#c678dd", }, -- NvimTreeOpenedFile xxx guifg=#c678dd
    NvimTreePythonIcon                                        { fg="#e5c07b", }, -- NvimTreePythonIcon xxx guifg=#e5c07b
    NvimTreeShellIcon                                         { fg="#abb2bf", }, -- NvimTreeShellIcon xxx guifg=#abb2bf
    NvimTreeJavascriptIcon                                    { fg="#e5c07b", }, -- NvimTreeJavascriptIcon xxx guifg=#e5c07b
    NvimTreeCIcon                                             { fg="#61afef", }, -- NvimTreeCIcon  xxx guifg=#61afef
    NvimTreeReactIcon                                         { fg="#61afef", }, -- NvimTreeReactIcon xxx guifg=#61afef
    NvimTreeHtmlIcon                                          { fg="#e06c75", }, -- NvimTreeHtmlIcon xxx guifg=#e06c75
    NvimTreeRustIcon                                          { fg="#abb2bf", }, -- NvimTreeRustIcon xxx guifg=#abb2bf
    NvimTreeTypescriptIcon                                    { fg="#61afef", }, -- NvimTreeTypescriptIcon xxx guifg=#61afef
    NvimTreeVimIcon                                           { fg="#98c379", }, -- NvimTreeVimIcon xxx guifg=#98c379
    NvimTreeGitStaged                                         { fg="#e5c07b", }, -- NvimTreeGitStaged xxx guifg=#e5c07b
    NvimTreeGitMerge                                          { fg="#56b6c2", }, -- NvimTreeGitMerge xxx guifg=#56b6c2
    NvimTreeGitRenamed                                        { fg="#e5c07b", }, -- NvimTreeGitRenamed xxx guifg=#e5c07b
    NvimTreeMarkdownFile                                      { fg="#e06c75", }, -- NvimTreeMarkdownFile xxx guifg=#e06c75
    rainbowcol1                                               { fg="#e06c75", }, -- rainbowcol1    xxx guifg=#e06c75
    rainbowcol2                                               { fg="#e5c07b", }, -- rainbowcol2    xxx guifg=#e5c07b
    rainbowcol3                                               { fg="#d19a66", }, -- rainbowcol3    xxx guifg=#d19a66
    rainbowcol4                                               { fg="#98c379", }, -- rainbowcol4    xxx guifg=#98c379
    lualine_x_45_normal                                       { bg="#262626", fg="#ffffff", gui="bold", }, -- lualine_x_45_normal xxx gui=bold guifg=#ffffff guibg=#262626
    lualine_x_45_insert                                       { bg="#262626", fg="#ffffff", gui="bold", }, -- lualine_x_45_insert xxx gui=bold guifg=#ffffff guibg=#262626
    lualine_x_45_visual                                       { bg="#262626", fg="#ffffff", gui="bold", }, -- lualine_x_45_visual xxx gui=bold guifg=#ffffff guibg=#262626
    lualine_x_45_replace                                      { bg="#262626", fg="#ffffff", gui="bold", }, -- lualine_x_45_replace xxx gui=bold guifg=#ffffff guibg=#262626
    lualine_x_45_command                                      { bg="#262626", fg="#ffffff", gui="bold", }, -- lualine_x_45_command xxx gui=bold guifg=#ffffff guibg=#262626
    lualine_x_45_terminal                                     { bg="#262626", fg="#ffffff", gui="bold", }, -- lualine_x_45_terminal xxx gui=bold guifg=#ffffff guibg=#262626
    lualine_x_45_inactive                                     { bg="#262626", fg="#ffffff", gui="bold", }, -- lualine_x_45_inactive xxx gui=bold guifg=#ffffff guibg=#262626
  }
end)

return theme
