local neogit = require("neogit")

neogit.setup({
    signs = {
        section = { "", "" },
        item = { "", "" },
        hunk = { "", "" },
    },
    integrations = {
        diffview = true
    }
})
