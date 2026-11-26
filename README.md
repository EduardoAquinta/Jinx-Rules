# Jinx Rules

The only place to go for true Jinx rules.

This repo is the official rulebook for **Jinx**, the game you play when two people say or do the same thing at the same time. The first person to call out the right word wins.

## The rules

The full rules are in **[The_Rules.md](The_Rules.md)**. In short, there are five words, and each one covers a different kind of match:

| Word      | When to call it                                                                 |
|-----------|---------------------------------------------------------------------------------|
| **JINX!** | You both say the same real word at the same time.                               |
| **JONX!** | You both make the same sound, say the same made-up word, or say words with the same vowel sound. |
| **JUNX!** | You both had the same thought at the same time (you have to prove it).          |
| **JENX!** | You both make the same physical move at the same time.                          |
| **JANX!** | Someone watching spots a missed Jinx, Jonx, Junx or Jenx and steals the win.    |

See [The_Rules.md](The_Rules.md) for examples, tie-breakers and the finer points (yes, you can Janx a Janx).

## Repo layout

```
.
├── The_Rules.md                  # The rulebook
├── scripts/check-rules.sh        # Checks that all five words are in the rules
├── .githooks/pre-commit          # Runs the check before each commit
└── .github/workflows/check-rules.yml  # Runs the check on every push and PR
```

## Rules check

The rulebook must always include all five words as numbered entries (for example `1. JINX!`). A small script makes sure of it:

```sh
bash scripts/check-rules.sh The_Rules.md
```

It prints a ✓ for each word it finds and fails if any are missing.

The same check runs in two places:

- **GitHub Actions** runs it on every push and pull request.
- **A pre-commit hook** runs it on the staged copy of `The_Rules.md` before you commit. Turn it on once per clone with:

  ```sh
  git config core.hooksPath .githooks
  ```

## Contributing

Want to change the rules? Edit `The_Rules.md`, make sure the check passes, and open a pull request. Keep all five words in place or the check will block you.
