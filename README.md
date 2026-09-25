# Humano vs Máquina

Pedra, papel e tesoura pela webcam contra uma IA que aprende o seu jeito de jogar.
Feito para a Feira de Profissões da USP (Computação).

- **Visão computacional:** o [MediaPipe](https://ai.google.dev/edge/mediapipe) reconhece o gesto da mão (✊ ✋ ✌️, e 👍 para começar).
- **Previsão:** a IA anota o que as pessoas jogam depois de ganhar, perder ou empatar, prevê a próxima jogada e escolhe o que vence ela, sempre **antes** de ver a sua mão.

Feito em HTML, CSS e JavaScript puro. A pasta `vendor/` traz a biblioteca e o modelo, então roda sem internet.

## Como rodar

Precisa de Python 3, uma webcam e o Chrome ou o Edge.

- **Windows:** dê dois cliques em `iniciar.bat`. Sem Python? Rode `winget install Python.Python.3.12`.
- **Linux / Mac:** rode `./iniciar.sh`.

Não abra o `index.html` com duplo clique: sem o servidor local, a câmera e a IA não carregam.

## Atalhos

| Tecla | Ação |
|---|---|
| Espaço | Começa uma partida (o mesmo que o 👍) |
| Shift+R | Zera o placar do dia e a memória da IA |
