# SimulacoesPedro

Este pacote contém a implementação básica de uma função de energia
potencial de um sistema bidimensional com estrutura de dados simples
a ser desenvolvida como parte da disciplina de Simulações Pandemia.

## Conteúdo

O conteúdo deste pacote foi criado a partir da implementação
[SimulacoesTemplate.jl](https://github.com/m3g/SimulacoesTemplate.jl)
e aperfeiçoado como parte de aprendizado da disciplina.

## Instale com:

```julia
] add https://github.com/pomcss/SimulacoesPedro.jl
```

## Uso elementar:

## Uso elementar:

```julia
julia> using SimulacoesPedro

julia> data = Data() # Default parameters
Data
  eps: Float64 5.0
  sig: Float64 0.5
  cutoff: Float64 2.0
  side: Float64 100.0
  N: Int64 10000
  eps4: Float64 20.0
  sig6: Float64 0.015625
  sig12: Float64 0.000244140625


julia> p = initial_point(data); # Initial point

julia> utotal(p,data) # Compute total energy
-7472.164849146468

julia> data = Data(sig=1.0) # Increase sigma, for example
Data
  eps: Float64 5.0
  sig: Float64 1.0
  cutoff: Float64 2.0
  side: Float64 100.0
  N: Int64 10000
  eps4: Float64 20.0
  sig6: Float64 1.0
  sig12: Float64 1.0


julia> utotal(p,data)
9323.71350809503
```
