Benchmarks
==========

Setup:
- 100 boids
- Randomised initial model
- Run update function repeatedly using elm-benchmark

Results:
- Process all boids at once: 303.66 ops/sec
- Process only neighbours: 382.49 ops/sec
- Improvement: 26%


Initial vs Converged
--------------------
Slows down when converged, since groups of neighbours are bigger

Benchmark: Init
- mean ops/sec	377.51 (stddev: 18.45, 4.89%)
- mean runtime	2.655ms (stddev: 134.027ns, 5.05%)
- total runtime	5.019s
- sampling	63 runs of 30 calls

Benchmark: Converged
- mean ops/sec	271.66 (stddev: 13.18, 4.85%)
- mean runtime	3.69ms (stddev: 188.263ns, 5.1%)
- total runtime	5.092s
- sampling	46 runs of 30 calls
