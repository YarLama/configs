return {
	settings = {
		yaml = {
			schemas = {
				["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*.yml",
			},
			format = { enabled = true },
			validate = true,
			hover = true,
			completion = true,
		},
	},
}
