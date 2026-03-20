# app_clone_mercado_livre

## Getting Started

O aplicativo precisa conter:
● Uma página para listar os produtos
● Uma página para listar os produtos do carrinho de compras.
● Quando o app abrir deve aparecer um CircularProgressIndicator por
alguns segundos, simulando a busca de produtos em um banco de
dados.

● Deve ser utilizado o MobX
● Você deve listar exatamente 15 produtos
○ O preço de cada produto precisa ir aumentando conforme o
índice do produto, iniciando com o preço 599.99. Exemplo: o
primeiro produto vai ter um preço de 599.99, o segundoproduto um preço de 1199.98, o terceiro produto um preço de
1799.97 e assim por diante. Exatamente como está na imagem
da tela que precisa ser feita.
● Deve ser implementada uma regra para verificar se o produto já
está no carrinho de compras ou não.
○ Se o produto estiver no carrinho de compras, deve aparecer
um SnackBar na cor vermelha informando que o produto não
foi adicionado
○ Se o produto não estiver no carrinho de compras, deve
aparecer um SnackBar na cor amarela indicando que o
produto foi adicionado.
● Cada produto deve ter uma pontuação que será medida através de
5 ícones em forma de estrela. O app deve permitir que o usuário
altere a pontuação interagindo com os ícones.