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

## Lista infinita
        
        A lista infinita será processada na instancia do MultiBlocProvider no app_page. "create: (context) => WordsListCubit()..loadWords()"
        Dessa forma conseguimos gerenciar o estado da HomePageSelector quando o processamento do json for concluido, emitir o estado novo, e puxar para pagina carregada.

## cache
        
        //TODO
        Para o cache, assim que uma palavra for pesquisada, salvamos ela com sharedPreferences em um localStorage para nao fazer requisição no banco de dados novamente.

## Palavras nullas ou inexistentes

        Para lidar com retornos vazios ou nulos -> um const factory com um dataclass empy caso o retorno for diferente de 200, e assim podemos checar a propriedade principal do retorno, e se for empty pode-se assumir que não existe



## Aviso

infelizmente não tive tempo pra terminar.
 Fiz a estrutura inicial, mas tive muitos problemas pessoais

        DEMONSTRAÇÃO : https://drive.google.com/file/d/1g5-wqP88l_On9ooBXZ22vgBxCaft1yJF/view?usp=sharing
