#' ---
#' title: "Estruturas de dados comuns"
#' output: html_notebook
#' ---
#' 
#' As estruturas de dados mais simples da linguagem R são as estruturas unidimencionais, conhecidas como vectors. Vector é a estrutura de dados fundamental da linguagem R, e possui duas formas: Vetores atômicos (atomic vectors) e listas.
#' 
#' - **Atomic Vector**: São vetores homogêneos, ou seja, sequências de elementos (componentes) de um mesmo tipo de dados.
#' - **List**: São vetores heterogêneos, permitindo a combinação de componentes de mesmo tipo de dados.
#' 
#' Apesar de ambos serem vetores, **atomic vectors** são informalmente chamados de vector, enquanto que listas unidimensionais são consideradas um tipo diferente.
#' 
#' ### Atomic Vectors
#' 
#' A forma mais simples de criar um atomic vector de elementos arbitrários é através da função c() (*combine*):
#' 
## ------------------------------------------------------------------------

# Combina todos os vetores atômicos em um único vetor
c(0, 1, 1, 2, 3, 5)

#' 
#' Na chamada acima, função retorna um vetor que é exibido na saída por não ser atribuído à uma variável. O prefixo [1] nesta saída indica o índice do primeiro componente exibido na linha. Percebam, com isso, que os vetores na linguagem R são indexados a partir de 1. Abaixo um exemplo com atribuição à variável:
#' 
## ------------------------------------------------------------------------

# A atribuição é na direção da seta =)
c(0, 1, 1, 2, 3, 5) -> init_fibonacci

#' 
#' Atomic vectors são estruturas planas, não permitindo que um vetor seja composto de outros vetores. O exemplo abaixo demonstra que a tentativa de aninhar vetores resulta em um vetor plano idêntico ao vetor criado no exemplo anterior.
#' 
## ------------------------------------------------------------------------
c(c(0), c(1), c(1, c(2, c(3, c(5)))))

#' 
#' Todo tipo de dado é tratado como um vetor atômico daquele tipo. A exibição de um tipo primitivo na saída padrão apresenta o mesmo prefixo [1] que os exemplos de vetores acima.
#' 
## ------------------------------------------------------------------------
42

#' 
## ------------------------------------------------------------------------
answer <- 42

# Exemplos de testes condicionais sobre os atributos de um vetor atômico numérico de tamanho 1
if(is.atomic(answer)) print("É atômico.")
if(is.numeric(answer)) print("É numérico")
if(length(answer) == 1) print("Tamanho 1") 

#' 
#' Os elementos de um vetor podem ser acessados através do índice, sempre lembrando que vetores em R são indexados a partir de 1.
#' 
## ------------------------------------------------------------------------

# O operador : cria uma sequência.
seq_10 <- 1:10
seq_10

# Quem é O Quinto Elemento deste vetor?
seq_10[5]

# Alguém arrisca dizer qual o resultado desta soma?
seq_10_from_2 <- seq_10 + 1

# Quem são os elementos maiores que 6?
seq_10_from_2 > 6
which(seq_10_from_2 > 6) # Índices

# Exiba-os, por favor :: a indexação também pode ser feita através de vetores lógicos, retornando todas as posições indexadas por TRUE
seq_10_from_2[seq_10_from_2 > 6]

v2 <- c(1, 11, 5, 14, 6, 8, 7)
v2[v2 > 6]


# Os 3 primeiros elementos, pela sua posição
seq_10_from_2[1:3]

#' 
#' O operador `:` e a função `seq` produzem o mesmo resultado quando a função `seq` é aplicada com os dois primeiros parâmetros informados. A função `seq` é mais flexível, conforme demonstrado no segundo exemplo de uso. Percebam que os parâmetros de uma função são nomeados e podem ser informados junto aos valores atribuídos na chamada da função. Esta é uma prática recomendada para clareza.
#' 
## ------------------------------------------------------------------------
if( identical( 1:10, seq(1, 10) )) print("São idênticos")

seq(from=0, to=10, by=2)

seq(from=0, to=5, by=.5)

#' 
#' ### Lists
#' 
#' Listas são criadas utilizando a função `list()`. Como ilustrado no exemplo abaixo, listas diferem de vetores por dois motivos:
#' 
#' 1. A inclusão de componentes de diferentes tipos de dados
#' 2. A possibilidade de aninhar outras estruturas
#' 
## ------------------------------------------------------------------------
namedlist <- list(7, '*', 6, '=', list(number=42), spelled="quarenta", "e", "dois")

# A função glimpse apresenta uma prévia do conteúdo da lista passada como parâmetro. A função `str` atende o mesmo propósito.
dplyr::glimpse(resposta)
str(resposta)

#' 
#' Listas, assim como vetores atômicos, também possuem tamanho. O tamanho da variável `resposta` é `length(resposta)` = `r length(resposta)`.
#' 
#' A indexação de um elemento de uma lista é um pouco diferente da indexação de vetores:
#' 
## ------------------------------------------------------------------------
length(resposta)
resposta[[3]]

#' 
#' Tanto listas quanto vetores podem ser indexados por meio de um vetor de índices, cujo resultado é um outro vetor ou lista contendo os componentes das referidas posições:
## ------------------------------------------------------------------------
resposta[2:4]

#' 
#' Além do acesso por índice, listas permitem nomear os elementos e acessá-los através deste nome:
#' 
## ------------------------------------------------------------------------
named_list <- list(number=42, spelled="quarenta e dois")
named_list$number
named_list$spelled

# Desta forma o conteúdo pode ser utilizado como uma variável
named_list$number * 2

