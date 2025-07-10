### EDA Session 04

### 🔍 Handling Data Inconsistencies Using FuzzyWuzzy

Fuzzy matching is a powerful technique for dealing with inconsistent or messy text data. The `fuzzywuzzy` library in Python helps compare strings using Levenshtein Distance.

---

### ❓ Quiz or Reflection Questions

1. What is **Levenshtein Distance** and why is it used in FuzzyWuzzy?  
   
2. When should you prefer **fuzzy matching** over **exact matching**?  

3. What’s the difference between `ratio` and `token_sort_ratio`?  
  
4. How would you handle a **large dataset** where fuzzy matching is slow?  
  
---

#### 📦 Install the Library

```bash
pip install fuzzywuzzy[speedup]

from fuzzywuzzy import fuzz

# Compare two strings using partial_ratio
score = fuzz.partial_ratio("Apple Inc.", "Apple Incorporated")
print(score)  # Output: 88
```

#### Token Sort Ratio

```bash
from fuzzywuzzy import fuzz

# Token sort ratio ignores word order and compares sorted tokens
score = fuzz.token_sort_ratio("fried chicken spicy", "spicy chicken fried")
print(score)  # Output: 100
```

#### Fuzzy Matching in a List

```bash
from fuzzywuzzy import process

choices = ["KFC", "Burger King", "McDonald’s", "Pizza Hut"]
best_match = process.extractOne("McDonalds", choices)
print(best_match)  # Output: ('McDonald’s', 96)
```

---

#### ✅ Wrap-Up / Recap

- Fuzzy matching is essential for cleaning and unifying inconsistent text data.
- `fuzzywuzzy` uses **Levenshtein Distance** to score string similarity.
- Use different scoring methods like `ratio`, `partial_ratio`, and `token_sort_ratio` depending on the context.
- Always validate your matches with manual checks or confidence thresholds.

---

---

### ❓ Quiz or Reflection Questions

1. What is **Levenshtein Distance** and why is it used in FuzzyWuzzy?  
   → It measures how many edits are needed to turn one string into another. FuzzyWuzzy uses it to score similarity.

2. When should you prefer **fuzzy matching** over **exact matching**?  
   → When data is inconsistent, misspelled, or not standardized.

3. What’s the difference between `ratio` and `token_sort_ratio`?  
   → `ratio` compares strings as-is; `token_sort_ratio` ignores word order.

4. How would you handle a **large dataset** where fuzzy matching is slow?  
   → Use `python-Levenshtein`, filter candidates first, or apply parallel processing.
