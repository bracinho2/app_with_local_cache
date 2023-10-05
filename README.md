# app_with_local_cache

APP with local cache

## Definitions

Exemplo de aplicativo com serviço de cache local com o offline first;

Consiste em:

- Verificar se há disponibilidade de Internet no dispositivo do usuário;
- Armazenar uma cópia no cache local de uma requisição que foi concluída com sucesso no método GET;
-  Mostrar os dados cacheados caso o usuário não consiga realizar novo GET. Neste item o usuário deve ser avisado que sua conexão está offline.


- Recursos necessários
    - Serviço de Local Storage (SharedPreference);
    - Serviço de Remote Storage (API com Dio);
    - Serviço de Verificação de Conexão de Internet(Connectivity Plus + Check via Ping);
    - Injeção de dependência (Provider);
    - Roteamento (A definir);