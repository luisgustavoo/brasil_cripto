# Brasil Cripto

[![Quality Gate Status](https://sonarcloud.io/api/project_badges/measure?project=luisgustavoo_brasil_cripto&metric=alert_status)](https://sonarcloud.io/summary/new_code?id=luisgustavoo_brasil_cripto) &nbsp;&nbsp;[![Quality gate](https://sonarcloud.io/api/project_badges/quality_gate?project=luisgustavoo_brasil_cripto)](https://sonarcloud.io/summary/new_code?id=luisgustavoo_brasil_cripto) &nbsp;&nbsp; [![SonarQube Cloud](https://sonarcloud.io/images/project_badges/sonarcloud-dark.svg)](https://sonarcloud.io/summary/new_code?id=luisgustavoo_brasil_cripto)




Aplicativo de consulta de cotações de criptomoedas desenvolvido como **teste técnico para a Brasil Card**.  
O app segue a arquitetura **MVVM**, seguindo recomendado na documentação oficial do Flutter: [App Architecture Guide](https://docs.flutter.dev/app-architecture).


![Veja o vídeo do app](docs/video.gif)

---

## 🚀 Funcionalidades

- Consulta de cotações de criptomoedas.
- Pesquisa por nome da moeda.
- Exibição de gráficos de preços históricos.
- Favoritar moedas para acesso rápido.
- Atualização dos dados em **tempo real**, refletindo mudanças nos preços das criptomoedas.
- Internacionalização(l10n).
- Testes unitários e de widget com Flutter Test.

![Teste de integração](docs/integration_test.gif)

---

## 🏗 Arquitetura

- **MVVM** (Model-View-ViewModel)
- ViewModels controlam a lógica de apresentação.
- Models representam dados de domínio.
- Views (Widgets) escutam mudanças via `Listenable` e `Stream`.
- Injeção de dependências via **GetIt** + **Injectable**.
- Commands para operações assíncronas com feedback de loading, sucesso e erro.

---

## ⚡ Tecnologias Utilizadas

- Flutter 3.x
- Dart
- GetIt (Injeção de dependências)
- Injectable (Geração de código para GetIt)
- GoRouter (Navegação)
- Envied (Variáveis de ambiente)
- CachedNetworkImage (Carregamento de imagens com cache)
- FL Chart (Gráficos de linha)
- Collection (Utilitários como `firstWhereOrNull`)
- Testes: Flutter Test, Mocktail, Fakes para API e SharedPreferences

---

## 🛠 Configuração de Ambiente

Este projeto utiliza **Envied** para gerenciamento de variáveis de ambiente.  

1. Crie um arquivo `.env` na raiz do projeto

```env
COINGECKO_API_KEY=YOUR_API_KEY_HERE
BASE_URL=https://api.coingecko.com/api/v3
```

2. Gere o código das variáveis de ambiente

```env
flutter pub run build_runner build --delete-conflicting-outputs
```

3. Instale as dependências

```env
flutter pub get
```

4. Execute o projeto

```env
flutter run
```


