# Mobile Challenge 20240202

## Arquitetura

        Arquitetura -> como o projeto é somente mobile, e não há web, nao há necessidade de um pacote de ui_core onde compartilha widgets
        .A mesma lógica serve para a gerencia de estado(Aplication)
        .para gerenciamente de estado: Bloc freezed em dependencies_core

        O main.dart  carrega a aplicação principal, onde sera carregado as configurações pelo application_start_config e app_page.
        dessa forma a aplicação fica modular e de facil compreendimento, evitando exceder muitas linhas.


## Gerenciamento de estado

        No gerenciamento de estado a melhor opção é usar BLoC/CUBIT.
        São boas opções para empacotar variaveis, como a lista de palavras principal.
        e serve para as regras de negócios de carregamento, autenticação e etc.

        o widget  inicial é a HomePageSelector, onde usaremos BlocConsumer para dar conta das paginas, e carregar a lista infinita de palavras.


