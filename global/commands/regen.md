---
description: Regenerate your previous reply with a materially different take on the user's most recent message.
---
Treat your previous assistant turn as if it never happened. Look at the user's most recent prompt and produce a fresh, materially different response — different angle, different wording, different concrete suggestions or examples. Do not reference the prior reply, do not apologize, do not narrate the regeneration. Just deliver the new reply in the current session's voice and language.

Constraints:
- No new tool calls unless the new reply genuinely needs them.
- The prior assistant turn stays in the jsonl on disk — this slash only changes what you say next, it cannot truncate cc's own session file. the user knows.
