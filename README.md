# tutorial-assembly-x16

Um tutorial para aprender a Linguagem assembly 65C02 usando o Commander x16.

Este é um repositório contendo todo o material da minha série do YouTube. Agora
estão disponíveis as seguintes lições:

- Lição 1: O Básico
- lição 2: Modos de Endereçamento
- Lição 3: Ramificação e Subrotinas
- Lição 4: Aritmética e Lógica
- Lição 5: A Pilha
- Lição 6: Um Pouco Avançado
- Lição 7: O Resto
- Lição 8: Conheça o Kernal
- Lição 9: Olá, VERA!
- Lição 10: interrupções
- Lição 11: Matemática Avançada
- Lição 12: Ladrilhos
- Lição 13: Som PSG
- Lição 14: Mouse e Joystick
- Lição 15: Bitmaps
- Lição 16: Tudo no tempo
- Lição 17: Síntese FM
- Lição 18: Sprites

Mais a caminho

Cada lição tem seu próprio diretório aqui. por favor, sinta-se á vontade para
fazer o que quiser com os códigos de exemplo - é tudo [livre e de código aberto](LICENSE)

# Montando com Windows (Cygwin)

A cadeia de construção para este projeto necessita de um ambiente GNU, que é
nativamente disponível na maioria das plataforms Linux e Unix (inluindo Mac). Para
Windows, você precisará de um programa chamdo Cygwin que disponibilizará um espaço
de usuário GNU no Windows que dará um ambiente tipo Unix para desenvolvimento.

## Instalando e configurando Cygwin

Primeiro você precisa baixar o programa de setuo do Cygwin daqui:
https://cygwin.com/setup-x86_64.exe


Quando você executa o programa, ele perguntará a você quais pacotes vocẽ deseja instalar.
Tenha certeza que os seguintes pacotes estão selecionados:

- git
- gcc-core
- make

