@echo off
setlocal enabledelayedexpansion

set max_attempts=10

set /a number=%random% %% 100 + 1

:start_game
cls
echo ====================================
echo BEM-VINDO AO JOGO "ADIVINHE O NUMERO"!
echo ====================================
echo.
echo EU PENSEI EM UM NUMERO ENTRE 1 E 100.
echo TENTE ADIVINHA-LO EM %max_attempts% TENTATIVAS.
echo.
set attempts=0

:guess_loop
set /a attempts+=1
if !attempts! gtr %max_attempts% (
    echo VOCE EXCEDEU O LIMITE DE TENTATIVAS! O NÚMERO ERA %number%.
    goto end_game
)

set /p "guess=Tentativa !attempts! de %max_attempts%: "
if !guess!==%number% (
    echo PARABENS! VOCE ADIVINHOU O NUMERO EM !attempts! TENTATIVAS!
    goto end_game
) else (
    if !guess! lss %number% (
        echo O NUMERO E MAIOR QUE !guess!.
    ) else (
        echo O NUMERO E MENOR QUE !guess!.
    )
    goto guess_loop
)

:end_game
echo ====================================
echo FIM DO JOGO.
echo ====================================
set /p "play_again=DESEJA JOGAR NOVAMENTE? (S/N): "
if /i "!play_again!"=="S" (
    goto start_game
) else (
    echo OBRIGADO POR JOGAR! ATE A PROXIMA!
    timeout /t 3 /nobreak >nul
    exit
)
