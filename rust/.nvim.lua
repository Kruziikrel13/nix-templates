Sentinel.terminal.create_task("cargo build", "b", {
	name = "Build Rust Package",
	show = true,
})

Sentinel.terminal.create_task("cargo run", "r", {
	name = "Run Rust Package",
	show = true,
})
