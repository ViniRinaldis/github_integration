# Github Integration

## Mini Sistema para listar committers de um projeto

### Como usar:
* Primeiramente certifique-se que o arquivo `bin/committers_rank` possui permissão para execução, caso não tenha e o sistema utilizado seja UNIX rode o comando `chmod +x ./bin/committers_rank`

* para executar o arquivo é preciso passar dois parametros. Sendo eles o `nome da organização` e o `nome do projeto` respectivamente
exemplo: `./bin/committers_rank ViniRinaldis github_integration`.
Como saida terá: `github_integration_2018_08_31_00_14_47.txt criado com sucesso!`
e o arquivo `github_integration_2018_08_31_00_14_47.txt` conterá o ranking de commits por committer do projeto.
exemplo: 
```
Vinicius Rinaldis;;ViniRinaldis;https://avatars3.githubusercontent.com/u/15875781?v=4;5;
```
