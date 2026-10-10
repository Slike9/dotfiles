local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
    s("sb", {
        t({
            "#!/usr/bin/env bash",
            "set -euo pipefail",
            "IFS=$'\\n\\t'",
            "",
            "",
        }),
        i(0)
    })
}
