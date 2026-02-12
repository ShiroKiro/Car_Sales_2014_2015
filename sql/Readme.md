# Car Sales (2014–2015) — Price vs MMR Dashboard + SQL Analysis

## Goal
Analyze car auction sales to understand how **selling prices deviate from MMR** (Manheim Market Report estimate) and what factors influence that deviation:
- year / month trends
- make & model differences
- regional (state) patterns
- transmission effect
- car age effect

**Core metric**
- `Diff% = (SellingPrice - MMR) / MMR`

## Deliverables
1) **Power BI dashboard** (interactive analysis & filters)
2) **SQL mini-project** (business questions answered with SQL)

---

## Dataset
Source: `car_prices.csv` (raw)  
Prepared table: `car_sales` (cleaned)

**Rows:** 557,760  
**Date range:** 2014-01-01 09:15:00 → 2015-07-21 02:30:00

**Main columns**
- `sale_dt` (datetime), `sale_year`, `sale_month`
- `make`, `model`, `trim`, `body`, `state`, `transmission`
- `odometer`, `condition`
- `mmr`, `sellingprice`
- engineered: `car_age`, `price_diff`, `price_diff_pct`

---

## Data Preparation
High-level steps used before reporting:
- parsed `sale_dt` into datetime
- cast numeric columns (e.g., `mmr`, `sellingprice`, `odometer`, `condition`)
- created time features (`sale_year`, `sale_month`)
- engineered:
  - `car_age = sale_year - year`
  - `price_diff = sellingprice - mmr`
  - `price_diff_pct = (sellingprice - mmr) / mmr`

> Note: conclusions based on averages can be sensitive to outliers. Where possible, use minimum sample thresholds (N) for comparisons.

---

## Key Findings (from SQL)
### Overall deviation from MMR
- **2014 Avg Diff%:** **-1.59%**
- **2015 Avg Diff%:** **-0.68%**
Interpretation: selling prices are slightly below MMR on average, but the discount is smaller in 2015.

### Selling price vs MMR by year
- 2014: avg selling price **11,287.73**, avg MMR **11,567.30**
- 2015: avg selling price **13,870.60**, avg MMR **14,015.18**
Interpretation: both prices and MMR are higher in 2015; selling remains slightly below MMR.

### Share of sales above MMR
- **46.73%** of sales have `Diff% > 0` (sold above MMR).
Interpretation: ~53% of sales are below MMR, consistent with negative Avg Diff%.

### Car age effect (bucketed)
- **0–2 years:** -1.31%
- **3–5 years:** -0.96%
- **6–10 years:** -0.92%
- **11+ years:** -1.92%
Interpretation: very old cars (11+) show the largest average discount vs MMR.

### Regional differences (state)
Examples of positive Avg Diff%:
- `wa` **+4.52%** (N=7,400)
- `ga` **+3.55%** (N=34,654)

Examples of negative Avg Diff%:
- `nj` **-4.79%** (N=27,775)
- `wi` **-4.37%** (N=9,837)
Interpretation: pricing deviation is strongly region-dependent; always consider sample size.

### Transmission
- automatic: **-0.68%** (N=475,071)
- manual: **-2.89%** (N=17,505)
- unknown: **-0.89%** (N=65,184)
Interpretation: manual cars tend to sell further below MMR, but manual volume is much smaller.

### Top makes by volume
Top makes by count:
- Ford (93,396), Chevrolet (60,014), Nissan (53,901), Toyota (39,765), Dodge (30,648), Honda (27,135), ...

Interpretation: brand-level insights are most reliable for high-volume makes.

### Example: Toyota model-level (N ≥ 200)
Premium vs MMR:
- 4Runner (+1.81%), Tacoma (+1.38%), Highlander (+1.06%)

Discount vs MMR:
- Camry (-1.32%), Corolla (-1.60%), RAV4 (-0.76%)

Interpretation: within the same make, different models behave differently.

---

## Power BI Dashboard
Dashboard focuses on:
- KPI cards: Cars, Avg Selling Price, Avg MMR, Avg Diff%, Median Diff%
- scatter: Selling Price vs MMR
- bar charts: Avg Diff% by make/state
- line chart: Avg Diff% by car age
- time trend: Avg Diff% over time
- slicers: year, state, transmission, producer, make, model, trim, color, interior

File: `powerbi/Car_Sales_Dashboard.pbix` (name may vary)

---

## SQL Mini-Project
Location: `sql/`

Includes queries for:
- data range & size
- top makes / sellers
- Avg Diff% by year, month, state, transmission
- age-bucket analysis
- make/model deep-dives with minimum N thresholds

---

## How to Run
### Option A — DB Browser for SQLite (recommended)
1) Create new database: `car_sales.db`
2) Import `car_prices_clean.csv` as table `car_sales`
3) Run queries from `sql/queries.sql`

### Power BI
1) Open `powerbi/*.pbix`
2) If needed, refresh data source path to the cleaned CSV

---

## Repository Structure (recommended)
- `data/`
  - `car_prices_clean.csv` (or a sample if the file is too large)
  - `car_sales.db` (optional)
- `powerbi/`
  - `Car_Sales_Dashboard.pbix`
- `sql/`
  - `queries.sql`
  - `README.md`
- `images/`
  - dashboard screenshots
- `README.md`

---

## Notes / Limitations
- Some categories may contain `Unknown` values (e.g., transmission), which can affect segment comparisons.
- Avg Diff% can be influenced by outliers; consider robust statistics (median) in BI or Python when needed.
- Regional comparisons should use minimum sample thresholds to avoid noisy conclusions for small states.
