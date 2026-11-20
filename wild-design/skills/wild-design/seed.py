import secrets
import sys
from pathlib import Path

lines = int(sys.argv[1]) if len(sys.argv) > 1 else 10
rng = secrets.SystemRandom()
words = rng.sample((Path(__file__).parent / "words.txt").read_text().split(), lines * 2)
for i in range(lines):
    print(" ".join(words[2 * i : 2 * i + rng.randint(1, 2)]))
