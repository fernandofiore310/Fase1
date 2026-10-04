# Complexidade descreve como o tempo de execução cresce quando os dados crescem

import time
import bisect

# H5
# Feito em 14min24s
# Set sera mais rapido, visto que seu tempo de busca sera O(1) ja que ele acessa dados por hash, enquanto a lista sera O(n).

lista = list(range(1000000))
set1 = set(lista)
ns = list(range(1000001, 1001001))

inicio = time.perf_counter()

for n in ns:
    n in lista

fim = time.perf_counter()

tempo_total = fim - inicio
print(f"Tempo de busca na lista: {round(tempo_total, 7)} segundos")

inicio = time.perf_counter()

for n in ns:
    n in set1

fim = time.perf_counter()

tempo_total = fim - inicio
print(f"Tempo de busca no set: {round(tempo_total, 7)} segundos")

# H6
# Feito em 9min49s
# O mais rapido de longe eh o set, considerando que ele eh O(1), ou seja, idependentemente do tamanho dos dados, o tempo de execucao nao muda.
# O segundo mais rapido eh a busca binaria, visto que eh O(log n), e seu tempo cresce pouco quando o numero de dados cresce.
# Por fim, o da lista eh o mais longo, visto que o crescimento eh proporcional.

lista = list(range(1000000))
set1 = set(lista)
ns = list(range(1000001, 1001001))

inicio = time.perf_counter()

for n in ns:
    n in lista

fim = time.perf_counter()

tempo_total = fim - inicio
print(f"Tempo de busca na lista: {round(tempo_total, 7)} segundos")

inicio = time.perf_counter()

for n in ns:
    n in set1

fim = time.perf_counter()

tempo_total = fim - inicio
print(f"Tempo de busca no set: {round(tempo_total, 7)} segundos")

inicio = time.perf_counter()

for n in ns:
    posicao = bisect.bisect_left(lista, n)

    if posicao < len(lista) and lista[posicao] == n:
        pass

fim = time.perf_counter()

tempo_total = fim - inicio
print(f"Tempo da busca binaria: {round(tempo_total, 7)} segundos")
