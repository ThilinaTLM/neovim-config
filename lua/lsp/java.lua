
local function root_dir_matcher(fname)
    local util = require('lspconfig').util
    local root_files = {
        'mvnw',
        'gradlew',
        'pom.xml',
        '.git',
    }
    return util.root_pattern(unpack(root_files))(fname) or util.find_git_ancestor(fname) or util.path.dirname(fname)
end


local function lsp_configuration()
    return {
        cmd = {
            'jdtls'
        },
        root_dir = root_dir_matcher
    }
end

local jdtls_config = {
        cmd = {
            'jdtls'
        },
        root_dir = require('jdtls.setup').find_root({'.git', 'mvnw', 'gradlew', 'pom.xml'})
}
require('jdtls').start_or_attach(jdtls_config)

return {
    config = lsp_configuration,
    server = 'jdtls'
}
