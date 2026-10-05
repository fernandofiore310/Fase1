### O que é uma transação, e o que acontece com os dados se o programa cair entre dois INSERTs dela?
Uma transação é um grupo de operações em SQL que garantem a atomicidade, ou seja, ou todas as instruções do bloco são executadas ou nenhuma é.
Caso os dados do programa cairem entre dois INSERTS de uma transação, nenhum dos inserts vão ser executados. Vai ser executado um rollback, retornando a base para o estado que ela estava pré transação.

### Por que não se monta uma query concatenando texto com valores, e como o placeholder ? resolve isso?
Não se monta uma query concatenando com strings pois isso pode levar a duas coisas: erro de sintaxe, uma vez que o SQL usa aspas simples para saber onde comeca e termina um texto, logo, caso um nome tenha aspas simples por exemplo, o banco interpreta o restante do nome como um erro de sintaxe. O outro ponto é que caso alguem preencha essa string com um comando sql ou um -- para comentar, ele pode pular partes de autenticacao e coisas do tipo, deixando o banco bem inseguro.
O placeholder ? resolve isso pois com ele o banco, na hora da compilação, já sabe que deve esperar um valor que vai ser passado naquele lugar. Logo, quando o dado chega para o banco, ele o trata como uma string direto, idependente do que tiver escrito dentro.

### O que o commit() da conexão faz, e o que acontece com as suas alterações se você esquecer dele?
O commit salva/grava as alterações no banco de dados. Caso não se use ele, o sql vai rodar um rollback de segurança e todas as alterações daquela sessão serão perdidas.