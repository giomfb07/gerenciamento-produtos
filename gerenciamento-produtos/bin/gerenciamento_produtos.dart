

class Produto {
  late final String nome;
  late final double preco;
  late int quantidadeEmEstoque;
  late String? descricao;

  Produto(this.nome,this.preco,this.quantidadeEmEstoque, [this.descricao]);

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


 bool vender(int quantidade) {
    if (quantidade <= 0) {
      print('Erro: Quantidade inválida para venda.');
      return false;
    }
    if (quantidade <= quantidadeEmEstoque) {
      quantidadeEmEstoque -= quantidade;
      print('$quantidade unidades de $nome vendidas.');
      return true;
    } else {
      print('Erro: Estoque insuficiente para vender $quantidade unidades de $nome.');
      return false;
    }
  }

  
  void reporEstoque(int quantidade) {
    if (quantidade <= 0) {
      print('Erro: Quantidade inválida para reposição.');
      return;
    }
    quantidadeEmEstoque += quantidade;
    print('$quantidade unidades de $nome repostas no estoque.');
  }
  
   void exibirDados() {
    print('Nome: $getNome, Preco: $getPreco, Quantidade: $getQuant, Descricao: $getDesc');
  }

}


void main(){
  
 Produto prod = Produto('Acucar',2.3,2, "esgotado");

  prod.reporEstoque(10);
  prod.vender(1);

  prod.exibirDados();

}