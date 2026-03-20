# 🛒 Clone Mercado Livre - Flutter

Um projeto desenvolvido em Flutter que simula a experiência de navegação e compra de produtos, inspirado no Mercado Livre.

---

## ✨ Funcionalidades

* 🔍 Busca de produtos
* 🧾 Listagem dinâmica de produtos
* ⭐ Sistema de avaliação com estrelas (MobX)
* 🛒 Adição de produtos ao carrinho
* 🔢 Badge com quantidade de itens no carrinho
* 🚚 Exibição de frete e condições de pagamento
* ⚡ Gerenciamento de estado com MobX

---

## 🧠 Arquitetura

O projeto utiliza:

* **MobX** → gerenciamento de estado reativo
* **GetIt** → injeção de dependência
* **Flutter** → UI moderna e responsiva

---

## 📱 Preview

> Interface inspirada no Mercado Livre com foco em usabilidade e organização de produtos.
<img width="200" height="380" alt="counterCart" src="https://github.com/user-attachments/assets/521eba23-c729-4ba4-b70a-5f0d278011d9" />
<img width="200" height="380" alt="rating" src="https://github.com/user-attachments/assets/6f0f859a-50cc-40b0-a329-2b3f29daddd4" />


---

## 🚀 Como rodar o projeto

```bash
# Clone o repositório
git clone <seu-repo>

# Entre na pasta
cd nome-do-projeto

# Instale as dependências
flutter pub get

# Rode o projeto
flutter run
```

---

## ⚙️ Gerar arquivos do MobX

```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

---

## 🧩 Estrutura do projeto

```
lib/
│
├── model/          # Modelos (Product)
├── store/          # Stores MobX (Home, Cart)
├── pages/          # Telas (Home, Carrinho)
├── widgets/        # Componentes reutilizáveis
```

---

## 💡 Destaques técnicos

* Uso de **ObservableList** para reatividade
* Separação clara entre UI e lógica
* Componentização de widgets
* Implementação de avaliação por estrelas sem libs externas

---

## 🛠️ Melhorias futuras

* 🌐 Integração com API real
* ❤️ Sistema de favoritos
* 🔐 Login de usuário
* 💳 Checkout completo
* ⭐ Avaliação persistida por usuário

---

## 👨‍💻 Autor

Desenvolvido por **Diego Lins**

---

## 📌 Observação

Este projeto tem fins educacionais e foi criado para praticar Flutter, MobX e boas práticas de arquitetura.

---

## ⭐ Se curtir o projeto...

Deixe uma estrela ⭐ no repositório!

