local opts = {}

opts.filetypes = { "rust" }
opts.root_dir = require("lspconfig.util").root_pattern("Cargo.toml")
opts.settings = {
	['rust_analyzer'] = {
		cargo = {
			allFeatures = true
		}
	}
}

return opts
