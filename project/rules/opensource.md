# Open-source & persona separation

- synapse-core, synapse-tg, synapse-wx are MIT repos.
- Code uses generic terms (user/assistant). Persona names, pet names, personal info live in config.toml, never hardcoded in .py.
- config.toml carries persona fields (user_name, assistant_name, ack style, prompt fragments). Code reads config, not identity.
- Channel-specific prompts (sticker rules, media protocol, ack tone) inject via provider constructor or config, not hardcoded in shared modules.
- Maintain README.md + COMMANDS.md for each repo — clone + token + config → working bridge, customisable without code changes.
- Before publishing: grep for persona leaks (proper nouns, pet names, addresses, phone, email).
