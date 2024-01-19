实现顺序

0. Nand(默认提供)
1. Not -> Not16
2. And -> And16
3. Or -> Or8Way -> Or16
4. Xor
5. Mux -> Mux16 -> Mux4Way16 -> Mux8Way16
6. DMux -> DMux4Way -> DMux8Way