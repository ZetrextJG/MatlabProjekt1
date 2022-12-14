tsv = """
  104.6172    43.5414    102.9718
   60.0645    18.1331    43.7300
   13.0980    3.0890    7.6609
    6.6113    1.5134    3.7681
    3.3210    0.7490    1.8687
    1.3321    0.2978    0.7438
    0.6666    0.1486    0.3713
    0.0667    0.0148    0.0371
"""

filt = [realLine for realLine in  tsv.splitlines() if realLine]
ns = [5, 10, 50, 100, 200, 500, 1000, 10_000]

for n, line in zip(ns, filt):
    values = line.strip().split("    ")
    print(f"\\hline {n:6} & {values[0]} & {values[1]} & {values[2]} \\\\")

