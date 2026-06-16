export class Produto {
  constructor(
    public nome: string,
    public preco: number
  ) {}

  toString(): string {
    return `${this.nome} - R$ ${this.preco.toFixed(2)}`;
  }
}