Então, quando o Cygwin estiver instalado, abra o programa Terminal Cygwin (você
pode especificar que quer colocar um atalho na sua área de trabalho durante a
instalação0 e mudar para qualquer diretório que quiser manter seu workspace.
No Cygwin, as letras dos drives também são diretórios de segundo nível, então
seu drive C é /cygdrive/c/ e o seu drive D é /cygdrive/d/, etc. Se meu nome
de usuário é **Fred** e eu quiser colocar um diretório "workspace" em meu
perfil ao lado do dietório "Documents", eu posso fazer o seguinte:

```
$ cd /cygdrive/c/Users/Fred
$ mkdir workspace
$ cd workspace
```

Lá, você pode usar o git para clonar este reposidtório com o seguinte comando:

```
$ git clone https://github.com/SlithyMatt/x16-assembly-tutorial.git
```

Você também precisará clonar o repositório cc65:


```
$ git clone https://github.com/cc65/cc65.git
```

Agora, primeiro você pode testar seu nome ambiente de montagem ao compilar o cc65:


```
$ cd cc65
$ make
```

Isso deve criar um subdiretório "bin" com todas as ferramentas cc65 que você precisará,
como ca65.exe. Você pode adicionar este diretório cc65/bin ao seu pah, ou adicionar
links simbólicos dentro do /usr/bin.

## cc65 Opção 1: Alterando o Path

Abra a tela de Variáveis de Ambiente do painel de controle em suas configurações (você pode encontrá-la pesquisando pot "ambiente"). Selecione a variável "Path" e clique no botão "Editar..."

![Variáveis de Ambiente painel de controle](env.png)

Então, no diálogo do editor que aparece, adicione uma nova entrada para o seu diretório cc65/bin.
Você pode encontrá-lo clicando no botão "Navegar...".

![Editor de Path](path.png)

Então clique no botão "OK". Você deve estar preparado para executar as ferramentas cc65 de qualquer lugar do Windows.
Se seu Terminal Cygwin foi deixado aberto durante esa mudança, você deve fechá-lo e reabrí-lo para que o novo ambiente tenha efeito.

## cc65 Opção 2: Adicionando Links Simbólicos

Você pode apenas adicionar as ferramentas cc65 que você precisa para construir os links simbólicos no diretório /usr/bin do seu Cygwin, que já está pronto no path do bash do Cygwin, mas não está no seu path geral do Windows.

Simplesmente crie os segunites links (você não precisa se preocupar com privilégios de super usuário no Cygwin):


```
$ cd /usr/bin
$ ln -s /cygdrive/c/Users/Fred/workspace/cc65/bin/ca65.exe
$ ln -s /cygdrive/c/Users/Fred/workspace/cc65/bin/cc65.exe
$ ln -s /cygdrive/c/Users/Fred/workspace/cc65/bin/cl65.exe
```

Seu ambiente deve estar todo configurado agora.
Você pode entrar no diretório de qualquer lição e construir o código da mesma
forma vista nos vídeos.

# Construindo com Linux Debian/Ubuntu

Provavelmente, você tem a maioria do que é necessário no Linux, mas para ter certeza,
você pode instalar todos os pacotes necessários em um comando:


```
$ sudo apt-get install git build-essential
```

Então você deve criar um diretório de workspace para guardar o clone de todo o seu 
repositório local, como ~/workspace.

```
$ cd
$ mkdir workspace
$ cd workspace
```

Então, você pode usar o git para clonar este repositório com o seguinte comando:


```
$ git clone https://github.com/SlithyMatt/x16-assembly-tutorial
```

Você também precisará clonar o repositório cc65:


```
$ git clone https://github.com/cc65/cc65.git
```

Agora, você primeiro pode testar seu novo ambiente de construção, construindo o cc65:


```
$ cd cc65
$ make
```

Isto deve criar um subdiretório "bin" com todas ferramentas cc65 que você precisará,
como ca65.exe. Vocẽ precisará adicionar este diretório em seu PATH adicionando a seguinte
linha ao ~/.bashrc:

```
export PATH=$PATH:$HOME/workspace/cc65/bin
```

Para fazer com que esse ambiente funcione, você precisará fechar e reabrir seu terminal.
Então você pode entrar no diretório de qualquer Lição e construir o código da mesma forma
vista nos vídeos. **Por favor, note** que se você já tiver o lançamento atual do cc65 instalado
que ele não funcionará com os scripts de construção aqui, já que o mesmo não tem suporte ao X16
embutido. Você mesmo precisará construir o último commit. Quando fizer isso tenha certeza de desinstalar
o cc65 previamente instalado ou ao menos removẽ-lo do do PATH. Você precisa verificar que a versão
correta será executadas com este simples comando:

```
which cl65
```

Se isso não imprimir a localização da versão que você construiu, você precisa
configurar o seu PATH corretamente.

# Instalando o Emulador do Commander X16

Você pode baixar binários pré-construídos do site oficial: https://www.commanderx16.com/forum/files/

Ou você mesmo pode construir o emulador e a imagem da ROM do repositório GitHub:
- https://github.com/commanderx16/x16-emulator
- https://github.com/commanderx16/x16-rom


Se você seguiu as instruções acima para construir e instalar o cc65, você está já pronto
para construir para ambos aqueles repositórios. **Por favor, note** que não é recomendável
construir o emulador para Windows usando o Cygwin, e pelo menos requer configuração adicional
do ambiente. É *altamente* recomendado usar a construção lançada do emulator para Windows ou
usar o ambiente construído em plataforma cruzada em um Mac se você precisar de uma construção
personalizada. usando mingw32/64 no Linux não tem sido bem-sucedido, de qualquer forma.

Para conveniência, recomendo colocar o diretório do emulador no seu path para fazer seu fluxo
de trabalho exatamente como visto nos vídeos.

# Leitura Adicional

- https://en.wikipedia.org/wiki/Hexadecimal
- https://en.wikipedia.org/wiki/Endianness
- https://en.wikipedia.org/wiki/Computer_memory
- https://en.wikipedia.org/wiki/Boolean_algebra
- https://en.wikibooks.org/wiki/6502_Assembly   - Baseline 6502 instruction set
- http://www.6502.org/tutorials/65c02opcodes.html  - Additional instructions and addressing modes for 65C02
- https://atom.io/packages/language-65asm - 6502 assembly syntax highlighting for Atom
- https://style64.org/petscii/ - An interactive PETSCII table
