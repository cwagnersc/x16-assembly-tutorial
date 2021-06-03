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
fazer o que quiser com os códigos de exemplo - é tudo [livre e código aberto](LICENSE)

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

## cc65 Option 1: Changing Path

Open up your Environment Variables control panel in your settings (you can find it by searching for "env"). Select the "Path" variable and click the "Edit..." button.

![Environment Variables control panel](env.png)

Then, in the editor dialog that pops up, add a new entry for your cc65/bin directory.
You can find it by clicking on the "Browse..." button.

![Path Editor](path.png)

Then click the "OK" button. You should be all set to run the cc65 tools from anywhere on Windows.
If your Cygwin Terminal was left open during this change, you will need to close it
and reopen it for the new environment to take effect.

## cc65 Option 2: Adding Symbolic Links

You can just add the cc65 tools that you need for the build as symbolic links to your Cygwin /usr/bin directory, which is already on the Cygwin bash path, but will not be on your general Windows
path.

Simply create the following links (you don't need to worry about superuser privileges in Cygwin):

```
$ cd /usr/bin
$ ln -s /cygdrive/c/Users/Fred/workspace/cc65/bin/ca65.exe
$ ln -s /cygdrive/c/Users/Fred/workspace/cc65/bin/cc65.exe
$ ln -s /cygdrive/c/Users/Fred/workspace/cc65/bin/cl65.exe
```

Your environment should be all set now.
You can go into any of the Lesson directories and build the code just as you
have seen it in the videos.

# Building with Debian/Ubuntu Linux

Chances are, you have most of what you need already in Linux, but to be sure,
you can install all of the required packages in one command:

```
$ sudo apt-get install git build-essential
```

Then, you should create a workspace directory to hold all of your local repo
clones, like ~/workspace.

```
$ cd
$ mkdir workspace
$ cd workspace
```

There, you can use git to clone this repository with the following command:

```
$ git clone https://github.com/SlithyMatt/x16-assembly-tutorial
```

You will also need to clone the cc65 repo:

```
$ git clone https://github.com/cc65/cc65.git
```

Now, you can first test your new build environment by building cc65:

```
$ cd cc65
$ make
```

This should create a "bin" subdirectory with all the cc65 tools you will need,
like ca65.exe. You will need to add this directory to your PATH by adding the following
line to ~/.bashrc:

```
export PATH=$PATH:$HOME/workspace/cc65/bin
```

To make this environment take hold, you will need to close and reopen your terminal.
Then you can go into any of the Lesson directories and build the code just as you
have seen it in the videos. **Please note** that if you already had the release
build of cc65 installed that it will not work with the build scripts here, as
they do not have X16 support built in. You will need to build the latest commit
yourself. When you do this, make sure that you uninstall the release build of
cc65 or at least remove it from your PATH. You should verify that the correct
version is going to run with this simple command:

```
which cl65
```

If this does not print out the location of the version you just built, you need
to get your PATH in the correct order.

# Installing the Commander X16 Emulator

You can download pre-built binaries from the official website: https://www.commanderx16.com/forum/files/

Or, you can build the emulator and the ROM image yourself from the GitHub repos:
- https://github.com/commanderx16/x16-emulator
- https://github.com/commanderx16/x16-rom

If you followed the instructions above to build and install gcc and cc65, you are all
set to build both of those repos already. **Please note** that building the Windows emulator
using Cygwin is not recommended, and at the very least requires additional
environmental setup. It is *highly* recommended to use the release build of the
Windows emulator or to use the cross-platform build environment on a Mac if you
absolutely need a custom build. Using
mingw32/64 on Linux has not been done successfully, either.

For convenience, I recommend putting the emulator directory on your path to make your
workflow exactly as seen in these videos.

# Further Reading

- https://en.wikipedia.org/wiki/Hexadecimal
- https://en.wikipedia.org/wiki/Endianness
- https://en.wikipedia.org/wiki/Computer_memory
- https://en.wikipedia.org/wiki/Boolean_algebra
- https://en.wikibooks.org/wiki/6502_Assembly   - Baseline 6502 instruction set
- http://www.6502.org/tutorials/65c02opcodes.html  - Additional instructions and addressing modes for 65C02
- https://atom.io/packages/language-65asm - 6502 assembly syntax highlighting for Atom
- https://style64.org/petscii/ - An interactive PETSCII table
