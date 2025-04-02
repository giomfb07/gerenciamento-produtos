import 'dart:io';

class Produto {
  late final String nome;
  late final double preco;
  late int quantidadeEmEstoque;
  late String? descricao;

  Produto(this.nome, this.preco, this.quantidadeEmEstoque, [this.descricao]);

  get getNome => nome;
  void setNome(String novoNome) {
    nome = novoNome;
  }

  get getPreco => preco;
  void setPreco(double novoPreco) {
    preco = novoPreco;
  }

  get getQuant => quantidadeEmEstoque;
  void setQuant(int novaQuant) {
    quantidadeEmEstoque = novaQuant;
  }

  get getDesc => descricao;
  void setDesc(String novoDesc) {
    descricao = novoDesc;
  }

  void vender(int quantidade) {
    if (quantidade <= quantidadeEmEstoque) {
      quantidadeEmEstoque -= quantidade;
      print('$quantidade unidades de $nome vendidas.');
    } else {
      print('Erro: Estoque insuficiente para vender $quantidade unidades de $nome.');
    }
  }

  void reporEstoque(int quantidade) {
    if (quantidade <= 0) {
      print('Erro: Quantidade inválida para reposição.');
    } else {
      quantidadeEmEstoque += quantidade;
      print('$quantidade unidades de $nome repostas no estoque.');
    }
  }

  void exibirDados() {
    print('Produto: $getNome, Preço: $getPreco, Quantidade: $getQuant, Descrição: $getDesc');
  }
}

void main(List<String> arguments) {
  void enter() {
    stdin.readLineSync();
  }

  print('Seja bem-vindo ao gerenciamento de produtos');
  print(' ');

  print('Registre o nome do produto:');
  String? nome = stdin.readLineSync();
  if (nome == null) {
    print('Produto inválido! Tente novamente.');
    return;
  }


  print('Qual o preço?');
  String? preco = stdin.readLineSync();
  double precoValor = 0.0;
  if (preco != null) {
      precoValor = double.parse(preco);
  
  } else {
    print('Erro: Preço inválido!');
  
  }

  print('Qual a quantidade em estoque?');
  String? quantidade = stdin.readLineSync();
  int quantidadeEmEstoque = 0;
  if (quantidade != null) {
  
      quantidadeEmEstoque = int.parse(quantidade);
      
  } else {
    print('Erro: Quantidade inválida!');
 
  }

  Produto novoProduto = Produto(nome, precoValor, quantidadeEmEstoque);

  print('Produto: $nome');
  print('Pressione [ENTER] para continuar');
  enter();

  bool sair = false;
  while (!sair) {
   print('Oque você deseja fazer? \n 1-Venda \n 2-Repor estoque \n 3-Exibir info \n 4-Sair');
    String? escolha = stdin.readLineSync();

    switch (escolha) {
      case "1":
        print('Quantos produtos você quer vender?');
        String ven = stdin.readLineSync() ?? '';
        int valorVen = int.parse(ven);
        novoProduto.vender(valorVen);
        break;
      case "2":
        print('Quanto deseja repor?');
        String repor = stdin.readLineSync() ?? '';
        int valorRepor = int.parse(repor);
        novoProduto.reporEstoque(valorRepor);
        break;
      case "3":
        novoProduto.exibirDados();
        break;
      case "4":
        sair = true;
        break;
      default:
        print('Valor impossível, tente novamente.');
        break;
    }
  }

  enter();
}
